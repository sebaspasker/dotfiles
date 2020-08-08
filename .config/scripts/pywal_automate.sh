#/bin/bash

file_name=$1
wal -i $file_name

# Change wallpapers
cp $file_name ~/.config/wallpaper/wallpaper1.jpg 
cp $file_name ~/.config/wallpaper/wallpaper2.jpg 

# Zathura
~/.config/scripts/change_theme_zathura.sh

# st
cd ~/.config/st && sudo make clean install

# dwm
# Comment SchemeUrg
sed '13,18s/^/\/\//g' ~/.cache/wal/colors-wal-dwm.h > ~/.cache/wal/.colors-dwm.h \
	&& mv ~/.cache/wal/.colors-dwm.h ~/.cache/wal/colors-wal-dwm.h
cd ~/.config/dwm && sudo make clean install

# Add wallpaper to Lightdm
sudo cp ~/.config/wallpaper/wallpaper1.jpg /usr/share/lightdm-webkit/themes/lightdm-webkit-theme-aether/src/img/wallpapers/

