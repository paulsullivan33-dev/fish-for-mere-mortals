# The Moving Parts

**Outcome: you can name every piece of
an installed fish — the programs, the
library it carries, and the files in
your home folder that hold your
settings, your history and your
variables — so that anything later in
this guide is a named thing, not a
mystery.**

## The programs

A fish install is three executables
(the lab's transcript
`t00-version-and-layout.txt` lists
them, all version 3.7.0 here):

- **`fish`** — the shell itself.
- **`fish_indent`** — a formatter that
  reads fish code and prints it tidied,
  with even indentation. Chapter 9 uses
  it as a spell-checker for scripts.
- **`fish_key_reader`** — a small tool
  that shows what a key press actually
  sends, for people customising key
  bindings. This guide names it and
  goes no deeper; bindings are a
  documented-only corner here.

## The library it carries

Fish is not a bare interpreter. It
arrives with a library, counted by the
lab in transcript `t00`:

- **959 completion files** — the
  descriptions behind Tab for 959
  commands (chapter 6).
- **217 functions** — ready-made
  commands written in fish itself,
  including `fish_config`, `fish_add_path`
  and `fish_update_completions`.
- **61 builtins** — the commands
  compiled into the shell: `set`,
  `count`, `string`, `math`, `test`,
  `abbr`, `emit`, and their kin.

The library lives in the **data
directory**, `/usr/share/fish` on this
install; fish itself will tell you:

```text
$ fish -c 'echo $__fish_data_dir'
/usr/share/fish
```

## Your files: the config home

Everything that is *yours* lives under
`~/.config/fish` (transcript
`t12-config-layout.txt` shows a real
one after a day of lab work):

- **`config.fish`** — the startup file,
  read every time fish starts. Your
  abbreviations live here as ordinary
  `abbr --add` lines (chapter 8) — since
  fish 3.6 they are stored nowhere else.
- **`conf.d/`** — a folder of snippets,
  each run at startup before
  `config.fish`. The tidy place for one
  tool's worth of setup per file.
- **`functions/`** — your functions, one
  file per function, loaded on demand
  when first called (**autoloading**).
  The prompt itself is one of these
  when you customise it: `fish_prompt.fish`.
- **`completions/`** — your completion
  files, one per command (chapter 6).
- **`fish_variables`** — the file behind
  **universal variables** (chapter 7):
  plain text lines, one variable each,
  written by the shell itself.

## Your files: the data home

Under `~/.local/share/fish`:

- **`fish_history`** — every interactive
  command, with the time it ran. Plain
  text, owned by you, and the raw
  material autosuggestions are made
  from (transcript `t12` shows its
  first entries).
- **`generated_completions/`** — the
  completions fish's generator built
  from your man pages (chapter 6).

## The web tool

`fish_config` is a function whose whole
job is to start a small web server —
the **web configuration tool** — on
your own machine, guarded by a long
random token in its address. From a
browser it sets colours, picks a
prompt from samples, and reviews
variables and history. Chapter 4 in
the lab's telling, transcript `t11`,
starts it for real and fetches its
page; the clicking itself needs a
browser, so it is described, not
demonstrated, in this guide.

## The check

You can name the parts on your own
machine:

```bash
fish -c 'echo $__fish_data_dir'
ls ~/.config/fish
```

The first prints the library's home;
the second shows your files — perhaps
only `config.fish` and `fish_variables`
on a fresh install, which is correct:
the folders appear as you use the
features that need them.
