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
nitrogen --restore
<<<<<<< HEAD
wmname LG3D
=======
unclutter
>>>>>>> 6d4e199ef00cfff5d3be3b6e185ad1044e5ae1d2
$HOME/.dwm/dwmstatus/dwmstatus&
# To not have to quit X when restarting dwm
while true; do
$HOME/.dwm/dwm &> $HOME/.xsession-errors
done
