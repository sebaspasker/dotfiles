#/bin/bash

file_name=$1
wal -i $file_name

# Change wallpapers
cp -f $file_name /home/sebas_pasker/.config/wallpaper/wallpaper1.jpg
cp -f $file_name /home/sebas_pasker/.config/wallpaper/wallpaper2.jpg
convert /home/sebas_pasker/.config/wallpaper/wallpaper1.jpg /home/sebas_pasker/.config/wallpaper/wallpaper1.png
convert /home/sebas_pasker/.config/wallpaper/wallpaper2.jpg /home/sebas_pasker/.config/wallpaper/wallpaper2.png

# Zathura
~/.config/scripts/change_theme_zathura.sh

# Dust
~/.config/scripts/change_theme_dunst.sh

# st
cd ~/.config/st && sudo make clean install

# dwm
# Comment Colors from wal (already in dwm)
sed '13,18s/^/\/\//g' ~/.cache/wal/colors-wal-dwm.h > ~/.cache/wal/.colors-dwm.h \
	&& mv ~/.cache/wal/.colors-dwm.h ~/.cache/wal/colors-wal-dwm.h
cd ~/.config/dwm && sudo make clean install

# Add wallpaper to Lightdm
sudo cp ~/.config/wallpaper/wallpaper1.jpg /usr/share/lightdm-webkit/themes/lightdm-webkit-theme-aether/src/img/wallpapers/

