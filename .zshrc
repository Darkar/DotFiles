#!/usr/bin/env zsh

#Application
neofetch

#Alias général
alias ls='ls --color=auto'
alias ll='ls -ll'
alias clear='clear && neofetch'
alias wolw='wol D8:CB:8A:9B:0E:47'
alias rpi3='ssh magnan@192.168.1.250'
alias magnan-server='ssh root@magnan.one'

#Export
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

#Historique
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
export HISTFILE SAVEHIST

#Prompt
autoload colors; colors
export PS1="%B%{$fg[blue]%}%n%{$reset_color%}%b@%B%{$fg[red]%}%m%b%{$reset_color%} %B%{$fg[yellow]%}%T%{$reset_color%} %B%{$fg[green]%}$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') fichiers%{$reset_color%} %B%{$fg[cyan]%}[%~%B]%b 
>"
