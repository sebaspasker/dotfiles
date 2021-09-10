#!/bin/zsh

datex() {
	echo "$( date "+%d/%m/%y"  )"
}

timex() {
	echo "$( date "+%H:%M:%S"  )"
}

lightx() {
		echo "$(light | cut -c1-3 )"
}

volx() {
	echo "$(pamixer --get-volume-human)"
}

battx() {
	STATE=$(cat /sys/class/power_supply/BAT1/status)
	[[ $STATE == "Charging" ]] && echo -n "+"
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

