#!/usr/bin/env zsh

# Alias général
alias ls='ls --color=auto'
alias ll='ls -ll'
alias vim='nvim'

# Autoload
autoload -U compinit; compinit
autoload colors; colors
autoload -Uz vcs_info

# Options
setopt correctall
setopt completealiases 
setopt auto_cd
setopt correct                 
setopt list_ambiguous 
setopt prompt_subst

# Application
export PF_INFO="ascii os host kernel uptime pkgs shell memory"
pfetch

#Historique
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

#Git Config
precmd() { vcs_info }
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '[%b%u%c]'
zstyle ':vcs_info:git:*' actionformats '[%b|%a%u%c]'

#Zsh Plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#757171'

# Export
export EDITOR=/usr/bin/nvim
export HISTFILE SAVEHIST

#Prompt
eval "$(starship init zsh)"
#RPROMPT=\$vcs_info_msg_0_
#export PS1="%{$fg_bold[blue]%}%3~ ${gitBranch}${sshConn}%{$reset_color%}%}> "
