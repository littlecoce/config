#!/bin/sh

exec xautolock -time 5 \
	-locker "betterlockscreen -l blur" \
	-detectsleep
	-secure

# Disable screen after a given time
# -> Use killer feature
