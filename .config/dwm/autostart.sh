# Screens
xrandr --output eDP1 --auto --left-of HDMI1

# Wallpapers
feh --no-fehbg --bg-fill ~/.config/wallpaper/wallpaper1.jpg --bg-fill ~/.config/wallpaper/wallpaper2.jpg 
#feh --no-fehbg --bg-center ~/.config/wallpaper/wallpaper1.jpg --bg-center ~/.config/wallpaper/wallpaper2.jpg

# Transparency
xcompmgr -c -C &

# Profile
/home/sebas_pasker/.profile

# Download filter
/home/sebas_pasker/.config/scripts/download_filter.sh &> /dev/null 

# Kill Notifications
killall notification-daemon &> /dev/null

# Kill Clocks
killall clock.sh &> /dev/null

# Kill battery_notifications
killall battery_notifications.sh &> /dev/null

# Battery notifications
~/.config/scripts/battery_notification.sh &

# Welcome notification and boot process
~/.config/scripts/welcome_start.sh &> /dev/null &

# Clock 
~/.config/scripts/clock.sh &> /dev/null &

# Albert (Aplication like Alfons for linux)
# Shift|Alt|SuperKey(\)
albert &> /dev/null &
