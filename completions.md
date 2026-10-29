# Completions That Write Themselves

**Outcome: you understand where Tab's
answers come from, you can see them
without pressing Tab, and you can give
a program of your own proper
completions — by writing one small
file, or by letting fish draft it from
the program's man page.**

## Where the answers live

A completion is a small file named
after the command it serves:
`git.fish` completes `git`. Fish ships
959 of them (transcript `t00`), which
is why so many commands complete
richly the day fish is installed. When
you press Tab, fish searches a list of
directories, `$fish_complete_path` —
the lab's own list, from transcript
`t04-completions.txt`:

- your `~/.config/fish/completions`
  first,
- then vendor directories where other
  programs drop their own completions,
- then the shipped library,
- and last, `generated_completions`,
  where the drafts of the next section
  live.

Order matters: your file for a command
wins over every other file for it.

Two behaviours the lab verified
rather than assumed. Completions are
**loaded on demand** — a command's
file is read the first time you
complete that command, not at startup.
And a command that **does not exist**
is never completed: with the lab's
demo program removed from the PATH,
the very same completion file answered
nothing at all (transcript `t04`).
Fish completes the machine you have,
not the one the file imagines.

## Seeing what Tab sees

`complete --do-complete` asks the
completion system directly:

```text
$ complete --do-complete='git ch'
checkout	Checkout and switch to a branch
cherry	Find commits yet to be applied to upstream
cherry-pick	Reapply a commit on another branch
```

This is how the guide tests
completions without a terminal, and
how you can test yours.

## Writing one: ten lines for a real program

The lab's running example is `greet`,
a tiny program kept in
`fish-lab/scripts/greet`. Its
completion file, in full:

```fish
complete -c greet -s h -l help -d "Show help"
complete -c greet -s n -l name -r -d "Who to greet"
complete -c greet -l loud -d "Shout the greeting"
```

Each line is one `complete` command:
`-c` names the command, `-s`/`-l` give
the short and long option, `-r` says
the option requires a value of its
own, and `-d` is the description Tab
will show. Saved as
`~/.config/fish/completions/greet.fish`,
it answers immediately:

```text
$ complete --do-complete='greet --'
--help	Show help
--loud	Shout the greeting
--name	Who to greet
```

`complete -c greet` lists back what is
registered, normalised into fish's
canonical spelling (transcript `t04`)
— the way to check a file loaded as
intended.

## Letting fish draft them: man pages

Programs with man pages can be
drafted automatically:

```bash
fish_update_completions
```

It reads the options out of the man
pages it finds and writes a completion
file per program into
`generated_completions`. The lab fed
it exactly one page — a fixture for
`greet`, kept in `fish-lab/fixtures/` —
and it produced a working draft,
including descriptions lifted from the
page (transcript
`t05-generated-completions.txt`).

Treat drafts as drafts. The generator
works from formatting, not
understanding: on the lab's fixture it
swept the page's EXAMPLES text into
the `--help` description, so the help
entry reads *Show a short help text
and exit. EXAMPLES greet --name Ada
--loud*. Amusing, harmless — and the
reason the order of
`$fish_complete_path` matters: when a
generated description misleads, write
the three lines yourself in your own
completions folder, and yours replaces
the draft.

## The check

Pick a command you use and ask for its
partial completions:

```bash
fish -c "complete --do-complete='git st'"
```

Then write one line of a completion
file for a program of your own and
watch `complete --do-complete` pick it
up. Ten minutes in this chapter is the
difference between completions as
weather — something that happens to
you — and completions as a tool you
own.
