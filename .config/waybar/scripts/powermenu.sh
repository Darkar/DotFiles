#!/bin/bash

entries=" Déconnexion\n Suspension \n Redémarrage \n⏻ Arrêt"

selected=$(echo -e $entries | wofi --conf=$HOME/.config/wofi/config.powermenu --style=$HOME/.config/wofi/style.powermenu.css | awk '{print tolower($2)}')

case $selected in
  déconnexion)
    swaymsg exit;;
  suspension)
    exec systemctl suspend;;
  redémarrage)
    exec systemctl reboot;;
  arrêt)
    exec systemctl poweroff -i;;
esac
