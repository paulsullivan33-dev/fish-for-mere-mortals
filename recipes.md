# Recipes

Short jobs, each built only from pieces
the earlier chapters verified. Unless a
recipe says otherwise, the transcripts
named are the lab's.

## An abbreviation set that survives

Chapter 8's lesson, applied. Put your
abbreviations in `~/.config/fish/config.fish`
as plain lines — the lab's example file
is `fish-lab/scripts/config.fish.example`:

```fish
abbr -a -- gst 'git status'
```

Add one per line as you invent them,
or let fish do the filing: define the
abbreviation in a session, then

```bash
abbr >> ~/.config/fish/config.fish
```

appends its `--show` line for you.
Check survival with a new shell:
`abbr --show` lists the set (transcript
`t08-abbreviations.txt`).

## A saved function: sizes of anything

Chapter 8's `sizes`, kept:

```fish
function sizes --description "Show the size of each file named"
    for f in $argv
        du -h $f
    end
end
```

`funcsave sizes` puts it in
`~/.config/fish/functions/sizes.fish`
(the lab's copy is
`fish-lab/scripts/sizes.fish`), and
from then on `sizes report.pdf data/`
works in every shell. Remove it by
deleting the file — nothing else keeps
a list (transcript `t07`).

## Completions for a program of yours

Chapter 6's pattern, at working size.
One file per program, named after it,
in `~/.config/fish/completions/`:

```fish
complete -c mytool -s h -l help -d "Show help"
complete -c mytool -l output -r -d "Where to write the result"
complete -c mytool -l verbose -d "Say more while working"
```

Test it the way the lab tests
everything in this area:
`complete --do-complete='mytool --'`.
Remember the fine print: the program
must exist on your PATH, or fish will
not load the file (transcript `t04`).

## Draft completions for everything with a man page

```bash
fish_update_completions
```

One command builds drafts for every
program whose man page it can read,
into `~/.local/share/fish/generated_completions/`.
Run it after installing something new
and documented. Then treat the drafts
as chapter 6 advises: where one
misleads, override it with a
hand-written file in your own
completions folder, which outranks the
generated one (transcript
`t05-generated-completions.txt` shows
both the draft and its one blemish).

## A prompt with a different shape

The prompt is a function; the web
tool's samples are finished versions
of it. To try one:

```bash
cp /usr/share/fish/tools/web_config/sample_prompts/arrow.fish \
    ~/.config/fish/functions/fish_prompt.fish
```

Open a new shell: the prompt has the
sample's shape. Delete the file and
the default returns (transcript
`t14-sample-prompt.txt`). Two cautions:
some samples draw with special glyphs
that need a font containing them, or
you will see boxes where the arrows
should be; and a `funcsave fish_prompt`
after editing your own version is the
same trick, pointed at your work
instead of a sample.

## A value every shell agrees on

Chapter 7's universal variables, aimed
at a real annoyance — two terminals,
one working directory that matters:

```bash
set -U project_home ~/work/big-project
```

Then, anywhere, any shell:

```bash
cd $project_home
```

Change it once, in any shell, and all
of them follow — the lab watched one
sleeping shell wake to another's edit
(transcript `t06-universal-variables.txt`).
Not for secrets, and not for anything
per-session; the chapter says why.

## Silence the greeting

One line, run once:

```bash
set -U fish_greeting ""
```

The welcome message is a variable,
and an empty one is a quiet shell.
(Universal, so it applies to every
session from then on — set it back to
any text to restore a greeting of
your own words.)

## Check a folder of fish before running any of it

The chapter 9 checks, swept across a
folder — for a `conf.d` collection or
a functions directory you just copied
from somewhere:

```bash
for f in ~/.config/fish/functions/*.fish
    fish --no-execute $f; or echo "PARSE FAILS: $f"
    fish_indent --check $f; or echo "UNTIDY: $f"
end
```

Nothing runs; everything is read.
Trust, but parse.
