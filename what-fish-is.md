# What Fish Is

A **shell** is the program that takes
the commands you type — run this, copy
that, show me the other — and carries
them out. On most Linux machines the
shell is **bash**, and bash is built to
a bargain struck in the 1970s and
refined ever since: be everywhere, be
compatible, never surprise a script
written decades ago. It is a fine
bargain. It is also why typing at bash
feels the way it does — the shell knows
a great deal about what you probably
mean, and by design says almost none
of it until you press Tab and ask.

**Fish — the friendly interactive
shell — made the opposite bargain.**
It gives up compatibility on purpose.
In exchange, it tells you what it knows
while you type:

- **Autosuggestions.** As you type a
  command, fish offers the rest of it
  in dim grey, drawn from your history
  and from completions. One key —
  right arrow — accepts the offer.
- **Syntax highlighting.** The command
  line is coloured as you type: a
  command fish can find is painted one
  colour, a command it cannot find is
  painted in the error colour, quoted
  text another. Mistakes are visible
  before Enter, not after.
- **Completions with explanations.**
  Press Tab and the choices arrive
  with descriptions of what each one
  does — not a bare list of file names,
  but the options of the command, each
  with its purpose attached.

None of this needs configuring. It is
not a plugin or a framework bolted on
afterwards; it is what the shell does
the first time it runs, which the
lab verified by running it (chapter 4).

## The price, stated now

Fish's language is its own. A fish
script is not a bash script, and bash
habits are not merely unwelcome in
fish — some are parse errors, caught
before anything runs, with the
correction spelled out in the message
(chapter 5 shows the famous one). Fish
does not aim to be POSIX-compatible,
and says so in its own documentation
without apology. If your work is
writing scripts that must run on any
machine, that matters, and chapter 11
is honest about who should keep bash
for that job.

But most people spend far more time
*typing at* a shell than writing
scripts for strangers. For the typing,
the bargain fish offers is simple: the
shell works for you continuously,
instead of only when asked.

## A first taste

After installing (chapter 3), this is
an ordinary moment in fish — every
line below was really run by the lab:

```text
$ fish -c 'echo The current directory is (pwd)'
The current directory is /home/hatch

$ fish -c 'set colours red green blue; echo $colours[-1]'
blue
```

The first line shows command
substitution in parentheses, fish's
everyday spelling. The second shows
what variables are in fish: **lists**.
`colours` holds three values, and
`$colours[-1]` is the last of them.
Chapter 5 takes these apart properly.

## Who it is for

The person who lives in a terminal and
is tired of retyping commands the
shell already saw yesterday. The
learner who is meeting shells for the
first time and would like the machine
to meet them halfway — fish's error
messages teach, and its highlighting
warns before anything breaks. The
maker whose scripts are for their own
machines, where fish can be installed
on purpose. And the cautious: trying
fish commits you to nothing. It sits
beside bash, you run it when you want
it, and chapter 3 shows the one
setting that makes it your login shell
only when you decide so.

## The honest catch, up front

Two of them, and neither is buried.
First, the language split is real: you
will learn two dialects — fish for
your keyboard, and enough bash to read
the world's scripts — or you will
write fish scripts that only run where
fish lives. Chapter 12 lists exactly
where that bites. Second, this guide's
lab had no screen to look at: the
interactive gifts were verified in the
byte stream a terminal receives, not
by watching a display (the method is
in chapter 4 and the raw captures are
kept). What fish *sends* is measured;
how pretty it looks is left to your
eyes, which is where it belongs anyway.
