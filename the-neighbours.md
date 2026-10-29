# The Neighbours

Fish is not the only answer to bash's
age, and this series has guides to the
neighbours as well. A short comparison,
so the choice is yours with open eyes.

## Bash

**[Bash for Mere Mortals](https://paulsullivan33-dev.github.io/bash-for-mere-mortals/)**
is the incumbent and, in its own
territory, unbeatable: every Unix
machine has it or its close kin, every
script on the internet assumes it, and
the POSIX-shaped dialect it speaks is
the closest thing computing has to a
lingua franca. What you get with bash
is reach. What you give up is exactly
what this guide has been showing —
help while you type, completions with
descriptions, highlighting that warns
before Enter. People rebuild those in
bash with frameworks and plugins; fish
is the same wishes, made the shell's
own design.

The practical split most fish users
arrive at, and the one this guide
recommends outright: **fish at the
keyboard, bash in the scripts you
share** (chapter 9's rule). The two
shells coexist without friction —
installing one never disturbs the
other, and a fish session runs bash
scripts all day. What does not work,
in either direction: feeding fish a
bash configuration, function library,
or snippet and expecting sense. The
languages rhyme; they are not the
same language.

## Nushell

**[Nushell for Mere Mortals](https://paulsullivan33-dev.github.io/nushell-for-mere-mortals/)**
reimagined the shell around **data**:
in Nushell, commands pass *tables* —
structured rows and columns — down
the pipeline, where Unix shells pass
text and hope the columns line up.
Where fish's break with bash is about
the *experience* of the command line,
Nushell's is about what flows through
it. If your daily work is wrestling
JSON, CSVs and command output into
shape, Nushell's tables are the
stronger medicine; if your work is
moving around a system and running
its programs, fish's polish is the
one you will feel every minute.

What they share matters too: both
declined POSIX compatibility on
purpose, both colour and complete far
beyond bash's habits, and both are
honest that a script written in them
runs only where they are installed.
Choosing between them is choosing
which of bash's limits annoys you
more — the silence, or the text.

## The others, briefly

**zsh** is bash's dialect with a
generation of improvements and an
enormous plugin culture; migrating
bash users often land there because
their scripts keep working.
**PowerShell**, on Windows and beyond,
treats pipeline data as objects and
comes from a different family
entirely. Neither has a guide in this
series; they are named so the map is
complete, and because a reader
choosing a shell should know the
field is wider than three.

## The check

One paragraph in each neighbour's own
spelling says most of it. Fish:

```fish
set fruit apple pear plum
echo $fruit[-1]
```

Bash:

```bash
fruit=(apple pear plum)
echo "${fruit[-1]}"
```

Nushell:

```nu
let fruit = [apple pear plum]
$fruit | last
```

Three shells, three answers to the
same small question. Only one of them
would have suggested the command to
you while you typed it — and only one
would refuse, politely and in advance,
to run the others' answers.
