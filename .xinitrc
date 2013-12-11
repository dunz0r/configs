#!/bin/bash
#

eval `/usr/bin/ssh-agent`

if test -f /usr/lib/openssh/gnome-ssh-askpass
then
	SSH_ASKPASS=/usr/lib/openssh/gnome-ssh-askpass ssh-add < /dev/null
fi

urxvtd -o -f
xset -b
# To not have to quit X when restarting dwm
$HOME/bin/startdwm
if [ $HOSTNAME == "ingrid" ]
then
	nvidia-settings -a InitialPixmapPlacement=2&
else
	xfce4-powermanager&
fi
wmname LG3D
$HOME/.dwm/dwmstatus/dwmstatus&
xmodmap $HOME/.xmodmap
gnome-settings-daemon&
nm-applet&
nitrogen --restore
