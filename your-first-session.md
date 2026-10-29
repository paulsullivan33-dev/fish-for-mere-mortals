# Your First Session

**Outcome: one interactive session in
which you have seen each of fish's
three gifts work — the suggestion, the
colours, the completions — and you
know how to leave, and how to have a
session that leaves no trace.**

## Starting, and what greets you

```bash
fish
```

Fish announces itself the first time:

```text
Welcome to fish, the friendly interactive shell
Type help for instructions on how to use fish
```

That greeting is the default
`$fish_greeting`. If it ever wears out
its welcome, an empty value silences
it for good — `set -U fish_greeting ""`
in any session (universal variables
are chapter 7; for now, the line is
safe to copy).

## The suggestion

Type the start of a command you have
run before — in a brand-new shell
there is no history yet, so run one
first:

```text
echo the eagle has landed
```

Later, begin typing `echo the e`
again. Before you finish, the rest of
the command appears after your cursor
in dim grey: fish is offering the
command from your history. **Right
arrow** (or End, or Ctrl-F) accepts
the whole offer; keep typing and it
adjusts or evaporates. The lab proved
the offer is really made, by recording
what a terminal was sent while only
`echo the e` had been typed: the full
line was already there (transcript
`t09-interactive-pty.txt`; the raw
capture is kept beside it).

## The colours

Watch the command name while you type
it. A command fish can find — `echo`,
`ls`, anything installed — is painted
in the command colour (blue, in the
default scheme). Type a name that does
not exist and it is painted in the
error colour (bright red) *while you
type*, before Enter has a chance to
fail. Quoted text, options and paths
each take their own colours. The
recorded byte stream from the lab's
terminal contains those colour codes
being sent as keys were pressed
(transcript `t09`); on your screen it
is simpler — the shell is proofreading
you as you go.

## Completions that explain themselves

Type `git ch` and press **Tab**. Fish
does not guess a file name; it offers
the subcommands that fit, each with a
description of what it does. The lab
asked for the same list without a
terminal, through the completion
system itself:

```text
$ complete --do-complete='git ch'
checkout	Checkout and switch to a branch
cherry	Find commits yet to be applied to upstream
cherry-pick	Reapply a commit on another branch
```

That command — `complete --do-complete`
— is this guide's way of showing you
exactly what Tab would show, and
chapter 6 is built on it. Partial
options behave the same way: type a
command, two dashes, and Tab, and the
options arrive with their purposes
attached.

## Searching backwards

**Ctrl-R** opens a search through your
history: type a fragment, and matching
past commands appear; Enter takes the
one shown onto your command line, Esc
returns you to what you were typing. It reads the same history file
the suggestions come from
(`~/.local/share/fish/fish_history`,
chapter 2), which is why a new shell
already knows yesterday's commands.

## A session that leaves no trace

```bash
fish --private
```

In a **private session**, nothing is
written to the history file — the lab
checked the flag the shell sets for
it (transcript `t13-small-checks.txt`):

```text
$ fish --private -c 'echo "private mode: $fish_private_mode"'
private mode: 1
```

Commands run there work normally; they
simply will not be suggested back to
you later, because they were never
recorded.

## Leaving

`exit`, or Ctrl-D on an empty line.
If you arrived as a guest from bash
(chapter 3), you are back in bash;
nothing about your machine changed by
the visit.

## The check

In one session: run a command, start
retyping it and accept the grey offer
with right arrow; mistype a command
name on purpose and watch it change
colour before you press Enter; and
press Tab after `git ch`. Three gifts,
all witnessed — that is the whole of
chapter 1's promise, kept in person.
