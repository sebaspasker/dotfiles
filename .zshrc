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

# Some plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Cd
alias cdH="cd  ~/"
alias cdD="cd  ~/Documentos"
alias cdd="cd  ~/Descargas"
alias cdi="cd  ~/Imágenes"
alias cdI="cd  ~/Imágenes"
alias cdmy="cd  ~/Documentos/myProjects"
alias cdua="cd  ~/Documentos/UA"
alias cde="cd  ~/Escritorio"
alias cdoff="cd  ~/Documentos/offensiveTools"
alias cdb="cd  ~/Documentos/Books"
alias cdB="cd  ~/Documentos/Books"
alias cdvim="cd  ~/.vim"
alias cdconf="cd  ~/.config"
alias cdscout="cd  ~/Documentos/scouts"
alias cdw="cd  ~/Wallpapers"

# Temporal cd
alias cdped="cd  ~/Documentos/UA/2º/PED"
alias cdada="cd  ~/Documentos/UA/2º/ADA"
alias cdhada="cd  ~/Documentos/UA/2º/HADA"
alias cdlpp="cd  ~/Documentos/UA/2º/LPP"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
