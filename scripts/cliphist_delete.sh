#!/usr/bin/env bash
cliphist list | tofi --anchor="left" --font="ZedMono Nerd Font" --font-size=14 --prompt-text="ClipHistDel: " | cliphist delete
