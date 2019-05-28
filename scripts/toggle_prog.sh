#!/bin/bash

if [[ $1 == compton ]]; then
	PROG=compton
elif [[ $1 == xautolock ]]; then
	PROG=xautolock
elif [[ $1 == bluetooth ]]; then
	$HOME/.config/scripts/toggle_bluetooth.sh
	exit $?
else
	exit 1;
fi

pidof $PROG 2>&1 > /dev/null

if [[ $? -eq 0 ]]; then
	killall $PROG
	if [[ $? -eq 0 ]]; then
		notify-send -u low $PROG "Deactivated"
	else
		notify-send $PROG "A problem occured (deacvtivate)"
	fi
else
	if [[ $PROG == compton ]]; then
		compton --config ~/.config/.compton.conf &
	elif [[ $PROG == xautolock ]]; then 
		~/.config/scripts/xautolock.sh &
	fi
	if [[ $? -eq 0 ]]; then
		notify-send -u low $PROG "Activated"
	else
		notify-send $PROG "A problem occured (activate)"
	fi
fi
