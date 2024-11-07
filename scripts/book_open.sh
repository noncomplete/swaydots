#!/usr/bin/env bash

# sk = skim, a rust replacement for fzf
FILE=$(sk --history ~/skim_hist --exact --reverse -q "GRE pdf | GRE epub | GRE md")

if [[ -n "$FILE" ]]; then
    nohup xdg-open "$FILE" & disown
    sleep 1
    exit
else
    echo "No file selected."
fi

