#!/bin/bash

addr=$(env -i DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS")

if [ ! -z ${addr} ] ; then
	echo "export ${addr}" > $HOME/.dbus/.dbus_addr
fi
