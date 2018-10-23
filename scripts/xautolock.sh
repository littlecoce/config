#!/bin/sh

exec xautolock -time 5 \
	-notify 30 \
	-notifier "notify-send Lock 'Locking in 30 seconds'" \
	-locker "~/.config/scripts/i3exit lock" \
	-detectsleep \
	-secure

# Disable screen after a given time
# -> Use killer feature
