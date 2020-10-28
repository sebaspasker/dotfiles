#!/bin/zsh

SYSTEMD_AN="$(systemd-analyze)"
START_TIME="$(echo $SYSTEMD_AN | head -n 1 | rev | cut -d' ' -f 2 | rev)"
GRAPHIC_TIME="$(echo $SYSTEMD_AN | tail -n 1 | rev | cut -d' ' -f 3 | rev)"

notify-send -u low -t 5000 "Welcome back $USER

Boot process duration:
Startup process: $START_TIME
Graphical target reached in userspace: $GRAPHIC_TIME" 

systemd-analyze plot > ~/.config/boot_time.svg &
