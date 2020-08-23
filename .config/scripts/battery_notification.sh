#/bin/zsh

EMERGENCY_STATE=0
while true; do
	BATT="$(cat /sys/class/power_supply/BAT1/capacity)"
	STATE="$(cat /sys/class/power_supply/BAT1/status)"
	if [[ "$STATE" == "Discharging" ]]; then
		if (( $BATT < 2 )); then
			(( $EMERGENCY_STATE != 4 )) && EMERGENCY_STATE=4 && \
				systemctl suspend
		elif (( $BATT < 5 )); then
			(( $EMERGENCY_STATE != 3 )) && EMERGENCY_STATE=3 && \
				notify-send "Battery under 5%" -u critical
		elif (( $BATT < 10 )); then
			(( $EMERGENCY_STATE != 2 )) && EMERGENCY_STATE=2 && \
				notify-send "Battery under 10%" -u low
		elif (( $BATT < 15 )); then
			(( $EMERGENCY_STATE != 1 )) && EMERGENCY_STATE=1 && \
				notify-send "Battery under 15%" -u low
		fi
	else 
		(( $EMERGENCY_STATE != 0 )) && EMERGENCY_STATE=0
	fi
	sleep 1
done
