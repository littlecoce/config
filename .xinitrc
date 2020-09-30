#!/bin/bash
xrandr --output HDMI-0 --left-of VGA-0 --auto --primary
setxkbmap -option caps:swapescape
xset b off
xrdb ~/.Xresources
cat ~/.config/i3/config.base ~/.config/i3/autostart > ~/.config/i3/config
export PATH=$PATH:/home/nonce/launchers
exec i3

# RXVT options, see wiki.gentoo.org/wiki/Rxvt-unicode
# [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# exec "urxvtd --quiet --opendisplay --fork"
