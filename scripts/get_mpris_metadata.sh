#!/usr/bin/env bash

NAME="$(playerctl metadata title)"
ARTIST="$(playerctl metadata artist)"
ALBUM="$(playerctl metadata album)"

echo "${NAME:0:100}   ${ARTIST:0:100}   <i>${ALBUM:0:100}</i>"

# TODO:
# Get state
# if else block
# Construct json
