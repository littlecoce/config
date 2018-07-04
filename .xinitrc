#!/bin/bash
exec i3

# RXVT options, see wiki.gentoo.org/wiki/Rxvt-unicode
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec "urxvtd --quiet --opendisplay --fork"
