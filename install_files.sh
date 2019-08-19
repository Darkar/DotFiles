#!/bin/bash

# Require rsync

rsync -v -r --delete-after .config/i3/ ~/.config/i3/ 
rsync -v -r --delete-after .config/polybar/ ~/.config/polybar/ 
rsync -v -r --delete-after .config/compton/ ~/.config/compton/ 
rsync -v -r --delete-after .config/rofi/ ~/.config/rofi/ 
rsync -v -r --delete-after .config/neofetch/ ~/.config/neofetch/ 
rsync -v -r --delete-after .config/dunst/ ~/.config/dunst/ 
rsync -v -r --delete-after .vim/ ~/.vim/ 
rsync -v -r --delete-after .Xdefaults ~/.Xdefaults 
rsync -v -r --delete-after .zshrc ~/.zshrc 
rsync -v -r --delete-after .face ~/.face 
rsync -v -r --delete-after .vimrc ~/.vimrc 
rsync -v -r --delete-after .xinitrc ~/.xinitrc 