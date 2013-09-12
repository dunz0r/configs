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
$HOME/.dwm/dwmstatus/dwmstatus&
$HOME/bin/bg-change&
nitrogen --restore
xmodmap $HOME/.xmodmap
nitrogen --restore
# To not have to quit X when restarting dwm
$HOME/bin/startdwm
