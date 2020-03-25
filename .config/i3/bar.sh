#!/bin/zsh

while :
do
	VOLUME="$(amixer get 'Master' | grep % | cut -d" " -f6 | cut -c2-3)"
	LIGHT="$(light | cut -c1-2)"
	BATTERY="$(cat /sys/class/power_supply/BAT1/capacity)"
	MESSAGE1="/ $BATTERY % | / $VOLUME % | / $LIGHT % | / $(date)"
  MESSAGE2="CARGAR DISPOSITIVO / $BATTERY % | / $VOLUME % | / $LIGHT % | / $(date)"
	STATE=$(cat /sys/class/power_supply/BAT1/status )
	CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
	if [[ $STATE == 'Discharging' && $(( $CAPACITY <= 15 )) ]]; then
		echo $MESSAGE2
	else
		echo $MESSAGE1
	fi
	sleep 1
done
