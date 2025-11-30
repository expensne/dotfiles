# Enable prompt substitution
setopt prompt_subst

# Better matching (case-insensitive etc.)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Load completion system
autoload -Uz compinit bashcompinit
compinit
bashcompinit

# Dotfile homes
ZSH_HOME="$HOME/dotfiles/zsh"
IDEAVIM_HOME="$HOME/dotfiles/ideavim"

EDITOR=/opt/homebrew/bin/nvim

# VI Mode
set -o vi
bindkey jj vi-cmd-mode

# Tools
export PATH=/opt/homebrew/bin:$PATH
# - Podman
export PATH="$PATH:/opt/podman/bin"
# - Pipx
export PATH="$PATH:$HOME/.local/bin"

# Oh-My-ZSH like stuff
source "$ZSH_HOME/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_HOME/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Compatibility
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# General
alias ll="ls -hAlt"

# Vim
alias vi="nvim"
alias vim="nvim"

# Tmux
alias tm="tmux"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gre='git reset'

# Docker/Podman
alias docker="podman"
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

eval "$(starship init zsh)"

# function set_win_title(){
#     echo -ne "\033]0; $(basename "$PWD") \007"
# }
# starship_precmd_user_func="set_win_title"

