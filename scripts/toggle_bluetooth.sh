#/bin/bash

# Allow users to enable/disable the bluetooth service

STATE="$(systemctl is-active bluetooth.service)"
echo "State is ${STATE}"

if [ ${STATE} = "active" ]; then
	bluetoothctl <<< "power off" # Just to be sure
	sudo systemctl stop bluetooth.service
	notify-send -u low "Bluetooth deactivated!"
else
	sudo systemctl start bluetooth.service
	bluetoothctl <<< "power on" 
	notify-send -u low "Bluetooth activated!"
fi
