#!/bin/bash
#

eval `/usr/bin/ssh-agent`

if test -f /usr/lib/openssh/gnome-ssh-askpass
then
	SSH_ASKPASS=/usr/lib/openssh/gnome-ssh-askpass ssh-add < /dev/null
fi

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
xfce4-power-manager&
nm-applet&
dropbox start&
# To not have to quit X when restarting dwm
$HOME/bin/startdwm
