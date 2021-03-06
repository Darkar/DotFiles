#!/bin/bash

# Require rsync

rsync -v -r --delete-after ~/.conky/ .conky/ --exclude 'config.rb'
rsync -v -r --delete-after ~/.config/i3/ .config/i3/
rsync -v -r --delete-after ~/.config/polybar/ .config/polybar/ --exclude 'config.rb'
rsync -v -r --delete-after ~/.config/compton/ .config/compton/
rsync -v -r --delete-after ~/.config/autorandr/ .config/autorandr/
rsync -v -r --delete-after ~/.config/rofi/ .config/rofi/
rsync -v -r --delete-after ~/.config/neofetch/ .config/neofetch/
rsync -v -r --delete-after ~/.config/dunst/ .config/dunst/
rsync -v -r --delete-after ~/.config/alacritty/ .config/alacritty/
rsync -v -r --delete-after ~/.vim/ .vim/
rsync -v -r --delete-after ~/.Xdefaults .
rsync -v -r --delete-after ~/.zshrc .
rsync -v -r --delete-after ~/.face .
rsync -v -r --delete-after ~/.vimrc .
rsync -v -r --delete-after ~/.xinitrc .