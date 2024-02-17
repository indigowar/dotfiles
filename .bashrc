# .bashrc
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

alias vi="vim"
alias vim="nvim"

alias gts="git status --short"
alias gta="git add"
alias gtc="git commit"
alias gtl="git log"
