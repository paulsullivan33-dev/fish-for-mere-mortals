# Limits

What fish does not do, stated as
plainly as the rest of the guide. Most
of these are the price of the bargain
from chapter 1, listed so the price is
known before it is paid.

## Its scripts run nowhere else

A fish script needs fish. There is no
compatibility mode, no transpiler
worth trusting, no POSIX mode to fall
back to: the language was designed
clean, and backward compatibility with
bash was explicitly not a goal. Every
consequence in chapter 9 flows from
this one fact. Fish for your machines;
bash (or a real language) for scripts
that travel.

## It will not eat bash's hand-me-downs

Environment setup written for bash —
the `export FOO=bar` lines in a tool's
README, the initialisation snippet
that says "add this to your .bashrc" —
does not run in fish unchanged.
(`export` itself is translated: fish
ships a small compatibility function,
and `export EDITOR=vim` works — the
lab tried. Multi-line snippets,
aliases and functions written in bash
syntax do not.) Translating one
project's snippet is a five-minute
job, once; doing it for every tool
that assumes bash is a recurring
small tax, forever. Readers whose
work hands them such snippets daily
should count the tax honestly.

## The interactive gifts need an interactive fish

Autosuggestions, highlighting and
abbreviation expansion live in the
interactive shell only. Scripts do
not get them (abbreviations explicitly
never expand in scripts), non-fish
terminals do not get them, and a fish
running inside another program's
terminal gets them only as well as
that terminal cooperates. Chapter 4's
lab could verify these gifts only by
recording a terminal's byte stream;
on a terminal that renders poorly, or
a font without the glyphs a prompt
sample uses, the experience degrades
to boxes and plain text — fish still
works, but the shine is conditional.

## The web tool needs a GUI nearby

`fish_config` is a web page served to
a browser on the same machine. On a
headless server — no browser, no
display — the server starts (the lab
proved that much: chapter 4's
transcript `t11`) but the tool itself
is unusable in any practical sense;
settings on such a machine are edited
as the files they are (chapter 2's
map), which fish makes painless, but
the friendly front door is a desktop
feature.

## Universal variables are shared, plain, and blunt

One file, all your shells, plain text.
They synchronise between *your* fish
processes on *one* machine — not
between machines, not between users,
and with no locking ceremony worth
the name if two shells write at the
same instant. Secrets do not belong
there (chapter 7), and neither does
anything per-session. The mechanism
is a convenience, not a database.

## Smaller print

- **Adoption is smaller than bash's**,
  so the answer to a strange error is
  likelier to be found in fish's own
  (good) documentation than in a forum
  thread about your exact case.
- **Help inside the terminal** depends
  on man-page machinery being present;
  a stripped system can fail to format
  it — the lab's sandbox did exactly
  that, and the project's own site
  documents everything instead.
- **Some old scripts of yours, if
  written for ancient fish**, predate
  design cleanups: abbreviations saved
  the old way stopped working in 3.6
  (chapter 8) precisely because the
  project will still choose clean over
  compatible. Admirable, and a thing
  to know before depending on fish
  across a decade.
