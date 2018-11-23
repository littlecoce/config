#!/bin/bash

CAP=$(</sys/class/power_supply/BAT0/capacity)
STAT=$(</sys/class/power_supply/BAT0/status)

# Delay to wait until NB hibernates
DELAY=30

# Messages to display
MSG="CAP is lower than 15%"
MSG_CRIT="CAP is at 5%
Hibernating in ${DELAY} Seconds
Stop with killall check_bat.sh"

# Sets dbus address variable to display dunst messages correctly 
# when scheduled via cron. Check dbus_session.sh script!
if [ -z $HOME/.dbus_addr ] ; then
	exit 1
else 
	. $HOME/.dbus_addr
fi

if [ "${STAT,,}x" == "dischargingx" ] ; then
	if [[ ${CAP} -lt 15 && ${CAP} -gt 5 ]] ; then
		notify-send -u critical Battery "${MSG}"
	elif [ ${CAP} -le 5 ] ; then
		notify-send -u critical Battery "${MSG_CRIT}"
		sleep ${DELAY}
		STAT=$(</sys/class/power_supply/BAT0/status)
		if [ "${STAT,,}x" == "dischargingx" ] ; then
			$HOME/.config/scripts/i3exit hibernate
		fi
	fi
fi
