#!/usr/bin/env bash

STATE="$(pidof swayidle)"

if [[ -n $STATE ]]; then
  killall swayidle
  echo " "
  notify-send -e "Presentation Mode" "killing swayidle..."
else
  notify-send -e "Normal Mode" "spawing swayidle..."
  exec /home/noncomplete/scripts/sway_idle.sh
  echo " "
fi
