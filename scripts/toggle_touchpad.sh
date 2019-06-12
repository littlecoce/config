#!/bin/bash

PAD="SynPS/2 Synaptics TouchPad"

# Property 147 is "Device Enabled"
# 	1 for enabled
#	0 for disabled
if [[ $(xinput list-props "$PAD" | grep 147) == *"1" ]]; then
	xinput disable "$PAD"
	STATE="disabled"
else
	xinput enable "$PAD"
	STATE="enabled"
fi

if [ $? -eq 0 ]; then
	notify-send -u low "Touchpad" $STATE
else
	notify-send "Touchpad" "NOT ${STATE},\nsomethings wrong"
fi
