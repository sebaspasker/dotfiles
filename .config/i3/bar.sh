#!/bin/zsh

MESSAGE1="/ $(cat /sys/class/power_supply/BAT1/capacity)% | / $(date)"
MESSAGE2="CARGAR DISPOSITIVO / $(cat /sys/class/power_supply/BAT1/capacity)% | / $(date)"

while :
do
	MESSAGE1="/ $(cat /sys/class/power_supply/BAT1/capacity)% | / $(date)"
  MESSAGE2="CARGAR DISPOSITIVO / $(cat /sys/class/power_supply/BAT1/capacity)% | / $(date)"
	STATE=$(cat /sys/class/power_supply/BAT1/status )
	CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
	if [[ $STATE == 'Discharging' && (( $CAPACITY < 15 ))]]; then
		echo $MESSAGE2
	else
		echo $MESSAGE1
	fi
	sleep 1
done
