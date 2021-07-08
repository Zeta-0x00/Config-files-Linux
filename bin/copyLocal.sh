#!/bin/sh
ETHERIP=$(/usr/sbin/ifconfig enp0s25 | grep 'inet ' | awk '{print $2}')

if [ "$ETHERIP" = "" ]; then
	# Change usb0 for your USB interface
	USBIP=$(/usr/sbin/ifconfig usb0 2>/dev/null)
	if [ $(echo $?) != "1" ]; then
		echo -n $(/usr/sbin/ifconfig usb0 | grep 'inet ' | awk '{print $2}') | xclip -sel clipboard
	else
		# Change bnep0 for your Bluetooth lan interface
		BLUETOOTHIP=$(/usr/sbin/ifconfig bnep0 2>/dev/null)
		if [ $(echo $?) != "1" ]; then
			echo -n $(/usr/sbin/ifconfig bnep0 | grep 'inet ' | awk '{print $2}') | xclip -sel clipboard
		else
			# Change your wireless interface
			WLAN=$(/usr/sbin/ifconfig wlo1 | grep 'inet ' 2>/dev/null)
			if [ $(echo $?) = "0" ]; then
				echo -n $(/usr/sbin/ifconfig wlo1 | grep 'inet ' | awk '{print $2}') | xclip -sel clipboard
			else
				echo "%{F#FF0000}%{u-}%{F#FFFFFF} No Interfaces"
			fi
		fi
	fi
else
	echo -n $ETHERIP | xclip -sel clipboard
fi
