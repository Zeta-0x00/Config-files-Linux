#!/bin/sh
echo "%{F#FF0000}%{u-}%{F#FFFFFF}" $(curl -s ifconfig.co) #$(curl -s ipinfo.io | grep "ip" | awk '{print $2}' | tr '\n' ' ' | cut -d ',' -f 1 | tr '"' ' ')
