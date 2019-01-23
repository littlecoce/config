#!/bin/bash

DP1=$(</sys/class/drm/card0-DP-1/status)
VGA=$(</sys/class/drm/card0-VGA-1/status)

if [ "connected" == "$DP1" ]; then
	/usr/bin/xrandr --output DisplayPort-0 --left-of LVDS --auto
	/usr/bin/xrandr --output VGA-0 --off
	/usr/bin/notify-send --urgency=normal "Monitor Hotplug" "DP-1 connected"
elif [ "connected" == "$VGA" ]; then
	/usr/bin/xrandr --output VGA-0 --left-of LVDS --auto
	/usr/bin/xrandr --output DisplayPort-0 --off
	/usr/bin/notify-send --urgency=normal "Monitor Hotplug" "VGA-0 connected"
else
	/usr/bin/xrandr --output VGA-0 --off
	/usr/bin/xrandr --output DisplayPort-0 --off
	/usr/bin/notify-send --urgency=normal "Monitor Hotplug" "Second Monitor disconnected"
fi
