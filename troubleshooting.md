# Troubleshooting

Symptoms first, causes underneath, in
the order a new fish user meets them.

## "Unsupported use of '='"

```text
fish: Unsupported use of '='. In fish, please use 'set NAME value'.
```

You typed a bash assignment. Fish
caught it before anything ran and
wrote the correction for you: `set
NAME value` (chapter 5). This is the
single most common first-day error,
and one of the few error messages in
computing that fully solves itself.

## My abbreviation vanished

You defined it with `abbr --add` in
one shell and it is gone in the next.
That is current fish working as
designed: since 3.6, abbreviations are
not saved anywhere automatically
(chapter 8, transcript `t08`). The fix
is one line in
`~/.config/fish/config.fish`:

```fish
abbr -a -- gst 'git status'
```

If it is listed by `abbr --show` in
the shell where you defined it but
never elsewhere, this is certainly the
cause.

## My completion file does nothing

Three causes, in order of likelihood
(the lab met the second one
personally, transcript `t04`):

1. **Wrong folder or name.** The file
   must be `~/.config/fish/completions/<command>.fish`,
   named after the command exactly.
2. **The command does not exist.**
   Fish loads a completion file only
   for commands it can find on the
   PATH. Install the program (or fix
   the PATH) and the same file starts
   working untouched.
3. **It loaded, but says nothing for
   this context.** Ask directly:
   `complete --do-complete='cmd --'`
   and `complete -c cmd` to see what
   registered (chapter 6).

## A variable is not what I set

```bash
set --show NAME
```

Scope is the usual story: the report
says where the variable lives
(chapter 7). Set it in a function and
it was local; set it `-U` in another
shell and every shell shares it —
including being changed by another
shell while you work, which is a
feature until the day it looks like
this bug. `set --query NAME` settles
existence; `set --show` settles
everything else.

## A command says "Unknown command" but I saved it

```bash
type --path thecommand
```

If the answer is a file under
`~/.config/fish/functions/`, the
function exists and the failure is
inside it. If the answer is nothing,
the file is not there — `funcsave`
was never run, ran in a different
home, or the file was deleted
(chapter 8's delete test works both
ways). Status 127 is the fingerprint
of this whole class of failure
(transcript `t13`).

## PATH is missing my directory

Check the universal list first:

```bash
echo $fish_user_paths
```

If the directory is there but the
program still is not found, the issue
is the directory's contents, not fish.
If it is not there, `fish_add_path
~/bin` (chapter 7) — once. If you
have been appending PATH in
`config.fish` instead, open that file
and count how many times the
directory now appears; that growth is
the bug the tool exists to prevent.

## The prompt shows boxes and odd glyphs

A prompt sample (or theme) is drawing
characters your font does not have.
The shell is fine; the font is the
gap. Install a font with the symbols
the prompt uses, or delete
`~/.config/fish/functions/fish_prompt.fish`
and return to the default, which asks
nothing of fonts (chapter 10).

## `help` cannot format its pages

```text
Cannot format help; no parser found
```

Your system lacks the man-page
formatting machinery help shells out
to (the lab's stripped sandbox hit
exactly this). Nothing is wrong with
fish: the same documentation lives at
`https://fishshell.com/docs/current/`,
and `command --help`-style built-in
summaries like `abbr --help` still
work where `--help` is supported.
On a normal desktop install this does
not arise.

## fish_config starts, but nothing opens

Headless or browser-less machine: the
server prints its tokened address
(transcript `t11` shows both lines)
but there is no browser to send it
to. Either open that address from a
machine that has one — the token in
the URL is the guard, treat it like a
password while the tool runs — or
skip the tool and edit the files of
chapter 2 directly. The tool writes
the same files you would.

## It parses, but the style drifts

```bash
fish_indent --check script.fish
```

Exit 1 means `fish_indent` would
reformat; running it without
`--check` does the reformatting
(chapter 9, transcript `t03`). Drift
is not an error — but if a project
has chosen the tidy style, this is
the one command that keeps it.
