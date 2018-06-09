#!/bin/bash
urxvtd -o -f
xset -b
nitrogen --restore
start-pulseaudio-x11 &
unclutter -idle 7&
setxkbmap -layout "us" -variant "altgr-intl"
xset mouse 1/6 5&
owncloud &
tint2&
openbox
