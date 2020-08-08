#/bin/zsh
# Open a particular cheatseet

file=$(find ~/Documents/cheatseets -type f | fzf)
if [[ ! -z $file ]]; then
	termination=$(echo $file | rev | cut -d'.' -f1 | rev)
	case $termination in 
		"pdf") 
			zathura $file &> /dev/null &
			;;
		"png") 
			feh $file &> /dev/null &
			;;
		"jpg") 
			feh $file &> /dev/null &
			;;
		*) 
			vim $file
			;;
	esac
fi
