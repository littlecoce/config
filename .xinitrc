#!/bin/bash
xset b off
xrdb ~/.Xresources
cat ~/.config/i3/config.base ~/.config/i3/autostart > ~/.config/i3/config
exec i3

# RXVT options, see wiki.gentoo.org/wiki/Rxvt-unicode
# [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# exec "urxvtd --quiet --opendisplay --fork"
