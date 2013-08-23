#!/bin/bash
#

eval `/usr/bin/ssh-agent`

if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
then
	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
fi

#xmodmap ~/.xmodmap
urxvtd -o -f
if [ $HOSTNAME == "ingrid" ]
then
	nvidia-settings -a InitialPixmapPlacement=2&
fi
xset -b
wmname LG3D
unclutter -j 10 -d 3&
$HOME/.dwm/dwmstatus/dwmstatus&
$HOME/bin/bg-change&
nitrogen --restore
xmodmap $HOME/.xmodmap
# To not have to quit X when restarting dwm
while true; do
	$HOME/.dwm/dwm &> $HOME/.xsession-errors
done
