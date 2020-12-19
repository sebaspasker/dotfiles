# 
# KEYBINDINGS
# 

# Reverse search

function fish_user_key_bindings
  # Ranger
	bind -M insert \co 'ranger'

  # Turns on Vi key bindings and
	set -M normal -g fish_key_bindings fish_vi_key_bindings

  # Rebinds Control+C to clear the input line.
	bind -M insert \cc kill-whole-line force-repaint

	# Reverse history
	bind -M insert \cr history-token-search-backward

	# Bytop
	bind -M insert \ct 'bpytop'

  # Fzf
	bind -M insert \cf 'cdfzf'

	# Cheatsheet
	bind -M insert \cg 'zsh ~/.config/scripts/cheatseet_finder.sh'

	# Vim command line mode
	bind -M insert \ce edit_command_buffer
end

 funcsave fish_user_key_bindings
