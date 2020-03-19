# Set ZSH_CACHE_DIR to the path where cache files should be created
# or else we will use the default cache/
if [[ -z "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$ZSH/cache"
fi

# Migrate .zsh-update file to $ZSH_CACHE_DIR
if [ -f ~/.zsh-update ] && [ ! -f ${ZSH_CACHE_DIR}/.zsh-update ]; then
    mv ~/.zsh-update ${ZSH_CACHE_DIR}/.zsh-update
fi

# Check for updates on initial load...
if [ "$DISABLE_AUTO_UPDATE" != "true" ]; then
  env ZSH=$ZSH ZSH_CACHE_DIR=$ZSH_CACHE_DIR DISABLE_UPDATE_PROMPT=$DISABLE_UPDATE_PROMPT zsh -f $ZSH/tools/check_for_upgrade.sh
fi

# Initializes Oh My Zsh

# add a function path
fpath=($ZSH/functions $ZSH/completions $fpath)

# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit



# Set ZSH_CUSTOM to the path where your custom config files
# and plugins exists, or else we will use the default custom/
if [[ -z "$ZSH_CUSTOM" ]]; then
    ZSH_CUSTOM="$ZSH/custom"
fi


is_plugin() {
  local base_dir=$1
  local name=$2
  builtin test -f $base_dir/plugins/$name/$name.plugin.zsh \
    || builtin test -f $base_dir/plugins/$name/_$name
}

# Add all defined plugins to fpath. This must be done
# before running compinit.
for plugin ($plugins); do
  if is_plugin $ZSH_CUSTOM $plugin; then
    fpath=($ZSH_CUSTOM/plugins/$plugin $fpath)
  elif is_plugin $ZSH $plugin; then
    fpath=($ZSH/plugins/$plugin $fpath)
  else
    echo "[oh-my-zsh] plugin '$plugin' not found"
  fi
done

# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
  # macOS's $HOST changes with dhcp, etc. Use ComputerName if possible.
  SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST=${HOST/.*/}
else
  SHORT_HOST=${HOST/.*/}
fi

# Save the location of the current completion dump file.
if [ -z "$ZSH_COMPDUMP" ]; then
  ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fi

if [[ $ZSH_DISABLE_COMPFIX != true ]]; then
  source $ZSH/lib/compfix.zsh
  # If completion insecurities exist, warn the user
  handle_completion_insecurities
  # Load only from secure directories
  compinit -i -C -d "${ZSH_COMPDUMP}"
else
  # If the user wants it, load from all found directories
  compinit -u -C -d "${ZSH_COMPDUMP}"
fi


# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore
for config_file ($ZSH/lib/*.zsh); do
  custom_config_file="${ZSH_CUSTOM}/lib/${config_file:t}"
  [ -f "${custom_config_file}" ] && config_file=${custom_config_file}
  source $config_file
done

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
  elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done

# Load all of your custom configurations from custom/
for config_file ($ZSH_CUSTOM/*.zsh(N)); do
  source $config_file
done
unset config_file

# Load the theme
if [[ "$ZSH_THEME" == "random" ]]; then
  if [[ "${(t)ZSH_THEME_RANDOM_CANDIDATES}" = "array" ]] && [[ "${#ZSH_THEME_RANDOM_CANDIDATES[@]}" -gt 0 ]]; then
    themes=($ZSH/themes/${^ZSH_THEME_RANDOM_CANDIDATES}.zsh-theme)
  else
    themes=($ZSH/themes/*zsh-theme)
  fi
  N=${#themes[@]}
  ((N=(RANDOM%N)+1))
  RANDOM_THEME=${themes[$N]}
  source "$RANDOM_THEME"
  echo "[oh-my-zsh] Random theme '$RANDOM_THEME' loaded..."
else
  if [ ! "$ZSH_THEME" = ""  ]; then
    if [ -f "$ZSH_CUSTOM/$ZSH_THEME.zsh-theme" ]; then
      source "$ZSH_CUSTOM/$ZSH_THEME.zsh-theme"
    elif [ -f "$ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme" ]; then
      source "$ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme"
    else
      source "$ZSH/themes/$ZSH_THEME.zsh-theme"
    fi
  fi
fi


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

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

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp"  ]; then
	    dir="$(cat "$tmp")"
      rm -f "$tmp"
      [ -d "$dir"  ] && [ "$dir" != "$(pwd)"  ] && cd "$dir"
    fi
}
bindkey -s '^o' 'ranger\n'

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc"  ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc"  ] && source "$HOME/.config/aliasrc"

# Ctrl+r implementation
bindkey -v
bindkey '^R' history-incremental-search-backward

 #Import colorscheme from 'wal' asynchronously
 # &   # Run the process in the background.
 # ( ) # Hide shell job control messages.
 (cat ~/.cache/wal/sequences &)

 # Alternative (blocks terminal for 0-3ms)
 cat ~/.cache/wal/sequences

 # To add support for TTYs this line can be optionally added.
 source ~/.cache/wal/colors-tty.sh

# Enable color and change prompt
#autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
			
#wal -R -n
#clear
neofetch

export PROMPT_COMMAND="history -a"
[[ -s /home/sebastianpasker/.autojump/etc/profile.d/autojump.sh  ]] && source /home/sebastianpasker/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
export HISTCONTROL=ignoredups
alias l.='ls -d .* --color=auto'
