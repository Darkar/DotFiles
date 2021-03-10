#!/bin/bash

# Require rsync

OPTION="-v -r --delete-after"

rsync $OPTION ~/.conky/ .conky/ --exclude "cred_mail.py" --exclude "__pycache__"
rsync $OPTION ~/.config/i3/ .config/i3/
rsync $OPTION ~/.config/polybar/ .config/polybar/ --exclude "cred_mail.py" --exclude "__pycache__"
rsync $OPTION  ~/.config/picom/ .config/picom/
rsync  ~/.config/autorandr/ .config/autorandr/
rsync -v -r --delete-after ~/.config/rofi/ .config/rofi/
rsync -v -r --delete-after ~/.config/neofetch/ .config/neofetch/
rsync -v -r --delete-after ~/.config/dunst/ .config/dunst/
rsync -v -r --delete-after ~/.config/alacritty/ .config/alacritty/
rsync -v -r --delete-after ~/.config/nvim/init.vim .config/nvim/init.vim
rsync -v -r --delete-after ~/.Xdefaults .
rsync -v -r --delete-after ~/.zshrc .
rsync -v -r --delete-after ~/.face .
rsync -v -r --delete-after ~/.xinitrc .

