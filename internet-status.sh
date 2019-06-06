#!/bin/sh

wifi_state=`cat /sys/class/net/wlp8s0/operstate`
eth_state=`cat /sys/class/net/eno1/operstate`

if [ "$eth_state" = "up" ]; then
	echo "ETH"
elif [ "$wifi_state" = "up" ]; then
	echo "WIFI"
else
	echo "NONE"
fi
