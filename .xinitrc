#!/bin/bash
export DESKTOP_SESSION=gnome
xset -b&
start-pulseaudio-x11 &
unclutter -idle 7&
setxkbmap -layout "us" -variant "altgr-intl"
docker-tray -wmaker&
nextcloud&
nm-applet&
xset mouse 1/3 5&
exec wmaker
