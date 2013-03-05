#!/bin/bash
#

#xset -b # disable bell
eval `/usr/bin/ssh-agent`
#urxvtd -o -f

if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
then
	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
fi

xmodmap ~/.xmodmap
urxvtd -o -f
nvidia-settings -a InitialPixmapPlacement=2&
nitrogen --restore
# Clock + mpd
#hile true; do 
#xsetroot -name "$(date +"%F %R |" ;mpc|head -1)"; 
#sleep 1m; 
#one&
# To not have to quit X when restarting dwm
while true; do
$HOME/.dwm/dwm &> $HOME/.xsession-errors
done
