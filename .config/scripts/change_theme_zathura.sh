#/bin/sh

. $HOME/.cache/wal/colors.sh
back=\"$background\"
fore=\"$foreground\"
awk -v background=$back 'FNR==43{$3=background};1' ~/.config/zathura/zathurarc | \
	awk -v foreground=$fore 'FNR==44{$3=foreground};1' > ~/.config/zathura/.temp && mv ~/.config/zathura/.temp ~/.config/zathura/zathurarc
