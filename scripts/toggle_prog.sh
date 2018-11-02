#!/bin/bash

if [[ $1 == compton ]]; then
	PROG=compton
elif [[ $1 == xautolock ]]; then
	PROG=xautolock
else
	exit 1;
fi

pidof $PROG 2>&1 > /dev/null

if [[ $? -eq 0 ]]; then
	killall $PROG
	if [[ $? -eq 0 ]]; then
		notify-send $PROG "Deactivated"
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
		notify-send $PROG "Activated"
	else
		notify-send $PROG "A problem occured (activate)"
	fi
fi
