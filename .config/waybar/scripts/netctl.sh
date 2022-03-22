#!/usr/bin/env bash

choice=`find /etc/netctl -maxdepth 1 -type f -printf "%f\n" | wofi --dmenu`;
choice="Désactivé le wifi"
if [ -n "$choice" ]; then
  wofi --conf=$HOME/.config/wofi/config.password --style=$HOME/.config/wofi/style.password.css | sudo -S netctl switch-to $choice;
fi
