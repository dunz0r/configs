#!/bin/bash
urxvtd -o -f
xset -b
start-pulseaudio-x11 &
nitrogen --restore&
unclutter -idle 7&
wmname LG3D&
owncloud &
setxkbmap -layout "us" -variant "altgr-intl" -option "ctrl:nocaps"
xset mouse 6 5&
$HOME/.dwm/dwmstatus/dwmstatus&
$HOME/bin/startdwm
