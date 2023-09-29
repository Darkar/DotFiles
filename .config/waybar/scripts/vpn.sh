#!/usr/bin/env bash

if [ "$1" == "vpn" ]; then
    if [ -d '/proc/sys/net/ipv4/conf/tun0' ]; then
        wofi --conf=$HOME/.config/wofi/config.password --style=$HOME/.config/wofi/style.password.css | sudo -S killall openvpn
    else
        vpn=`find $HOME/Documents/VPN/ -type f -name "*.ovpn" -printf "%f\n" | sed 's/\.ovpn$//1' | wofi --dmenu`;
        if [ -n "$vpn" ]; then
            wofi --conf=$HOME/.config/wofi/config.password --style=$HOME/.config/wofi/style.password.css | sudo -S openvpn $HOME/Documents/VPN/$vpn.ovpn
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

