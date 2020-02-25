#!/bin/bash

if [[ $1 == picom ]]; then
	PROG=picom
elif [[ $1 == xautolock ]]; then
	PROG=xautolock
elif [[ $1 == bluetooth ]]; then
	$HOME/.config/scripts/toggle_bluetooth.sh
	exit $?
else
	exit 1;
fi

PID=$(pidof $PROG)

if [[ $? -eq 0 ]]; then
	kill $PID
	if [[ $? -eq 0 ]]; then
		notify-send -u low $PROG "Deactivated"
	else
		notify-send $PROG "A problem occured (deacvtivate)"
	fi
else
	if [[ $PROG == picom ]]; then
		picom -b --config ~/.config/.picom.conf &
	elif [[ $PROG == xautolock ]]; then 
		~/.config/scripts/xautolock.sh &
	fi
	if [[ $? -eq 0 ]]; then
		notify-send -u low $PROG "Activated"
	else
		notify-send $PROG "A problem occured (activate)"
	fi
fi
exit 0
