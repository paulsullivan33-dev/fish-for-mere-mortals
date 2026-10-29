# Installing Fish

**Outcome: fish is installed, it states
its version on request, and you know
the one separate decision — whether it
becomes your login shell — well enough
to take it later, or never.**

## The ordinary install

On Debian and Ubuntu, fish is a normal
package:

```bash
sudo apt install fish
```

The lab ran fish **3.7.0**, the version
Ubuntu 24.04 packages. Other systems
have their own ordinary route — `dnf`,
`pacman`, Homebrew on macOS — named
here from the project's documentation;
the lab verified the Ubuntu package
only. The package brings both halves:
the `fish` program (with `fish_indent`
and `fish_key_reader`) and the
`fish-common` library of completions
and functions from chapter 2.

One detail the lab verified from the
package's own scripts rather than
assuming: installing registers the
shell in `/etc/shells` — the package's
setup runs `add-shell /usr/bin/fish`
(transcript `t00`). That list is what
the system consults before allowing a
shell to become anyone's login shell,
so the registration matters in the
last section of this chapter.

## The check

```bash
fish --version
```

```text
fish, version 3.7.0
```

That is the whole acceptance test.
`fish_indent --version` answers the
same version, should you want a second
witness.

## Trying it costs nothing

Installing fish changes nothing about
your existing shell. Bash still owns
your login; fish is simply a program
that now exists. To try it:

```bash
fish
```

You are in fish — the prompt and the
greeting say so — until `exit` or
Ctrl-D returns you to where you were.
Everything in chapters 4 and 5 can be
explored this way, in sessions you
walk away from. This is the right way
to meet a shell: as a guest first.

## The separate decision: login shell

Making fish the shell every terminal
and login starts with is one command,
and it is deliberately *not* part of
the install:

```bash
chsh -s /usr/bin/fish
```

`chsh` (change shell) takes effect at
your next login. The path must be
listed in `/etc/shells` — the install
saw to that. Going back is the same
command with the old path:

```bash
chsh -s /bin/bash
```

The lab did not change any account's
login shell — a shared machine is not
the place to spend other people's
defaults — so `chsh` itself is
documented-only in this guide: the
command is the project's and the
system's standard one, and everything
around it (the registration it depends
on, the version it will run) was
verified. Take the decision after a
week of guest sessions, if at all.
Plenty of people never take it: fish
for the terminals they open by hand,
bash still underneath everything else,
is a respectable steady state — and
chapter 11 returns to it.

## A note on where the lab's copy lived

For honesty (the full ledger is in
`criteria.md`): this guide's lab ran
the very Ubuntu packages named above,
unpacked and run in place because the
sandbox's package manager was busy
with other work that day. The
binaries, the library and the version
are the distribution's own; only the
last step of the install — registration
in `/etc/shells` — was read from the
package's scripts instead of being
performed.
