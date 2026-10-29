# Syntax, Not Bash

**Outcome: you can read everyday fish
without mentally translating it from
bash, and write the common shapes —
variables, lists, substitutions,
conditions, loops — in fish's own
spelling. Every example in this
chapter was run by the lab (transcript
`t02-syntax-differences.txt`).**

## Setting a variable: `set`

There is no `NAME=value` in fish. There
is a command:

```text
$ set greeting "Good morning"
$ echo $greeting
Good morning
```

Feed fish the bash spelling and it
stops you *before anything runs*, with
the correction included (transcript
`t10-scripting.txt`):

```text
fish: Unsupported use of '='. In fish, please use 'set NAME value'.
NAME=value
^~~~~~~~~^
```

That message is the language in
miniature: fewer special cases, and
the shell teaches at the moment of
the mistake.

## Variables are lists

Every variable holds a **list** of
values — one value is a list of one.
Indexing starts at 1, negative numbers
count from the end, and ranges take a
slice:

```text
$ set fruit apple pear plum
$ echo first=$fruit[1] last=$fruit[-1]
first=apple last=plum
$ echo $fruit[2..3]
pear plum
$ count $fruit
3
```

`count` is a builtin; you will use it
constantly. And because a variable is
a list, there is **no word splitting**:
a value containing spaces stays one
value when the variable is used —

```text
$ set phrase "two words"
$ count $phrase
1
```

— where bash would have split it into
two arguments and surprised everyone
who forgot the quotes.

An undefined variable is not an error.
It is an empty list, and expands to
nothing:

```text
$ echo "[$never_set_anywhere]"
[]
```

## Command substitution: parentheses

The output of a command is taken with
parentheses (the `$( )` spelling also
works in fish 3 and later):

```text
$ echo today is (date +%A)
today is Thursday
```

Substitution splits its output into a
list, one element per line, and trims
the trailing newline — so
`(printf "one\ntwo\nthree\n")` is a
three-element list, ready to index or
count, with no further ceremony.

## Blocks end with `end`

Conditions and loops close with the
same word everywhere. No `fi`, no
`done`, no `esac`:

```text
for n in 1 2 3
    if test $n -eq 2
        echo "two found"
    end
end

set i 0
while test $i -lt 3
    set i (math $i + 1)
end
```

Arithmetic is the `math` builtin —
`math 6 \* 7` prints 42 — and the
condition is `test`, the same `test`
other shells know, or the command
itself: `if grep -q pattern file` is
perfectly at home, because a
condition is just a command whose exit
status is read.

## Joining commands: `and`, `or`, `not`

```text
$ true; and echo yes-branch
yes-branch
$ false; or echo no-branch
no-branch
```

The words do what `&&` and `||` do in
bash, and read the way they behave.
The exit status of the last command is
always at hand in `$status`:

```text
$ false; echo status=$status
status=1
```

An unknown command, for reference,
leaves 127 there and an error that
underlines the offender (transcript
`t13-small-checks.txt`).

## Looking at a variable

`set --show` reports scope and
contents; it is the first tool when a
variable is not what you expect:

```text
$ set shoe_size 10
$ set --show shoe_size
$shoe_size: set in global scope, unexported, with 1 elements
$shoe_size[1]: |10|
```

Scope is the subject of chapter 7 —
for now, know that the report exists
and names names.

## The check

This one paragraph exercises the whole
chapter; it should print `plum, 3`:

```bash
fish -c 'set fruit apple pear plum; echo $fruit[-1], (count $fruit)'
```

If you typed it with an `=` or a
`$(( ))` anywhere, fish will have
corrected you already, in its own
words — which is the chapter's real
lesson: the language is smaller than
bash's, and its error messages are
part of the teaching.
