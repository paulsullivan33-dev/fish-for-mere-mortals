# Fish for Mere Mortals

Fish is the friendly interactive shell:
a shell that helps while you type. As
you enter a command it offers the rest
of it, drawn from your own history.
It colours what you type, so a command
that does not exist is visibly wrong
before you press Enter. Its
completions arrive with descriptions
of what each option does. And its
scripting language is a clean design
of its own — not bash, and it will
tell you so, helpfully, the first time
you feed it a bash habit.

This guide installs fish, walks
through a first session, and then
takes the working parts in turn: the
syntax and how it differs from bash,
completions you can write and
completions fish drafts for you,
variables that remember themselves
between sessions, functions and
events and abbreviations, and writing
scripts in fish — including an honest
account of when a script should be
fish at all, and when it should stay
bash. It closes with the limits,
stated plainly, a troubleshooting
chapter, and a glossary.

Every procedure in this guide was run
in the guide's own lab, and the
transcripts are kept in the
repository under `fish-lab/`. Where
something could not be run — changing
a login shell on a shared machine,
clicking through the web
configuration tool — the text says
so, and `criteria.md` keeps the full
ledger of what was verified and what
was only documented.

One honest detail about the lab
itself: the sandbox's package manager
was busy with other work that day, so
the lab ran the distribution's own
fish packages (version 3.7.0, the
Ubuntu 24.04 build) unpacked locally
rather than installed with `apt`. The
binaries and library are the
distribution's own; the chapter on
installing teaches the ordinary
`apt install fish` route, and the
package's one step the lab could only
read — registering the shell in
`/etc/shells` — is named in that
chapter and in `criteria.md`.

The lab also had no screen. Fish's
interactive gifts — suggestions,
highlighting, abbreviation expansion
— were verified by driving fish on a
pseudo-terminal and reading the byte
stream a real terminal would receive,
with the raw captures kept beside the
transcripts. The guide claims what
fish *sends*, never how a display
*looked*.

## Contents

- **What Fish Is** — the bargain fish
  makes: help while you type, in
  exchange for a language of its own.
- **The Moving Parts** — the three
  programs, the library of completions
  and functions, and the files in your
  home that hold your settings.
- **Installing Fish** — the package,
  the version check, trying fish as a
  guest, and the separate decision to
  make it your login shell.
- **Your First Session** — the
  suggestion, the colours, the
  completions, history search, and the
  private session, each witnessed.
- **Syntax, Not Bash** — `set`, lists,
  indexing, substitution, blocks that
  end in `end`, and errors that teach.
- **Completions That Write Themselves**
  — where Tab's answers live, a file
  you write yourself, and drafts
  generated from man pages.
- **Variables That Persist** — local,
  global and universal scopes; live
  sharing between shells; PATH set
  once with `fish_add_path`.
- **Functions, Events and
  Abbreviations** — commands of your
  own that save as files and load on
  demand; functions that answer
  events; abbreviations, and where
  they really live since fish 3.6.
- **Scripting in Fish** — a real
  script with `argparse`, honest exit
  codes, and the rule for when a
  script should not be fish.
- **Recipes** — abbreviations that
  survive, a saved function, prompt
  samples, drafts for everything with
  a man page, and silencing the
  greeting.
- **The Neighbours** — bash and
  Nushell, what each gives and takes,
  and the split this guide recommends.
- **Limits** — scripts that run only
  where fish lives, bash hand-me-downs
  it will not eat, the web tool's need
  for a browser, and plain-text
  variables.
- **Troubleshooting** — the `=` error,
  vanished abbreviations, silent
  completion files, scope surprises,
  and font-shaped boxes in the prompt.
- **Glossary** — every term, defined
  on one page.
- **Writing Criteria** — the
  nine-point standard this guide was
  written to, and its verification
  notes.

## Part of the series

This guide is one of the **For Mere
Mortals** guides: plain-language
guides to tools that repay learning,
each written to the same nine-point
standard and verified in its own lab.
The full index is at
[For Mere Mortals](https://paulsullivan33-dev.github.io/mere-mortals/).

## Related guides

- **[Bash for Mere Mortals](https://paulsullivan33-dev.github.io/bash-for-mere-mortals/)**
  — the incumbent shell: everywhere,
  compatible with everything, and the
  dialect scripts are shared in. Fish
  at the keyboard, bash in the shared
  script, is this guide's recommended
  split.
- **[Nushell for Mere Mortals](https://paulsullivan33-dev.github.io/nushell-for-mere-mortals/)**
  — the other modern answer to bash:
  pipelines of tables instead of text,
  where fish's break is about the
  experience of typing.
- **[tmux for Mere Mortals](https://paulsullivan33-dev.github.io/tmux-for-mere-mortals/)**
  — terminal windows that survive
  disconnects; orthogonal to the
  shell, and the two spend the day
  together in most terminals.

## License

Text: [CC BY 4.0](https://github.com/paulsullivan33-dev/fish-for-mere-mortals/blob/main/LICENSE).
Code: [MIT](https://github.com/paulsullivan33-dev/fish-for-mere-mortals/blob/main/LICENSE-CODE).
