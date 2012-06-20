#!/bin/bash
#

xset -b # disable bell
eval `/usr/bin/ssh-agent`
urxvtd -o -f

if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
then
	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
fi

xrdb -merge $HOME/.Xresources
xmodmap ~/.xmodmap

nvidia-settings -a InitialPixmapPlacement=2&
exec ck-launch-session startkde
