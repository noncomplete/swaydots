#!/usr/bin/env bash

CURRENT_SONG="$(playerctl metadata mpris:trackid)"
CURRENT_ART="$(playerctl metadata mpris:artUrl)"
IMG_PATH=$HOME/temp_coverart.png
IMG_PATH_RE=$HOME/temp_coverart_400.png

print_art() {
  wget -q "$CURRENT_ART" -O "$IMG_PATH" 2> /dev/null
  convert $IMG_PATH -resize 400x400 $IMG_PATH_RE 2> /dev/null
  wezterm imgcat "$IMG_PATH_RE" 2> /dev/null
}

print_meta() {
  echo "Now Playing :: $(playerctl metadata xesam:title)"
  echo ""
  echo "Artist :: $(playerctl metadata xesam:artist)"
  echo ""
  echo "Album :: $(playerctl metadata xesam:album)"
}

clear
print_art
print_meta

while true; do
  NEW_SONG="$(playerctl metadata mpris:trackid)"
  NEW_ART="$(playerctl metadata mpris:artUrl)"
  if [[ "$CURRENT_SONG" == "$NEW_SONG" ]]; then
    sleep 2
  else
    clear
    CURRENT_SONG="$NEW_SONG"
    CURRENT_ART="$NEW_ART"
    print_art
    print_meta
  fi
done

