#!/bin/bash

# Require rsync

dotfiles=(
    ".config/i3/"
    ".config/polybar/"
    ".config/dunst/"
    ".config/rofi/"
    ".config/kitty/"
    ".config/nvim"
    ".config/picom"
    ".fonts"
    ".themes/TokyoNight/"
)

echo "Synchronisation de:"
for path in ${dotfiles[*]} ;do
    if [ ${path: -1} == "/" ] ; then
        mkdir -p "$path"
    fi
    rsync -r --delete-after "$HOME/$path" "$path"
    if [ "$?" -ne 0 ]; then
        echo "- $path NOK"
    else
        echo "- $path OK"
    fi
done
