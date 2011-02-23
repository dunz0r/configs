#!/bin/bash
urxvtd -o -f
nvidia-settings -a InitialPixmapPlacement=2
xmodmap ~/.xmodmap
xset -b
nitrogen --restore&
conky -c /home/dunz0r/.conky/conkyrc_red
wmaker &> ~/.xsession-errors
