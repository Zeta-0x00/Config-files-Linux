#!/bin/sh
IP=$(curl -s ipinfo.io | grep "ip" | awk '{print $2}' | tr '\n' ' ' | cut -d ',' -f 1 | tr '"' ' ')
echo -n $IP | xclip -sel clipboard
