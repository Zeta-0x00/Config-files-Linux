#!/bin/sh


#The script gets the active NetwokInterface


#region Interfaces
EthernetInterface='enp0s25' #In Debian base eth0
USBInterface='enp0s20u3u3' #In Debian base usb0
WirelessInterface='wlo1' #In Debian base wlan0
BluetoothInterface='bnep0' #Same in Debian base
#end region


ETHERIP=$(/usr/sbin/ifconfig $EthernetInterface | grep 'inet ' | awk '{print $2}')

if [ "$ETHERIP" = "" ]; then
	# Change usb0 for your USB interface
	USBIP=$(/usr/sbin/ifconfig  $USBInterface 2>/dev/null)
	if [ $(echo $?) = "0" ]; then
		echo "%{F#00AAFF}%{u-}%{F#FFFFFF}" $(/usr/sbin/ifconfig $USBInterface | grep 'inet ' | awk '{print $2}')
	else
		# Change bnep0 for your Bluetooth lan interface
		BLUETOOTHIP=$(/usr/sbin/ifconfig $BluetoothInterface 2>/dev/null)
		if [ $(echo $?) = "0" ]; then
			echo "%{F#00AAFF}%{u-}%{F#FFFFFF}" $(/usr/sbin/ifconfig $BluetoothInterface | grep 'inet ' | awk '{print $2}')
		else
			# Change your wireless interface
			WLAN=$(/usr/sbin/ifconfig $WirelessInterface | grep 'inet ' 2>/dev/null)
			if [ $(echo $?) = "0" ]; then
				echo "%{F#00AAFF}泌%{u-}%{F#FFFFFF}" $(/usr/sbin/ifconfig $WirelessInterface | grep 'inet ' | awk '{print $2}')
			else
				echo "%{F#FF0000}%{u-}%{F#FFFFFF} No Interfaces"
			fi
		fi
	fi
else
	echo "%{F#00AAFF}%{u-}%{F#FFFFFF}" $ETHERIP
fi
