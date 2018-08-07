#!/bin/sh

exec xautolock -time 3 \
	-locker "betterlockscreen -l blur" \
	-detectsleep
	-secure

# Disable screen after a given time
# -> Use killer feature
