#/usr/bin/env bash

killall sway-audio-idle-inhibit
sleep 1
sway-audio-idle-inhibit &!
