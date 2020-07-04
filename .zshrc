#!/usr/bin/env zsh

#Application
neofetch

#Alias général
alias ls='ls --color=auto'
alias ll='ls -ll'
#alias clear='clear && neofetch'
alias magnan-server='ssh jeremy@magnan.one -p 2244'


#Export
export EDITOR=/usr/bin/vim

#Correction des commandes
setopt correctall
setopt completealiases 
setopt auto_cd
setopt correct                 
setopt list_ambiguous 

#Complétion
autoload -U compinit
compinit

#Historique
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
export HISTFILE SAVEHIST

#Git Config
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

#Zsh Plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Prompt
autoload colors; colors
export PS1="%B%{$fg[blue]%}%n%{$reset_color%}%b@%B%{$fg[red]%}%m%b%{$reset_color%} %B%{$fg[yellow]%}%T%{$reset_color%} %B%{$fg[green]%}$(/bin/ls | /usr/bin/wc -l) fichiers%{$reset_color%} %B%{$fg[cyan]%}[%~%B]%b 
>"

