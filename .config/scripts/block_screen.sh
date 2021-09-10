#!/bin/zsh
num_screens=$( xrandr --current | grep " connected" | wc -l )
if [[ $num_screens == 2 ]]; then
	i3lock -i ~/.config/wallpaper/wallpaper_n.png -p win -t -c "#282A33" -f -p win \
		# && systemctl suspend
else;
	# mantablockscreen -cc \
	i3lock -i ~/.config/wallpaper/wallpaper_1_n.png -p win -t -c "#282A33" -f -p win \
		# && systemctl suspend
fi
