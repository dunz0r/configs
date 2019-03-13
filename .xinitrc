#!/bin/bash
urxvtd -o -f
xset -b
start-pulseaudio-x11 &
unclutter -idle 7&
setxkbmap -layout "us" -variant "altgr-intl"
nextcloud&
compton -b&
xset mouse 1/3 5&
awesome
