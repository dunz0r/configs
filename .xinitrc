#!/bin/bash
urxvtd -o -f
nvidia-settings -a InitialPixmapPlacement=2
xmodmap ~/.xmodmap
xset -b
nitrogen --restore&
wmaker &> ~/.xsession-errors
