#!/usr/bin/env bash
cliphist list | tofi --anchor="left" --font="ZedMono Nerd Font" --font-size=14 --prompt-text="ClipHist: " | cliphist decode | wl-copy
