#!/bin/sh

# Wrote by Zeta (2021)
# This interfaces are from a Kali Linux

# Internet basic interfaces on Unix like Systems
# for a proper operation you must change the
# net interfaces acording to the your OS


# Change eth0 for your Ethernet interface
ETHERIP=$(/usr/sbin/ifconfig eth0 | grep 'inet ' | awk '{print $2}')

if [ "$ETHERIP" = "" ]; then
	# Change usb0 for your USB interface
	USBIP=$(/usr/sbin/ifconfig usb0 2>/dev/null)
	if [ $(echo $?) != "1" ]; then 
		echo "<txt>"  $(/usr/sbin/ifconfig usb0 | grep 'inet ' | awk '{print $2}')"</txt>"
	else
		# Change bnep0 for your Bluetooth lan interface
		BLUETOOTHIP=$(/usr/sbin/ifconfig bnep0 2>/dev/null)
		if [ $(echo $?) != "1" ]; then 
			echo "<txt>"  $(/usr/sbin/ifconfig bnep0 | grep 'inet ' | awk '{print $2}')"</txt>"
		else
			# Change your wireless interface
			WLAN=$(/usr/sbin/ifconfig wlan0 2>/dev/null)
			if [ $(echo $?) != "1" ]; then 
				echo "<txt>" 泌 $(/usr/sbin/ifconfig wlan0 | grep 'inet ' | awk '{print $2}')"</txt>"
			else
				echo  "No Internet Interfaces"
			fi
		fi
	fi	
else
	echo "<txt>"  $ETHERIP "</txt>"
fi