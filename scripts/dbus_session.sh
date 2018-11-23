#!/bin/bash

addr=$(env | grep -i DBUS_SESSION_BUS_ADDRESS)

if [ ! -z ${addr} ] ; then
	echo "export ${addr}" > $HOME/.dbus_addr
fi
