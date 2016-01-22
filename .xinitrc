#!/bin/bash
urxvtd -o -f
xset -b
nitrogen --restore
start-pulseaudio-x11 &
unclutter -idle 7&
wmname LG3D&
owncloud &
setxkbmap -layout "us" -variant "altgr-intl" -option "ctrl:nocaps" -option "keypad:pointerkeys"
xset mouse 6 5&
$HOME/.dwm/dwmstatus/dwmstatus&
$HOME/bin/startdwm
