#!/bin/bash
xset -b
urxvtd -o -f
pulseaudio -D &
skype&
nitrogen --restore&
unclutter -idle 7&
wmname LG3D&
setxkbmap -layout "us" -variant "altgr-intl"
xmodmap -e 'keycode 66 = Control_L'
xmodmap -e 'clear Lock'
xmodmap -e 'add Control = Control_L'
$HOME/.dwm/dwmstatus/dwmstatus&
$HOME/bin/startdwm
