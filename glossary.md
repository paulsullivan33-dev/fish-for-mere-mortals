# Glossary

- **Abbreviation** — A short word that
  fish replaces with longer text when
  you *type* it at the prompt and
  follow it with space or Enter
  (`gst` → `git status`). Typed only:
  abbreviations never expand inside
  scripts. Defined with `abbr`; since
  fish 3.6 they persist only as lines
  in `config.fish` (chapter 8).

- **Autoloading** — Loading a function
  or completion from its file the first
  time it is used, rather than at
  startup. The reason a hundred saved
  functions cost nothing until called
  (chapters 6 and 8).

- **Autosuggestion** — The dim-grey
  completion of your current line that
  fish offers as you type, drawn from
  history and completions; right arrow
  accepts it (chapter 4).

- **Builtin** — A command compiled
  into the shell itself: `set`, `count`,
  `string`, `math`, `abbr`, `emit`,
  61 of them in this install (chapter 2).

- **`$fish_complete_path`** — The
  ordered list of directories fish
  searches for completion files; yours
  first, the shipped library after,
  generated drafts last (chapter 6).

- **`$fish_user_paths`** — The
  universal variable holding the
  directories you added to PATH with
  `fish_add_path` (chapter 7).

- **fish_variables** — The plain-text
  file in `~/.config/fish` where
  universal variables are stored, one
  `SETUVAR` line each (chapter 7).

- **`fish_config`** — The function
  that starts fish's web configuration
  tool: a token-guarded local web page
  for colours, prompt, variables and
  history (chapters 2 and 4).

- **`fish_indent`** — The formatter
  that prints fish code tidied;
  `--check` makes it a style test
  (chapters 3 and 9).

- **`fish_update_completions`** — The
  function that drafts completion
  files from installed man pages into
  `generated_completions` (chapter 6).

- **Function** — A named block of fish
  code, called like a command, its
  arguments in `$argv`; saved by
  `funcsave` as one file in
  `~/.config/fish/functions/` (chapter 8).

- **Event** — A named happening a
  function can subscribe to with
  `--on-event` and anything can raise
  with `emit`; fish also fires
  built-in events around each command
  (chapter 8).

- **List** — What every fish variable
  holds: one or more values, indexed
  from 1, negatively from the end,
  sliced with ranges (chapter 5).

- **Private session** — `fish --private`:
  a session that writes nothing to the
  history file; `$fish_private_mode`
  is 1 inside it (chapter 4).

- **Prompt** — The text fish prints to
  ask for a command; itself a function,
  `fish_prompt`, replaceable by placing
  a file of that name in your functions
  folder (chapter 10).

- **Scope** — A variable's lifetime:
  local (this block), global (this
  shell), universal (your account,
  shared by all your shells). Set with
  `set -l`, `-g`, `-U` (chapter 7).

- **`$status`** — The exit code of the
  last command run; 0 is success, 127
  is "unknown command" (chapters 5
  and 9).

- **Syntax highlighting** — Colouring
  of the command line as you type:
  valid commands, errors, quotes and
  paths each in their colour, before
  Enter is pressed (chapter 4).

- **Universal variable** — A variable
  set with `set -U`, persisted in
  `fish_variables` and synchronised
  live between all your fish processes
  (chapter 7).
