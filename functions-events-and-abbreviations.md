# Functions, Events and Abbreviations

**Outcome: your own commands, packaged
three ways — functions that persist as
files and load themselves, functions
that run when something happens, and
abbreviations that expand under your
fingers — each in its proper place.**

## Functions

A function is a named block of fish,
defined once and called like any
command:

```fish
function sizes --description "Show the size of each file named"
    for f in $argv
        du -h $f
    end
end
```

Everything after the name arrives in
`$argv`, the argument list (chapter
5's list rules apply). Defined at the
prompt, a function lives until the
shell exits. Transcript
`t07-functions-and-events.txt` runs
this one for real.

## Saving one: a file of its own

```bash
funcsave sizes
```

`funcsave` writes the function to
`~/.config/fish/functions/sizes.fish`
— the definition, tidied by
`fish_indent` on the way. From then
on, **every** fish knows the command,
without loading it at startup: the
file is read on **first use**
(autoloading), so a hundred saved
functions cost nothing until called.
The lab proved the round trip in a
fresh process:

```text
$ type --path sizes
~/.config/fish/functions/sizes.fish
```

`type --path` answering with a file
address is your proof a function is
the saved kind. Editing the file edits
the command; deleting the file
removes it — the lab did both, and the
next process agreed each time
(transcript `t07`). The prompt itself
is a function kept exactly this way,
which is why chapter 10's prompt
recipe is just a file copy.

## Events: functions that answer happenings

A function can declare that it runs
when something happens:

```fish
function bell --on-event doorbell
    echo "the doorbell rang (event arguments: $argv)"
end
```

and then `emit doorbell front-door`
summons it — event arguments arriving
in `$argv` like a command's. The lab's
two rings, front door and back, are in
transcript `t07`. Custom events are
how your own scripts signal each
other; fish's built-in events need no
emitting — `fish_prompt`, `fish_preexec`
and `fish_postexec` fire around every
interactive command, and handlers can
also be bound `--on-variable NAME`
(when a variable changes) and
`--on-signal`. Those built-in hooks
are how prompts and tools react to
your work; they are named here from
the documentation, and the custom
event above is the form the lab ran.

## Abbreviations: expanding as you type

An abbreviation is a word that, when
**typed** at the prompt and followed
by space or Enter, is replaced by
longer text:

```bash
abbr --add gst "git status"
abbr --show
# abbr -a -- gst 'git status'
```

Typed, not run: abbreviations never
expand in scripts (the documentation
is blunt about it), which is what
makes them safe for dangerous-looking
shortcuts — `gst` in a script remains
`gst`, in plain sight. Expansion was
caught happening in the lab's
recorded terminal stream (transcript
`t09`): keystrokes `gst ` went in, and
`git status` was drawn in their place.

Here is the part most tutorials get
wrong, because it changed: **since
fish 3.6, `abbr --add` saves nothing.**
Older fish kept abbreviations in
universal variables; current fish does
not, and the lab demonstrated the
consequence the hard way (transcript
`t08-abbreviations.txt`) — a new
process, asked about `gst`, answered
with a query exit status of 1: not
defined. The intended home is your
`config.fish`, as an ordinary line:

```fish
abbr -a -- gst 'git status'
```

run at every startup like any other
setting. The documentation even
suggests the bookkeeping: define them,
then `abbr >> ~/.config/fish/config.fish`
to append `--show`'s output to the
file. Erasing is `abbr --erase gst`
in the session, plus removing the
line for permanence.

Two more forms, both shown working in
transcript `t08`: an expansion can be
the output of a **function** —
`abbr --add today --function today_text`
replaces `today` with whatever the
function prints, the date in the lab's
example — and `--position anywhere`
lets an abbreviation expand as an
argument, not only as a command, while
`--set-cursor` places the cursor
inside the expansion. Those last two
the guide names from the
documentation; the mechanism they
decorate is the one already proven.

## The check

Save the `sizes` function,
open a new shell, run `sizes` on this
guide's folder, and ask `type --path
sizes` where it came from. Then add
`abbr -a -- gst 'git status'` to your
`config.fish` and confirm a fresh
shell's `abbr --show` lists it. Both
survivals witnessed — that is the
chapter.
