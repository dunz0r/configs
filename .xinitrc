#!/bin/bash
urxvtd -o -f
xset -b
start-pulseaudio-x11 &
nitrogen --restore&
unclutter -idle 7&
wmname LG3D&
dropbox start&
compton --config $HOME/.config/compton.conf -b
setxkbmap -layout "us" -variant "altgr-intl"&
xmodmap -e 'keycode 66 = Control_L'&
xmodmap -e 'clear Lock'&
xmodmap -e 'add Control = Control_L'&
$HOME/.dwm/dwmstatus/dwmstatus&
$HOME/bin/startdwm
