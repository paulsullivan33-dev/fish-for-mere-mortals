# Variables That Persist

**Outcome: you can give a variable
exactly the lifetime you intend — this
command, this session, or every shell
from now on — and you set your PATH
the fish way, once, instead of editing
it into every startup file.**

## Three scopes

`set` takes a scope flag, and the
scope is the lifetime:

| Scope | Flag | Lives in | Dies when |
|---|---|---|---|
| Local | `-l` | the current block or function | the block ends |
| Global | `-g` | the current shell | the shell exits |
| Universal | `-U` | your account | you erase it |

A bare `set` picks sensibly: inside a
function it is local, at the prompt it
is global. `set --show` (chapter 5)
reports which scope a variable is in,
and `set --query NAME` asks whether it
exists at all — its exit status is the
answer, which scripts use constantly
(chapter 9).

## Universal variables: memory between shells

A universal variable is written to
`~/.config/fish/fish_variables` and
shared by **every fish you run**. The
lab's demonstration (transcript
`t06-universal-variables.txt`) is in
three processes:

```text
(process one)   $ set -U favourite_colour teal
(process two)   $ echo $favourite_colour
teal
(process two)   $ set --show favourite_colour
$favourite_colour: set in universal scope, unexported, with 1 elements
```

And the file itself is plain text:

```text
SETUVAR favourite_colour:teal
```

Better still, the sharing is live.
While one shell sat asleep, a second
shell changed the variable underneath
it; when the first shell woke and
looked, it saw the new value:

```text
B changed it
A now sees: after
```

No restart, no re-reading by hand:
the shells watch the shared file.
Erasing is the same tool —

```bash
set -U --erase favourite_colour
```

— and every shell forgets it.

Two honest cautions. The file is plain
text in your home folder: a fine place
for a favourite colour or a preferred
editor, and **not a place for secrets**
— anyone who can read your home can
read them. And because all your shells
share it, universal is the wrong scope
for anything that is really about
*this* session — a directory you
happen to be in, a value a script is
passing around. That is what global
and local are for.

## Exported variables

A variable other programs must see —
`EDITOR`, `LANG`, their kin — is
**exported** with `-x`: `set -gx EDITOR vim`.
Universal and exported combine:
`set -Ux` is how a setting is made
both permanent and visible to
everything you run. Fish variables
that are not exported stay inside
fish, invisible to child programs.

## PATH, the fish way

Your PATH is a list like any other
variable (chapter 5), and fish offers
a purpose-built tool for the one list
everyone edits:

```bash
fish_add_path ~/bin
```

It prepends the directory unless it is
already there, stores the result in
the universal variable
`$fish_user_paths`, and every shell —
present and future — picks it up. The
lab ran it and watched a new process
inherit the edited PATH (transcript
`t06`). Two habits this replaces:
exporting PATH in three different
startup files, and the line
`set PATH $PATH ~/bin` in
`config.fish`, which prepends again
at every startup and grows the list
without bound. `fish_add_path` is
idempotent: run it twice, get the
directory once.

## The check

Open two terminals running fish. In
the first:

```bash
set -U message_for_myself "mind the step"
```

In the second, `echo $message_for_myself`.
Then erase it from the second, and
watch the first agree it is gone.
You have just used the mechanism
behind half of fish's convenience —
and you know its file's address, which
is most of troubleshooting it.
