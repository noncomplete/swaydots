#!/usr/bin/env fish

sleep 1
killall mpd 2> /dev/null
killall mpd-mpris 2> /dev/null
killall swaync 2> /dev/null 
sleep 1

notify-send -e "Launching MPD + MPD-MPRIS..." "Reloading swaync..."
swaync
mpd
mpd-mpris
