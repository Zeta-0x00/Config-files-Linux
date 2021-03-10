#!/bin/bash

# Wrote by Zeta (2021)

# Simple Script to get the VPN Private IP
# Most of the Linux systems use the tun0
# interface for that, if your OS don't
# use them, you must be change the tun0
# for your vpn interface

#  💀

TUN=$(/usr/sbin/ifconfig tun0 2>/dev/null )

if [ "$TUN" != "" ]; then
	echo "<txt>" " $(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')" "</txt>"
else
	echo "<txt>" "" "</txt>"
fi