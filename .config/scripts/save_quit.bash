#!/bin/bash

loop="1"

while [[ $loop = "1" ]]; 
do
	echo "Are you sure you want to exit dwm? (y/n)"

	read value_enter

	if [[ "$value_enter" == "y" || "$value_enter" == "n" ]]; then
		loop="0"
	fi
done

[[ $value_enter == "y" ]] && killall dwm
