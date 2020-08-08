# Screens
xrandr --output eDP-1 --auto --right-of HDMI-1

# Wallpapers
feh --bg-fill ~/.config/wallpaper/wallpaper1.jpg --bg-fill ~/.config/wallpaper/wallpaper2.jpg 
# feh --bg-center ~/.config/wallpaper/wallpaper1.jpg --bg-center ~/.config/wallpaper/wallpaper2.jpg

# Transparency
xcompmgr -c &

# Profile
/home/sebas_pasker/.profile

# Download filter
/home/sebas_pasker/.config/scripts/filter.sh

# Notifications
killall notification-daemon &> /dev/null

# Battery notifications
~/.config/scripts/battery_notifications.sh &

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
	echo "$(pamixer --get-volume)"
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

while true; do
	xsetroot -name "MEM $(memx) - CPU $(cpux)% - LIGHT $(lightx)% - VOL $(volx)% - BATT $(battx)% - TIME $(datex) $(timex)"
	sleep 1
done &


