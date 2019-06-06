#!/bin/bash

NrOfScreens=`xrandr | awk '/connected/ { print $1 }' | wc -l`

if [ "$NrOfScreens" -eq "2" ]
then
	ScreenOne=`xrandr | awk '/connected/ { print $1 }' | sed -n '1p'`
	SecondOne=`xrandr | awk '/connected/ { print $1 }' | sed -n '2p'`	

	xrandr --output "$ScreenOne" --auto --output "$SecondOne" --auto --above "$ScreenOne"
else
	xrandr --output `xrandr | awk '/connected/ { print $1 }' | sed -n '1p'` --auto
fi
