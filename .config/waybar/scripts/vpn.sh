#!/usr/bin/env bash

if [ "$1" == "vpn" ]; then
    if [ -d '/proc/sys/net/ipv4/conf/tun0' ]; then
        pass=$(rofi -dmenu -password  -theme $HOME/.config/rofi/get.rasi  -p "🔑 ")
        if [ "$?" -eq 0 ]; then
            echo "$pass" | sudo -S killall openvpn
        fi
    else
        vpn=`find $HOME/Documents/VPN/ -type f -name "*.ovpn" -printf "%f\n" | sed 's/\.ovpn$//1' |  rofi -dmenu -theme $HOME/.config/rofi/list.rasi -p ""`;
        if [ -n "$vpn" ]; then
            pass=$(rofi -dmenu -password -theme $HOME/.config/rofi/get.rasi -p "🔑 ")
            if [ "$?" -eq 0 ]; then
                echo "$pass" | sudo -S openvpn $HOME/Documents/VPN/$vpn.ovpn
            fi
        fi
    fi
else
    if [ -d '/proc/sys/net/ipv4/conf/tun0' ]; then 
        ip="\" VPN [$(/sbin/ifconfig tun0 | awk '/inet / {print $2}')]\""
        echo '{"text": '"$ip"'}'
    else 
        echo '{"text":" VPN"}'
    fi
fi

