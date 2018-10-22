#!/bin/bash

IPs=$(ip route get 8.8.8.8 2> /dev/null)
if [[ $? != 0 ]]; then
	echo "No GW"
else
	IPs=$(echo "${IPs}" | grep -v cache | cut -d' ' -f7)
	echo $IPs
fi
