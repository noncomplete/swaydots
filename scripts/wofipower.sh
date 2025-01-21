#!/usr/bin/env bash

entries=" \tLogout\n󰒲 \tSuspend\n \tReboot\n \tShutdown"

selected=$(echo -e $entries | tofi --font="ZedMonoNerdFont ExtraBold" --font-size=30 --background-color=#000010DD --padding-top=30% --padding-left=25% --prompt-text "POWER: " | awk '{print tolower($2)}')

case $selected in
logout)
  swaymsg exit
  ;;
suspend)
  exec systemctl suspend
  ;;
reboot)
  exec systemctl reboot
  ;;
shutdown)
  exec systemctl poweroff -i
  ;;
esac
