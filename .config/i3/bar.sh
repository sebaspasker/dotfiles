#!/bin/zsh

while :
do
	VOLUME="$(amixer get 'Master' | grep % | cut -d" " -f6 | cut -c2-4)"
	MESSAGE1="/ $(cat /sys/class/power_supply/BAT1/capacity)% | $VOLUME | / $(light) | / $(date)"
  MESSAGE2="CARGAR DISPOSITIVO / $(cat /sys/class/power_supply/BAT1/capacity)% | $VOLUME | / $(light) | / $(date)"
	STATE=$(cat /sys/class/power_supply/BAT1/status )
	CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
	if [[ $STATE == 'Discharging' && (( $CAPACITY < 15 ))]]; then
		echo $MESSAGE2
	else
		echo $MESSAGE1
	fi
	sleep 1
done
