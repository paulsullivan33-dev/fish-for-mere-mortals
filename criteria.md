# Writing criteria for this guide

Every "for Mere Mortals" guide is written to the same
nine-point standard, so a reader who trusts one can trust the
rest. Here it is, with the verification notes for this
particular guide below.

1. **Fix it first.** Reader outcomes lead, not action items:
   each chapter opens by naming the outcome it delivers,
   shows a check the reader can run to confirm they got it,
   and a reasonable reader finishes able to state what was
   done, what it means, and what to try next.
2. **Plain language.** Short sentences, everyday vocabulary,
   technical terms defined on first use. No slang, and no
   idioms that only make sense in one country — the reader
   may be translating as they go.
3. **No dead ends.** A guide never tells the reader to do
   something it cannot show them how to verify. Every claim a
   reader relies on — an install, a command, an output — is
   something this guide demonstrates or clearly labels
   documented-only below.
4. **Live-verified where it matters.** Procedures are run for
   real in the guide's lab wherever the build machine allows
   it, and the transcripts kept in the repository are the
   evidence. What could not be run is listed honestly below,
   never presented as if it had been.
5. **General audiences.** Nothing in this guide — examples,
   fixtures, names, addresses — is modelled on any
   particular reader or author's real life, network, or
   organisations. The lab's examples are a greeter program,
   fruit, colours and one stock sentence about an eagle.
6. **Standalone.** A reader needs this guide, its lab, and
   nothing else. Where another guide would genuinely help,
   it is pointed to once, by name, and the chapter still
   completes without it.
7. **Honest about limits.** Chapter 12 names what the tool
   cannot do: scripts that run only where fish is installed,
   bash configuration it will not consume, interactive gifts
   that stop at the terminal's edge, a web configuration
   tool that needs a browser nearby, and universal variables
   that are plain text shared by every shell you run.
8. **The ethics rule is in the text, early.** Fish raises no
   interception question of the kind other guides in this
   series carry, but chapter 1 and the README state its data
   plainly — your history and your variables live in
   plain-text files in your own home folder, named in
   chapter 2, and nothing in this guide sends them anywhere.
9. **Builds clean.** The site builds with MkDocs in strict
   mode with no warnings, and a fresh reader following the
   chapters in order reaches the stated outcome of each.

## Verification notes for this guide

The build machine is an Ubuntu 24.04 sandbox whose package
manager was busy with other work while the lab ran, so fish
was **not** installed with `apt` in the ordinary way: the
lab used the distribution's own packages (`fish` and
`fish-common`, version **3.7.0**, the version Ubuntu 24.04
ships) downloaded and unpacked locally, with the library
placed at the standard `/usr/share/fish` and the binaries
linked at `/usr/bin`. The binaries, library and version are
the distribution's own; the one install step not performed
was the registration of `/usr/bin/fish` in `/etc/shells`,
which the lab instead read in the package's own setup script
(`add-shell /usr/bin/fish`, transcript t00). Chapter 3 says
this plainly. All interactive and scripting work ran in an
isolated home folder, so no real account was touched. All
transcripts live in `fish-lab/transcripts/`; the lab's
scripts in `fish-lab/scripts/`; the one fixture (a man page)
in `fish-lab/fixtures/`.

The lab had **no screen**. Interactive behaviour was
verified by driving fish on a pseudo-terminal with a script
(kept in the lab notes) and reading the byte stream a real
terminal would receive: the transcripts quote that stream
with escape codes stripped, and the raw captures are kept
(`t09-pty-demo.raw.txt`, `t09-pty-prime.raw.txt`). Claims
are therefore about what fish *sends* — the suggestion text,
the expansion, the colour codes — never about how a screen
*looked*.

Run for real, with transcripts as evidence:

- Version and layout: fish, fish_indent and fish_key_reader
  all 3.7.0; the data directory; 959 shipped completion
  files, 217 shipped functions, 61 builtins counted; the
  package's post-install shell registration read (t00).
- First commands: substitution, `math`, lists and indexing
  in one-liners (t01).
- Syntax against bash: lists, 1-based and negative indexes,
  ranges, no word splitting, both substitution spellings,
  output split to a list by lines, blocks ending in `end`,
  `and`/`or`/`not`, `$status`, `set --show`, undefined
  variables expanding to nothing (t02).
- `fish_indent` reformatting a messy script, `--check`
  exiting 1 before and 0 after, `fish --no-execute` parsing
  clean (t03).
- Completions: `$fish_complete_path` order; real candidates
  from `complete --do-complete`; a hand-written completion
  file for a lab program, including the verified condition
  that it answers **only while the program exists** on the
  PATH (t04).
- `fish_update_completions` drafting a completion file from
  a fixture man page — including the imperfection chapter 6
  quotes, the EXAMPLES text swept into a description (t05).
- Universal variables: set in one process, read in another;
  the `SETUVAR` file format; live synchronisation observed
  by a sleeping process; `fish_add_path` populating
  `$fish_user_paths` and a fresh PATH; erasure propagating
  (t06).
- Functions: definition, `funcsave` writing the file,
  autoload in a fresh process, `type --path`, removal by
  deleting the file; custom events via `--on-event` and
  `emit`, arguments included (t07).
- Abbreviations: session definition and `--show`; the
  verified 3.6+ behaviour that they are **not** saved
  automatically and do not survive processes unless written
  into `config.fish`; the `--function` form (t08).
- Interactive session on a pty: the autosuggestion text
  present in the stream after partial typing; the
  abbreviation `gst ` expanding to `git status` in the
  stream; colour codes for valid commands and the error
  colour present, matching the configured blue/brred
  scheme (t09).
- Scripting: the specimen word-counter running by its
  shebang; `argparse` help; exit codes 0, 1 and 2 each
  observed; `status` self-reporting; the verbatim parse
  error for a bash-style assignment, and `export
  NAME=value` working through the shipped compatibility
  function (t10, t13).
- `fish_config` starting its server headlessly: the start
  line printed, and the tool's page fetched over HTTP —
  200, with `<title>fish shell configuration` (t11). Two
  sandbox caveats are recorded there: the helper needs a
  TERM with terminfo present, and with no browser installed
  its browser-launch step errors, which is expected
  headless behaviour, not a defect found in fish.
- The lived-in layout of `~/.config/fish` and
  `~/.local/share/fish` after real use, history file
  included (t12).
- Small checks: `fish --private` reporting
  `$fish_private_mode` 1; an unknown command's message,
  caret and status 127; `$version` (t13).
- A sample prompt from the web tool's library copied in as
  `fish_prompt.fish`: the interactive prompt changed shape,
  and removing the file restored the default (t14).

Documented only — described from the project's
documentation, not run, and the text does not claim
otherwise:

- Changing a login shell with `chsh` (the command and the
  `/etc/shells` rule are standard; the lab changed no
  account's shell on a shared machine).
- Installing on other systems (dnf, pacman, Homebrew).
- Clicking through the `fish_config` web interface: the
  server and its page were verified; the pointing and
  clicking were not.
- Built-in events (`fish_prompt`, `fish_preexec`,
  `fish_postexec`), `--on-variable` and `--on-signal`
  handlers, `--position anywhere` and `--set-cursor`
  abbreviations: named from the documentation; the custom
  `--on-event` mechanism they extend was run.
- Ctrl-R history search at a live terminal (the history
  file it reads was verified; the keypress was not driven).
- Vi key bindings and `fish_key_reader` beyond its
  version; the zsh and PowerShell characterisations in
  chapter 11.
- In-terminal `help`: it failed in this sandbox for want of
  man-page formatting tools ("Cannot format help; no
  parser found") — recorded as a sandbox limit, and chapter
  13 treats it as such rather than as a fish defect.

Fixtures are this guide's own and deliberately generic: a
tiny `greet` program and its man page, fruit and colour
lists, a one-line sample text, and one stock sentence
("the eagle has landed") used to make an autosuggestion
visible. No names, organisations or real events.
