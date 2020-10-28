#!/bin/zsh

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


alias la='ls -al'
alias l='ls -al'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# pacman
alias pacsyu='sudo pacman -Syu'              					# update only std pkgs
alias yaysua='yay -Sua --no-confirm'    					# update only AUR pkgs
alias yaysyu='yay -Syu --no-confirm'    					# update std and AUR pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'  # Not recommended
alias seeuseless='pacman -Qtdq && yay -Qtdq'

# Directories
alias cdconf='cd ~/.config'
alias cdd='cd ~/Downloads'
alias cddow='cd ~/Downloads'
alias cdD='cd ~/Documents'
alias cdH='cd ~/'
alias cddwm='cd ~/.config/dwm'
alias cdst='cd ~/.config/st'
alias cdrg='cd ~/.config/ranger'
alias cdvim='cd ~/.vim'
alias cddot='cd ~/Documents/dotfiles'
alias cdmy='cd ~/Documents/myProjects'
alias cdscripts='cd ~/.config/scripts'
alias cdw='cd ~/Wallpapers'
alias cdI='cd ~/Images'
alias cdi='cd ~/Images'
alias cdW='cd ~/Wallpapers'
alias cdS='cd ~/.config/scripts'
alias cds='cd ~/Images/Screenshots'

# Temporary directories
alias cdua="cd ~/Documents/UA"
alias cddbd="cd ~/Documents/UA/2º/DBD/"
alias cdest="cd ~/Documents/UA/2º/Estadística"
alias cdred="cd ~/Documents/UA/2º/Redes"
alias cdffi="cd ~/Documents/UA/1º/FFI"

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Link
alias lns='ln -s'

# Other
alias pl='pdflatex'
alias dotUpdate='~/.config/scripts/actualizar_dot.sh'
alias compiledwm='old_path=$PWD && cd ~/.config/dwm/ && \
									cp config.def.h config.h && sudo make clean install && cd $old_path'
alias compilest='old_path=$PWD && cd ~/.config/st/ && \
									cp config.def.h config.h && sudo make clean install && cd $old_path'
alias mkd='mkdir'

# Config files
alias xvim='vim ~/.vim/vimrc'
alias xzsh='vim ~/.config/zsh/.zshrc'
alias X='vim ~/.config/ranger/rc.conf'
alias xalias='vim ~/.config/zsh/alias.zsh'
alias xdwm='vim ~/.config/dwm/config.def.h'
alias xst='vim ~/.config/st/config.def.h'
alias xauto='vim ~/.config/dwm/autostart.sh'
alias xzth='vim ~/.config/zathura/zathurarc'
alias xmutt='vim ~/.config/mutt/muttrc'
alias xprofile='vim ~/.profile'
alias xdunst='vim ~/.config/dunst/dunstrc'

# Github
alias gtst='git status'
alias gtch='git checkout'
alias gtbr='git branch'
alias gta='git add'
alias gtcm='git commit'
alias gtcl='git clone'
alias gtpsh='git push'
alias gtpll='git pull'
alias gtlsf='git ls-files'
alias gtlsr='git ls-remote'
alias gtlst='git ls-tree'
alias gtmg='git merge'

# cp
alias cp='cp -i' # Confirm before deleting 
alias rm='rm -i' # Confirm before deleting

# get error messages from journalctl
alias jctl='journalctl -p 3 -xb'

# gpg encryption
# verify signature for isos
alias gpg-check='gpg2 --keyserver-options auto-key-retrieve --verify'
# receive the key of a developer
alias gpg-retrieve='gpg2 --keyserver-options auto-key-retrieve --receive-keys'

# Switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

# Screens
alias individual_screen="bash ~/.screenlayout/individual.sh"
alias double_screen="bash ~/.screenlayout/double.sh && \
											feh --no-fehbg \
											--bg-center ~/.config/wallpaper/wallpaper1.jpg \
											--bg-center ~/.config/wallpaper/wallpaper2.jpg"
# Memory view 
alias memory='duf'

# Zathura abbreviation
alias zth="zathura"

# Open pages
alias duckduckgo="brave https://duckduckgo.com &> /dev/null &"
alias incognito="brave --incognito &> /dev/null &"
alias ua="brave https://autentica.cpd.ua.es/cas/login &> /dev/null &"
alias github="brave https://github.com &> /dev/null &"
alias whatsapp="brave https://web.whatsapp.com/ &> /dev/null &"
alias wikipedia="brave https://wikipedia.com &> /dev/null &"
alias drive="brave https://drive.google.com/ &> /dev/null &"
alias trello="brave https://trello.com &> /dev/null &"
alias evernote="brave https://www.evernote.com/Login.action &> /dev/null &"

# Record voice
alias record_mic="arecord -V stereo -t wav -f dat"
