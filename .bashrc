if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

HITSIZE=-1
HITFILESIZE=-1

# Additional Path directories

PATH=$PATH:/home/max/go/bin:/home/max/.local/bin:/home/max/.local/scripts

. "$HOME/.cargo/env"

[ -f "/home/max/.ghcup/env" ] && . "/home/max/.ghcup/env" # ghcup-env

# Prompt configuration

GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"

PS1="${GREEN}\w ${RESET}> "
# Aliases

# alias dnf='dnf5'

alias vi='vim'
alias vim='nvim'

# alias cat='bat'
alias ls='eza'
alias l="ls"
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias tree='eza --tree --group-directories-first'

alias gts='git status --short --untracked-files'
alias gta='git add'
alias gtc='git commit'
alias gtl='git log'
alias gtd='git diff'

alias txls="tmux list-sessions"
alias txks="tmux kill-session"

txns() {
    if [ $# -eq 0 ]; then
        echo "USAGE: txns {session_name}"
        return 1
    fi

    subcommand="tmux new -dP -t $1"
    echo "$subcommand"

    cmd="tmux switchc -t `$subcommand`"
    $cmd
}

txcs() {
    if [ $# -eq 0 ]; then
        echo "USAGE: txns {session_name}"
        return 1
    fi

    tmux switchc -t "$1"
}

alias txlw="tmux list-windows"
alias txkw="tmux kill-window"

