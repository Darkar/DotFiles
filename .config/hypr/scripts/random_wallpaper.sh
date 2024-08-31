#!/bin/bash

directory="$HOME/.config/hypr/img/backgrounds/"
monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`

for mon in $monitor;do
	if [ -d "$directory" ]; then
		random_background=$(ls "$directory"/*.png "$directory"/*.jpg | shuf -n 1)
		echo "$mon => $random_background"
		hyprctl hyprpaper preload $random_background > /dev/null
		hyprctl hyprpaper wallpaper $mon, $random_background > /dev/null		
	fi
done