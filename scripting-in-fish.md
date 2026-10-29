# Scripting in Fish

**Outcome: a fish script with a
shebang, parsed arguments, honest
error messages and honest exit codes —
and a clear head about when a script
should be fish at all.**

## The specimen

The lab's script is kept whole in
`fish-lab/scripts/wordcount.fish` and
was run in transcript
`t10-scripting.txt`. It counts the
words in the files it is named:

```fish
#!/usr/bin/env fish

argparse h/help 's/short' -- $argv
or exit 2

if set -q _flag_help
    echo "Usage: wordcount.fish [--short] FILE..."
    exit 0
end

if test (count $argv) -eq 0
    echo "wordcount.fish: no files named" >&2
    exit 2
end

set -l total 0
for file in $argv
    if not test -f $file
        echo "wordcount.fish: $file is not a file" >&2
        exit 1
    end
    set -l words (wc -w < $file | string trim)
    set total (math $total + $words)
    if not set -q _flag_short
        echo "$file: $words words"
    end
end

echo "total: $total words"
```

Made executable, it runs by its
shebang like any program:

```text
$ ./wordcount.fish sample.txt
sample.txt: 9 words
total: 9 words
```

## The pieces, in order

**`argparse`** is a builtin that gives
a script real option parsing in one
line: the spec `h/help 's/short'`
declares two flags, and afterwards
`_flag_help` / `_flag_short` variables
say which were given (`set -q` asks,
chapter 7). Bad options make
`argparse` complain and fail, and the
`or exit 2` idiom turns that into the
script's exit. Hand-rolled flag
parsing — the shifting, the case
statements — is simply absent from
fish scripting, and nothing misses it.

**Exit codes are a promise.** The
script returns 0 for success, 2 for
being called wrongly (including
`--help`, by its own choice), 1 for a
file that is not there — and the lab
ran all three (transcript `t10`).
Whatever calls your script — cron,
another script, a Makefile — reads
only that number. Fish helps you keep
the promise: a failing command
mid-script sets `$status`, and
`and`/`or` chains (chapter 5) make
the failure paths read like the
success paths.

**`status` is the script's mirror.**
Inside the run, `status
current-function` and `status
filename` report where execution is —
the lab's probe printed its own name
(transcript `t10`). Log messages that
name the function that produced them
are written with these, once, instead
of being typed wrong in forty places.

**The toolbox is builtins.** `string`
(trims, joins, splits, matches,
replaces), `math`, `count`, `test`,
`path` (for taking file names apart)
— most of what shell scripts reach
for `sed`, `awk` and `expr` to do is
already in the shell, typed uniformly
and behaving the same on every
machine fish runs on.

## Keeping a script tidy and honest

Two checks from chapter 3's tooling
belong in every fish script's life:

```bash
fish --no-execute wordcount.fish   # parses, runs nothing
fish_indent --check wordcount.fish # exits 1 if it would reformat
```

Both were run on the lab's scripts
(transcript `t03-fish-indent.txt`):
`--no-execute` is the syntax check,
and `fish_indent` — which also catches
parse errors, since it must parse to
format — keeps a project's fish in one
indentation style the way a formatter
does in any language. And the parse
errors themselves teach (chapter 5):
feed a script a bash assignment and
the message names the mistake and its
correction (transcript `t10`).

## When the script should not be fish

A fish script runs where fish is
installed and nowhere else. Its
shebang will not save it on a machine
— a server, a container, a colleague's
laptop — that has no fish. So the
steady rule of this guide:

- **For yourself and your machines:**
  fish, gladly. You get `argparse`,
  lists that behave, and errors that
  teach.
- **For anyone else, or any machine
  you do not control:** write bash,
  the dialect every Unix already
  speaks, and let fish be the shell
  you *type* while you write it.
  Chapter 11 compares the two on
  exactly this point.

Mixing is painless in one direction:
a fish session can run `bash script.sh`
all day, because a script is just a
program. The other direction is not
offered — fish does not read bash
configuration or bash function
libraries, and a bash script that
needs fish features should be
rewritten, not translated line by
line.

## The check

Save the specimen, make it
executable, and take its three exits:

```bash
chmod +x wordcount.fish
./wordcount.fish README.md   # 0
./wordcount.fish             # 2
./wordcount.fish /no/such    # 1
echo $status                 # (run in fish, right after the last)
```

Each status arriving as promised is
the chapter, demonstrated.
