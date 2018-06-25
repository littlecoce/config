#!/bin/bash

while :
do
	ip route get 8.8.8.8 | cut -d' ' -f5 | grep -v cache > ~/.config/polybar/gw
	sleep 60
done
