#!/bin/bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot $PICTURE"

BLUR="5x4"

$SCREENSHOT
convert $PICTURE -blur $BLUR $PICTURE
pkill -u "$USER" -USR1 dunst
i3lock -u -e -i $PICTURE
pkill -u "$USER" -USR2 dunst
rm $PICTURE
