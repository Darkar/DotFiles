#!/bin/bash

# Require rsync

rsync -v -r --delete-after ~/.config/i3/ .config/i3/
rsync -v -r --delete-after ~/.config/polybar/ .config/polybar/
rsync -v -r --delete-after ~/.config/compton/ .config/compton/
rsync -v -r --delete-after ~/.Xdefaults .
rsync -v -r --delete-after ~/.zshrc .
rsync -v -r --delete-after ~/.face .