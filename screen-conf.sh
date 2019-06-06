#!/bin/bash


if [ ! -f /tmp/screen ]
then
	echo '0' > /tmp/screen
fi



NrOfScreens=`xrandr | awk '/connected/ { print $1 }' | wc -l`
ScreenStatus=`more /tmp/screen`



if [ "$NrOfScreens" -eq "2" ]
then
	ScreenOne=`xrandr | awk '/connected/ { print $1 }' | sed -n '1p'`
	SecondOne=`xrandr | awk '/connected/ { print $1 }' | sed -n '2p'`	

	if [ "$ScreenStatus" -eq "0" ]
	then
		xrandr --output "$ScreenOne" --auto --output "$SecondOne" --auto --above "$ScreenOne"
		echo '1' > /tmp/screen

	elif [ "$ScreenStatus" -eq "1" ]
	then
		xrandr --output "$ScreenOne" --off --output "$SecondOne" --auto
		sudo vbetool dpms off
		echo '2' > /tmp/screen
	else
		sudo vbetool dpms on
		xrandr --output "$SecondOne" --off --output "$ScreenOne" --auto
		echo '0' > /tmp/screen
	fi	

else
	xrandr --output `xrandr | awk '/connected/ { print $1 }' | sed -n '1p'` --auto
fi
