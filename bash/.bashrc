if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

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
PATH=$PATH:"$HOME.local/scripts"
PATH=$PATH:"$HOME/.local/bin"
PATH=$PATH:"$HOME/go/bin"

. "$HOME/.cargo/env"

export PATH

# Aliases
alias vi='vim'
alias vim='nvim'

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

parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'; }

hostname_if_ssh(){
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "[$(hostname)] "
  fi
}

export PS1='$(hostname_if_ssh)\w $(parse_git_branch)🐼 '

