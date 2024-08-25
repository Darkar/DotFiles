#!/usr/bin/env bash

choice=`find /etc/netctl -maxdepth 1 -type f -printf "%f\n" | rofi -dmenu -theme $HOME/.config/rofi/list.rasi -p "🌩 "`;
if [ -n "$choice" ]; then
  pass=$(rofi -dmenu -password -theme $HOME/.config/rofi/get.rasi -p "🔑 ")
  if [ "$?" -eq 0 ]; then
    echo "$pass" | sudo -S netctl switch-to $choice;
  fi
fi
