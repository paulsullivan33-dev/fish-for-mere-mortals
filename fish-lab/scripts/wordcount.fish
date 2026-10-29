#!/usr/bin/env fish
# wordcount.fish - count the words in each file it is named.
# A small but complete fish script: argument parsing, a loop,
# arithmetic with math, and honest exit statuses.

argparse h/help 's/short' -- $argv
or exit 2

if set -q _flag_help
    echo "Usage: wordcount.fish [--short] FILE..."
    echo "Print the word count of each FILE."
    exit 0
end

if test (count $argv) -eq 0
    echo "wordcount.fish: no files named" >&2
    exit 2
end

set -l total 0
for file in $argv
    if not test -f $file
        echo "wordcount.fish: $file is not a file" >&2
        exit 1
    end
    set -l words (wc -w < $file | string trim)
    set total (math $total + $words)
    if not set -q _flag_short
        echo "$file: $words words"
    end
end

echo "total: $total words"
