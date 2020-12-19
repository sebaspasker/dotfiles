
abbr -U -a la ls -al
abbr -U -a l ls -al

# cd
abbr -U -a .. cd  ..
abbr -U -a ... cd  ../..
abbr -U -a . cd ../../..
abbr -U -a .4 cd ../../../..
abbr -U -a .5 cd ../../../../..

# pacman
abbr -U -a pacsyu sudo pacman -Syu              					# update only std pkg
abbr -U -a yaysua yay -Sua --no-confirm    					# update only AUR pkg
abbr -U -a yaysyu yay -Syu --no-confirm    					# update std and AUR pkg
abbr -U -a unlock sudo rm /var/lib/pacman/db.lck
abbr -U -a seeuseless pacman -Qtdq 
abbr -U -a seevuln arch-audit

# Directories
abbr -U -a cdconf cd ~/.config
abbr -U -a cdd cd ~/Downloads
abbr -U -a cddow cd ~/Downloads
abbr -U -a cdD cd ~/Documents
abbr -U -a cdH cd ~/
abbr -U -a cddwm cd ~/.config/dwm
abbr -U -a cdst cd ~/.config/st
abbr -U -a cddmenu cd ~/.config/dmenu-5.0
abbr -U -a cdfish cd ~/.config/fish
abbr -U -a cdrg cd ~/.config/ranger
abbr -U -a cdvim cd ~/.vim
abbr -U -a cddot cd ~/Documents/dotfiles
abbr -U -a cdmy cd ~/Documents/myProjects
abbr -U -a cdscripts cd ~/.config/scripts
abbr -U -a cdw cd ~/Wallpapers
abbr -U -a cdI cd ~/Images
abbr -U -a cdi cd ~/Images
abbr -U -a cdW cd ~/Wallpapers
abbr -U -a cdS cd ~/.config/scripts
abbr -U -a cds cd ~/Images/Screenshots

# Temporary directories
abbr -U -a cdua cd ~/Documents/UA
abbr -U -a cddbd cd ~/Documents/UA/2º/DBD/
abbr -U -a cdest cd ~/Documents/UA/2º/Estadística
abbr -U -a cdred cd ~/Documents/UA/2º/Redes
abbr -U -a cdffi cd ~/Documents/UA/1º/FFI

# grep
abbr -U -a grep grep --color=auto
abbr -U -a egrep egrep --color=auto
abbr -U -a fgrep fgrep --color=auto

# Link
abbr -U -a lns ln -s

# Other
abbr -U -a pl pdflatex
abbr -U -a dotUpdate ~/.config/scripts/actualizar_dot.sh
# alias compiledwm='old_path=$PWD && cd ~/.config/dwm/ && \
# 									cp config.def.h config.h && sudo make clean install && cd $old_path'
# alias compilest='old_path=$PWD && cd ~/.config/st/ && \
# 									cp config.def.h config.h && sudo make clean install && cd $old_path'
alias mkd='mkdir'

# Config files
abbr -U -a xvim vim ~/.vim/vimrc
abbr -U -a xzsh vim ~/.config/zsh/.zshrc
abbr -U -a X vim ~/.config/ranger/rc.conf
abbr -U -a xaliasf vim ~/.config/fish/alias.fish
abbr -U -a xaliassh vim ~/.config/alias/alias.sh
abbr -U -a xdwm vim ~/.config/dwm/config.def.h
abbr -U -a xst vim ~/.config/st/config.def.h
abbr -U -a xauto vim ~/.config/dwm/autostart.sh
abbr -U -a xzth vim ~/.config/zathura/zathurarc
abbr -U -a xmutt vim ~/.config/mutt/muttrc
abbr -U -a xprofile vim ~/.profile
abbr -U -a xdunst vim ~/.config/dunst/dunstrc
abbr -U -a xfish vim ~/.config/fish/config.fish
abbr -U -a xkeyfish vim ~/.config/fish/keybind.fish
abbr -U -a xdmenu vim ~/.config/dmenu-5.0/config.def.h

# Github
abbr -U -a gtst git status
abbr -U -a gtch git checkout
abbr -U -a gtbr git branch
abbr -U -a gta git add
abbr -U -a gtcm git commit
abbr -U -a gtcl git clone
abbr -U -a gtpsh git push
abbr -U -a gtpll git pull
abbr -U -a gtlsf git ls-files
abbr -U -a gtlsr git ls-remote
abbr -U -a gtlst git ls-tree
abbr -U -a gtmg git merge

# cp
abbr -U -a cp cp -i # Confirm before deleting
abbr -U -a rm rm -i # Confirm before deletin

# get error messages from journalctl
abbr -U -a jctl journalctl -p 3 -xb

# gpg encryption
# verify signature for isos
abbr -U -a gpg-check gpg2 --keyserver-options auto-key-retrieve --verify
# receive the key of a developer
abbr -U -a gpg-retrieve gpg2 --keyserver-options auto-key-retrieve --receive-keys

# Switch between shells
abbr -U -a tobash sudo chsh $USER -s /bin/bash
abbr -U -a tozsh sudo chsh $USER -s /bin/zsh
abbr -U -a tofish sudo chsh $USER -s /bin/fish

# Screens
# alias individual_screen="bash ~/.screenlayout/individual.sh && \
# 														feh --no-fehbg \
# 														--bg-center ~/.config/wallpaper/wallpaper1.jpg \
# 														--bg-center ~/.config/wallpaper/wallpaper2.jpg"
# alias double_screen="bash ~/.screenlayout/double.sh && \
# 											feh --no-fehbg \
# 											--bg-center ~/.config/wallpaper/wallpaper1.jpg \
# 											--bg-center ~/.config/wallpaper/wallpaper2.jpg"

# Memory view 
abbr -U -a memory duf

# Zathura abbreviation
abbr -U -a zth zathura

# Open pages
# abbr -U -a duckduckgo brave https://duckduckgo.com &> /dev/null & 
# abbr -U -a incognito brave --incognito &> /dev/null &
# abbr -U -a ua brave https://autentica.cpd.ua.es/cas/login &> /dev/null &
# abbr -U -a github brave https://github.com &> /dev/null &
# abbr -U -a whatsapp brave https://web.whatsapp.com/ &> /dev/null &
# abbr -U -a wikipedia brave https://wikipedia.com &> /dev/null &
# abbr -U -a drive brave https://drive.google.com/ &> /dev/null &
# abbr -U -a trello brave https://trello.com &> /dev/null &
# abbr -U -a evernote brave https://www.evernote.com/Login.action &> /dev/null &

# Record voice
abbr -U -a record_mic arecord -V stereo -t wav -f dat

