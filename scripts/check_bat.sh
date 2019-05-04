#!/bin/bash

# Remember to create a cron job to execute regular

# WCAP is the warning threshold, 
# HCAP threshold to hibernate
WCAP=20
HCAP=5

# Delay to wait until NB hibernates under WCAP value
DELAY=30

# Messages to display
MSG="CAP is lower than ${WCAP}"
MSG_CRIT="CAP is at ${HCAP}
Hibernating in ${DELAY} Seconds
Stop with killall check_bat.sh"

# Sets dbus address variable to display dunst messages correctly 
# when scheduled via cron. Check dbus_session.sh script!
if [ -z $HOME/.dbus/.dbus_addr ] ; then
	exit 1
else 
	. $HOME/.dbus/.dbus_addr
fi

CAP=$(</sys/class/power_supply/BAT0/capacity)
STAT=$(</sys/class/power_supply/BAT0/status)

if [ "${STAT,,}x" == "dischargingx" ] ; then
	if [[ ${CAP} -lt ${WCAP} && ${CAP} -gt 5 ]] ; then
		notify-send -u critical Battery "${MSG}"
	elif [ ${CAP} -le ${HCAP} ] ; then
		notify-send -u critical Battery "${MSG_CRIT}"
		sleep ${DELAY}
		STAT=$(</sys/class/power_supply/BAT0/status)
		if [ "${STAT,,}x" == "dischargingx" ] ; then
			$HOME/.config/scripts/i3exit hibernate
		fi
	fi
fi
