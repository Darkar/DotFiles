#!/bin/bash

entries="\n⏻"

selected=$(echo -e $entries | rofi -dmenu -theme $HOME/.config/rofi/powermenu.rasi)

case $selected in
  "")
    exec systemctl reboot;;
  "⏻")
    exec systemctl poweroff -i;;
esac
