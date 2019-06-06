#!/bin/bash

id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')

if [ "$id" != "0x0" ]; then
	name=$(xprop -id "$id" | awk '/_NET_WM_NAME/{$1=$2="";print substr($0,4,length($0)-4)}')
	echo "$name"
else
	echo "-"
fi
