# .bashrc

# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree="$HOME"'

# git
alias gs="git status"
alias glog="git log --pretty=format:'%C(bold red)%h%Creset %C(bold green)[%cr]%Creset - %C(bold)%s %C(bold blue)<%an>%Creset'"

# eza for ls
alias ls="eza --group-directories-first"
alias ll="eza -1 -la --group-directories-first"
alias tree="eza -T --group-directories-first"


parse_git(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


# \W - base working directory
# \$ - $ for user, # for root user
export PS1="\033[01;34m\W \033[37m\$(parse_git)\033[0;35m\$ \033[0m"


# setup zoxide in the shell
eval "$(zoxide init bash)"


# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH



# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
