#!/bin/bash

if [[ $1 == picom ]]; then
	PROG=picom
elif [[ $1 == xautolock ]]; then
	PROG=xautolock
elif [[ $1 == bluetooth ]]; then
	$HOME/.config/scripts/toggle_bluetooth.sh
	exit $?
elif [[ $1 == cups ]]; then
	PROG=cupsd
else
	exit 1;
fi

PID=$(pidof $PROG)
if [[ $? -eq 0 ]]; then
        if [[ $PROG == cupsd ]];then
            sudo systemctl stop cups.service
        else
            kill $PID
        fi
	if [[ $? -eq 0 ]]; then
		notify-send -u low $PROG "Deactivated"
	else
		notify-send $PROG "A problem occured (deacvtivate)"
	fi
else
	if [[ $PROG == picom ]]; then
		picom --experimental-backends -b --config ~/.config/.picom.conf &
	elif [[ $PROG == xautolock ]]; then 
		~/.config/scripts/xautolock.sh &
	elif [[ $PROG == cupsd ]]; then
		sudo systemctl start cups.service
	fi
	if [[ $? -eq 0 ]]; then
		notify-send -u low $PROG "Activated"
	else
		notify-send $PROG "A problem occured (activate)"
	fi
fi
exit 0
