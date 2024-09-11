#!/usr/bin/env bash

entries="🔙 Logout\n💤 Suspend\n🔄 Reboot\n❌ Shutdown"

selected=$(echo -e $entries | tofi --font="Iosevka Nerd Font Propo" --prompt-text "POWER: " | awk '{print tolower($2)}')

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
