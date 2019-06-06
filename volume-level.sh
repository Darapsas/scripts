#!/bin/bash

VLevel=`awk -F"[][]" '/%/ { print $2 }' <(amixer -D pulse sget Master) | sed -n 1p`
IsMute=`awk -F"[][]" '/%/ { print $4 }' <(amixer -D pulse sget Master) | sed -n 1p`

if [ "$IsMute" = "off" ]; then
	echo "$IsMute"
else
	echo "$VLevel"
fi
