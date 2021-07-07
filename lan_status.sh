#!/bin/sh

# Wrote by Zeta (2021)
# This interfaces are from Kali Linux

# Internet basic interfaces on Unix like Systems
# for a proper operation you must change the
# net interfaces acording to the your OS


# Change eth0 for your Ethernet interface
#!/bin/sh
ETHERIP=$(/usr/sbin/ifconfig eth0 | grep 'inet ' | awk '{print $2}')

if [ "$ETHERIP" = "" ]; then
	# Change usb0 for your USB interface
	USBIP=$(/usr/sbin/ifconfig usb0 2>/dev/null)
	if [ $(echo $?) != "1" ]; then
		echo "%{F#00AAFF}%{u-}%{F#FFFFFF}" $(/usr/sbin/ifconfig usb0 | grep 'inet ' | awk '{print $2}')
	else
		# Change bnep0 for your Bluetooth lan interface
		BLUETOOTHIP=$(/usr/sbin/ifconfig bnep0 2>/dev/null)
		if [ $(echo $?) != "1" ]; then
			echo "%{F#00AAFF}%{u-}%{F#FFFFFF}" $(/usr/sbin/ifconfig bnep0 | grep 'inet ' | awk '{print $2}')
		else
			# Change your wireless interface
			WLAN=$(/usr/sbin/ifconfig wlan0 | grep 'inet ' 2>/dev/null)
			if [ $(echo $?) = "0" ]; then
				echo "%{F#00AAFF}泌%{u-}%{F#FFFFFF}" $(/usr/sbin/ifconfig wlan0 | grep 'inet ' | awk '{print $2}')
			else
				echo "%{F#FF0000}%{u-}%{F#FFFFFF} No Interfaces"
			fi
		fi
	fi
else
	echo "%{F#00AAFF}%{u-}%{F#FFFFFF}" $ETHERIP
fi
