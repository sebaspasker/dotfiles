#/bin/sh

. $HOME/.cache/wal/colors.sh
back=\"$background\"
fore=\"$foreground\"
awk -v background=$back 'FNR==295{$3=background};1' ~/.config/dunst/dunstrc | \
	awk -v foreground=$fore 'FNR==296{$3=foreground};1' | \
	sed -e '295,296s/^/    /g' > ~/.config/dunst/.temp && \
	mv ~/.config/dunst/.temp ~/.config/dunst/dunstrc
awk -v background=$back 'FNR==302{$3=background};1' ~/.config/dunst/dunstrc | \
	awk -v foreground=$fore 'FNR==303{$3=foreground};1' | \
	sed -e '302,303s/^/    /g' > ~/.config/dunst/.temp && \
	mv ~/.config/dunst/.temp ~/.config/dunst/dunstrc

