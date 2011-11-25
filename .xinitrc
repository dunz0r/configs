#!/bin/bash
urxvtd -o -f
nvidia-settings -a InitialPixmapPlacement=2
xmodmap ~/.xmodmap
xset -b
exec ck-launch-session dbus-launch awesome &> ~/.xsession-errors
