#!/bin/bash

if [ "$1" == "vpn" ]; then
    if [ -d '/proc/sys/net/ipv4/conf/tun0' ]; then
        rofi -dmenu -theme password -password -p "" | sudo -S killall openvpn
    else
        vpn=`find $HOME/Documents/VPN/ -type f -name "*.ovpn" -printf "%f\n" | sed 's/\.ovpn$//1' | rofi -theme vpn -dmenu -p "VPN"`;
        if [ -n "$vpn" ]; then
            rofi -dmenu -theme password -password -p "" | sudo -S openvpn $HOME/Documents/VPN/$vpn.ovpn
        fi
    fi
else
    if [ -d '/proc/sys/net/ipv4/conf/tun0' ]; then 
        echo "%{F#F0C674} [$(/sbin/ifconfig tun0 | awk '/inet / {print $2}')]%{F-}"
    else 
        echo "%{F#F0C674} %{F-} VPN"
    fi
fi