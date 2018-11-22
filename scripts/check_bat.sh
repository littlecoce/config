#!/bin/bash

CAP=$(</sys/class/power_supply/BAT0/capacity)
STAT=$(</sys/class/power_supply/BAT0/status)

# Delay to wait until NB hibernates
DELAY=30

# Messages to display
MSG ="CAP is lower than 15%"
MSG_CRIT="CAP is at 5%
Hibernating in ${DELAY} Seconds
Stop with killall check_bat.sh"

if [ "${STAT,,}x" == "dischargingx" ] ; then
	if [[ ${CAP} -lt 20 && ${CAP} -gt 5 ]] ; then
		notify-send -u critical Battery ${MSG}
	elif [ ${CAP} -le 5 ] ; then
		notify-send -u critical Battery ${MSG_CRIT}
		sleep ${DELAY}
		STAT=$(</sys/class/power_supply/BAT0/status)
		if [ "${STAT,,}x" == "dischargingx" ] ; then
			$HOME/.config/scripts/i3exit hibernate
		fi
	fi
fi
