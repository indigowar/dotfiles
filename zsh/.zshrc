export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="arrow"

plugins=(git)

source $ZSH/oh-my-zsh.sh

PATH=$PATH:"$HOME.local/scripts"
PATH=$PATH:"$HOME/.local/bin"
PATH=$PATH:"$HOME/go/bin"

. "$HOME/.cargo/env"

# Aliases
alias vi="/usr/bin/vim"
alias vim="nvim"

alias ls="eza"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

alias tree="eza --tree --group-directories-first"

alias gts="git status --short --untracked-files"
alias gta="git add"
alias gtc="git commit"
alias gtl="git log"
alias gtd="git diff"

alias kctl="kubectl"

alias txks="tmux kill-session"
alias txkw="tmux kill-window"
