# Screens
xrandr --output eDP-1 --auto --right-of HDMI-1

# Wallpapers
 #feh --no-fehbg --bg-fill ~/.config/wallpaper/wallpaper1.jpg --bg-fill ~/.config/wallpaper/wallpaper2.jpg 
feh --no-fehbg --bg-center ~/.config/wallpaper/wallpaper1.jpg --bg-center ~/.config/wallpaper/wallpaper2.jpg

# Transparency
xcompmgr -c &

# Profile
/home/sebas_pasker/.profile

# Download filter
/home/sebas_pasker/.config/scripts/download_filter.sh

# Notifications
killall notification-daemon &> /dev/null

# Battery notifications
~/.config/scripts/battery_notification.sh &

datex() {
	echo "$( date "+%m/%d/%y" )"
}

timex() {
	echo "$( date "+%H:%M:%S" )"
}

lightx() {
	echo "$(light | cut -c1-3 )"
}

volx() {
	echo "$(pamixer --get-volume-human)"
}

battx() {
	echo "$(cat /sys/class/power_supply/BAT1/capacity)"
}

memx() {
	echo "$(free -h | sed -n '2p' | cut -d ' ' -f18)"
}

cpux() {
		echo "$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}' \
						| cut -c1-4)"
}

cputime=0
while true; do
	xsetroot -name " $(memx)  $(cpux)%  $(lightx)%  $(volx)  $(battx)%  $(datex) $(timex)"
	sleep 1
done &


