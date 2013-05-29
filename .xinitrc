#!/bin/bash
#

eval `/usr/bin/ssh-agent`

if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
then
	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
fi

xmodmap ~/.xmodmap
urxvtd -o -f
if [ $HOSTNAME == "ingrid" ]
then
	nvidia-settings -a InitialPixmapPlacement=2&
fi
xset -b
nitrogen --restore
unclutter
$HOME/.dwm/dwmstatus/dwmstatus&
# To not have to quit X when restarting dwm
while true; do
$HOME/.dwm/dwm &> $HOME/.xsession-errors
done
