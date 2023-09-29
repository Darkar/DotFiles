#!/bin/bash

# Require rsync

OPTION="-v -r --delete-after"

dotfiles=(
    ".config/hypr/"
    ".config/waybar/"
    ".config/mako/"
    ".config/wofi/"
    ".config/kitty/"
    ".config/nvim/"
    ".zshrc"
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
