# Created by newuser for 5.8
# Mirar arch wiki zsh
# Para aprender ejecutar zsh-newuser-install

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

stty stop undef		# Disable ctrl-s to freeze terminal.

#History in cach directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

autoload -U compinit promptinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -u
_comp_options+=(globdots)   # Include hidden files.


# This will set the default prompt to the walters theme
promptinit
prompt redhat

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

#change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd  ]] ||
     [[ $1 = 'block'  ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main  ]] ||
       [[ ${KEYMAP} == viins  ]] ||
       [[ ${KEYMAP} = ''  ]] ||
       [[ $1 = 'beam'  ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
      echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Execute ranger with Ctrl+O
bindkey -s '^o' 'ranger\n'

# Ctrl+r implementation
bindkey -v
bindkey '^R' history-incremental-search-backward

# Fzf
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey -s '^g' 'zsh ~/.config/scripts/cheatseet_finder.sh\n'

# Neofetch
# clear
# neofetch --kitty ~/.config/wallpaper/wallpaper1.jpg --size 23% --gap 3

# Autojump configuration
export PROMPT_COMMAND="history -a"
[[ -s /home/sebas_pasker/.autojump/etc/profile.d/autojump.sh  ]] && source /home/sebas_pasker/.autojump/etc/profile.d/autojump.sh
export HISTCONTROL=ignoredups
alias l.='ls -d .* --color=auto'dev/null

source /home/sebas_pasker/.config/zsh/alias.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null

# Start Docker daemon automatically when logging in if not running.
RUNNING=`ps aux | grep dockerd | grep -v grep`
if [ -z "$RUNNING" ]; then
    sudo dockerd > /dev/null 2>&1 &
    disown
fi
