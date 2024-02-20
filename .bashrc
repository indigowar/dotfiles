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

PATH=$PATH:/home/max/go/bin

alias dnf='dnf5'

alias vi='vim'
alias vim='nvim'

alias cat='bat'
alias ls='eza'
alias l="ls"
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias tree='eza --tree --group-directories-first'

alias gts='git status --short'
alias gta='git add'
alias gtc='git commit'
alias gtl='git log'
. "$HOME/.cargo/env"

[ -f "/home/max/.ghcup/env" ] && source "/home/max/.ghcup/env" # ghcup-env
