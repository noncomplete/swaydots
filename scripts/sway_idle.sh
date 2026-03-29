#!/bin/sh

killall swayidle
sleep 1
exec swayidle -w \
	timeout 600 'hyprlock --grace 2' \
	timeout 900 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
	before-sleep 'hyprlock --grace'
