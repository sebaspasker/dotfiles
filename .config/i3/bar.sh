#!/bin/zsh

PRINTWARN=0
PRINTERR=0
FATALBATT=0

nagbar()
{
	i3-msg fullscreen disable;
	i3-nagbar \
		--type $1 \
		--message "WARNING: low battery"&
}

while :
do
	VOLUME="$(amixer get 'Master' | grep % | cut -d" " -f6 )"
	LIGHT="$(light | cut -c1-3)"
	BATTERY="$(cat /sys/class/power_supply/BAT1/capacity)"
	MESSAGE1="[$BATTERY%] |  $VOLUME | [$LIGHT%] |  / $(date)"
  MESSAGE2="CARGAR DISPOSITIVO [$BATTERY%] |  $VOLUME | [$LIGHT%] |  / $(date)"
	STATE=$(cat /sys/class/power_supply/BAT1/status )
	if [[ "$STATE" == "Discharging" ]] && (( $BATTERY < 15 )); then
		echo $MESSAGE2
		(( $PRINTWARN == 0 )) && (( $BATTERY == 10 )) && PRINTWARN=1 && nagbar "warning"
		(( $PRINTERR == 0 )) && (( $BATTERY == 5 )) && PRINTERR=1 && nagbar "error"
		(( $FATALBATT == 0 )) && (( $BATTERY == 2 )) && FATALBATT=1 && systemctl suspend;
	else
		echo $MESSAGE1
		(( $PRINTWARN == 1 )) && PRINTWARN=0
		(( $PRINTERR == 1 )) && PRINTERR=0
		(( $FATALBATT == 1 )) && FATALBATT=0
	fi
	sleep 1
done
