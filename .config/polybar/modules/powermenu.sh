#!/bin/bash

uptime="`uptime -p | sed -e 's/up //g'`"

shutdown=''
reboot=''
lock=''
logout=''

chosen=$(echo -e "$lock\n$logout\n$reboot\n$shutdown" | rofi -p "$USER@$(hostname)"  -mesg "Uptime: $uptime"  -dmenu -theme powermenu -i)

if [[ $chosen = "$lock" ]]; then
	$HOME/.config/i3/i3lock.sh
elif [[ $chosen = "$logout" ]]; then
	i3-msg exit
elif [[ $chosen = "$reboot" ]]; then
	systemctl reboot
elif [[ $chosen = "$shutdown" ]]; then
	systemctl poweroff
fi