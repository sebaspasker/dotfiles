#/bin/zsh
# Autohibernate function after X time

HIBERNATE_EACH_MIN=10
# HIBERNATE_EACH_SEC=0
INITIAL_MIN=$(date +%M)
# INITIAL_SEC=$(date +%S)
HIBERNATE_IN_MIN=$(( ( $INITIAL_MIN + $HIBERNATE_EACH_MIN ) % 60 ))
# HIBERNATE_IN_SEC=$(( ( $INITIAL_SEC + $HIBERNATE_EACH_SEC ) % 60 ))

while true; do
	ACTUAL_MIN=$(date +%M)
	# ACTUAL_SEC=$(date +%S)

	if (( $HIBERNATE_IN_MIN == $ACTUAL_MIN )); then
		INITIAL_MIN=$(date +%M)
		HIBERNATE_IN_MIN=$(( ( $INITIAL_MIN + $HIBERNATE_EACH_MIN ) % 60 ))
		systemctl suspend
	fi

	sleep 20
done
