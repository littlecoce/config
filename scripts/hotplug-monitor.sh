#!/bin/bash

connected=($(xrandr | awk '{if($2=="connected") print $1}'))
offline=($(xrandr | awk '{if($2=="disconnected") print $1}'))

echo "$(tr '\n' ' ' <<< $connected) detected"
	
if [ "${#connected[@]}" -gt 1 ]; then
	left=$(echo -n $connected | tr "\n" " " | cut -f1 -d" ")
	echo "Primary display: $left"
	xrandr --output $left --auto --primary

	for I in "${connected[@]:1}"; do
		xrandr --output $I --right-of $left --auto 
	done;

elif [ "${#connected[@]}" -eq 1 ]; then
	echo "Primary display: $connected"
	/usr/bin/xrandr --output $connected --auto --primary
fi

for I in "${offline[@]}"; do
	echo "$I is offline"
	xrandr --output $I --off
done;

# if [ "connected" == "$DVI" ]; then
# 	/usr/bin/xrandr --output DisplayPort-0 --left-of LVDS --auto
# 	if [ "connected" == "$VGA" ]; then
# 		/usr/bin/xrandr --output VGA-0 --left-of DisplayPort-0 --auto
# 	else
# 		/usr/bin/xrandr --output VGA-0 --off
# 	fi
# 	/usr/bin/notify-send --urgency=low "Monitor Hotplug" "Monitor(s) connected"
# elif [ "connected" == "$VGA" ]; then
# 	/usr/bin/xrandr --output VGA-0 --left-of LVDS --auto
# 	/usr/bin/xrandr --output DisplayPort-0 --off
# 	/usr/bin/notify-send --urgency=low "Monitor Hotplug" "VGA-0 connected"
# else
# 	/usr/bin/xrandr --output VGA-0 --off
# 	/usr/bin/xrandr --output DisplayPort-0 --off
# 	/usr/bin/notify-send --urgency=low "Monitor Hotplug" "Second Monitor disconnected"
# fi
#
#
#
#/usr/bin/xrandr --output eDP --left-of HDMI-A-0 --auto --primary
#/usr/bin/xrandr --output HDMI-A-0 --right-of eDP --auto
/bin/bash ~/.config/scripts/launch.sh 2>&1 >/dev/null
/usr/bin/feh --bg-fill ~/.config/current.jpg
#betterlockscreen -u ~/.config/default/lock.jpg
exit
