#!/usr/bin/env zsh

# Application
neofetch

# Alias général
alias ls='ls --color=auto'
alias ll='ls -ll'
alias clear='clear && neofetch'
alias magnan-server='ssh jeremy@magnan.one -p 2244'

# Export
#export PATH=/opt/anaconda3/bin:$PATH.
export EDITOR=/usr/bin/vim

# Correction des commandes
setopt correctall
setopt completealiases 
setopt auto_cd
setopt correct                 
setopt list_ambiguous 

# Complétion
autoload -U compinit
compinit

# ZSH Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Historique
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
export HISTFILE SAVEHIST

# Prompt
autoload colors; colors
export PS1="%B%{$fg[blue]%}%n%{$reset_color%}%b@%B%{$fg[red]%}%m%b%{$reset_color%} %B%{$fg[yellow]%}%T%{$reset_color%} %B%{$fg[green]%}$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') fichiers%{$reset_color%} %B%{$fg[cyan]%}[%~%B]%b 
>"
