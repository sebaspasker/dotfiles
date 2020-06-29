# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sebastianpasker/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="strug"
#ZSH_THEME="darkblood"

#History in cach directory:
HISTSIZE=10000
SAVEHIST=10000

source ~/.oh-my-zsh/oh-my-zsh.sh

# Load all stock functions (from $fpath files) called below.
autoload -Uz compaudit compinit
compinit
# Completion fot kitty
kitty + complete setup zsh | source /dev/stdin

# source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null

# Alias
source ~/.config/zsh/zshalias.sh

plugin=(git)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # Include hidden files.

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

# Execute navi with Ctrl+Q
bindkey -s '^q' 'navi\n'

# Ctrl+r implementation
bindkey -v
bindkey '^R' history-incremental-search-backward

# Neofetch
# clear
# neofetch --kitty ~/.config/wallpaper/wallpaper1.jpg --size 23% --gap 3

# Autojump configuration
export PROMPT_COMMAND="history -a"
[[ -s /home/sebastianpasker/.autojump/etc/profile.d/autojump.sh  ]] && source /home/sebastianpasker/.autojump/etc/profile.d/autojump.sh
export HISTCONTROL=ignoredups
alias l.='ls -d .* --color=auto'

