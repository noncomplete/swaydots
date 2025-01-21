#!/usr/bin/env bash

# sk = skim, a rust replacement for fzf
FILE=$(sk --reverse -q epub)

if [[ -n "$FILE" ]]; then
    nohup ebook-viewer "$FILE" & disown
    sleep 1
    exit
else
    echo "No file selected."
fi

