#!/bin/bash

DP1=$(</sys/class/drm/card0-DP-1/status)
VGA=$(</sys/class/drm/card0-VGA-1/status)

if [ "connected" == "$DP1" ]; then
	/usr/bin/xrandr --output DisplayPort-0 --left-of LVDS --auto
	if [ "connected" == "$VGA" ]; then
		/usr/bin/xrandr --output VGA-0 --left-of DisplayPort-0 --auto
	else
		/usr/bin/xrandr --output VGA-0 --off
	fi
	/usr/bin/notify-send --urgency=low "Monitor Hotplug" "Monitor(s) connected"
elif [ "connected" == "$VGA" ]; then
	/usr/bin/xrandr --output VGA-0 --left-of LVDS --auto
	/usr/bin/xrandr --output DisplayPort-0 --off
	/usr/bin/notify-send --urgency=low "Monitor Hotplug" "VGA-0 connected"
else
	/usr/bin/xrandr --output VGA-0 --off
	/usr/bin/xrandr --output DisplayPort-0 --off
	/usr/bin/notify-send --urgency=low "Monitor Hotplug" "Second Monitor disconnected"
fi
/usr/bin/sh ~/.config/scripts/launch.sh &>2 >/dev/null
/usr/bin/feh --bg-fill ~/.config/default/current.jpg
/usr/bin/betterlockscreen -u ~/.config/default/lock.jpg
exit
