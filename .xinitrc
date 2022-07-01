#!/bin/bash
xset b off
xrdb ~/.Xresources
cat ~/.config/i3/config.base ~/.config/i3/autostart > ~/.config/i3/config
export PATH=$PATH:/home/nonce/launchers

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		   [ -x "$f" ] && . "$f"
		    done
		     unset f
fi

exec i3
#xrandr --output HDMI-0 --left-of VGA-0 --auto --primary

# RXVT options, see wiki.gentoo.org/wiki/Rxvt-unicode
# [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# exec "urxvtd --quiet --opendisplay --fork"
