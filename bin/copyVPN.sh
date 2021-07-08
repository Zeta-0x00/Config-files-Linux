#!/bin/sh
TUN=$(/usr/sbin/ifconfig tun0 2>/dev/null )

if [ "$TUN" != "" ]; then
	echo -n $(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}') | xclip -sel clipboard
else
	echo -n "Disconnected" | xclip -sel clipboard
fi
