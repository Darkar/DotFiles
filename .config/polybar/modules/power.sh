#!/bin/bash

# Simple script to handle a DIY shutdown menu. When run you should see a bunch of options (shutdown, reboot etc.)
#
# Requirements:
# - rofi
# - systemd, but you can replace the commands for OpenRC or anything else
#
# Instructions:
# - Save this file as power.sh or anything
# - Give it exec priviledge, or chmod +x /path/to/power.sh
# - Run it

chosen=$(echo -e " Annuler\n Déconnexion\n Eteindre\n Redémarrer" | rofi -dmenu -theme powermenu -i)
# Info about some states are available here:
# https://www.freedesktop.org/software/systemd/man/systemd-sleep.conf.html#Description

if [[ $chosen = " Déconnexion" ]]; then
	i3-msg exit
elif [[ $chosen = " Eteindre" ]]; then
	systemctl poweroff
elif [[ $chosen = " Redémarrer" ]]; then
	systemctl reboot
fi
