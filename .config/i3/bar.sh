#!/bin/zsh

MESSAGE=1

while :
do
	if [[ (($(cat /sys/class/power_supply/BAT1/status ) != "Full") && ($(cat /sys/class/power_supply/BAT1/status) != "Charging")) && ($MESSAGE == 1) && (( $(cat /sys/class/power_supply/BAT1/capacity) < 15)) ]]
	then
		echo "CARGAR DISPOSITIVO / $(cat /sys/class/power_supply/BAT1/capacity)% | / $(date)"
	else 
		echo "/ $(cat /sys/class/power_supply/BAT1/capacity)% | / $(date)"
	fi
	sleep 1
done
