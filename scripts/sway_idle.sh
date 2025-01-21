#!/bin/sh

killall swayidle
sleep 1
exec swayidle -w \
	timeout 600 'bash -e /home/noncomplete/scripts/lock.sh' \
	timeout 900 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
	before-sleep 'bash -e /home/noncomplete/scripts/lock.sh'
