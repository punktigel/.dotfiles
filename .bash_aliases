# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree="$HOME"'
alias dfs="dotfiles status"
alias dflog="dotfiles log --pretty=format:'%C(bold red)%h%Creset %C(bold green)[%cr]%Creset - %C(bold)%s %C(bold blue)<%an>%Creset'"

# git
alias gs="git status"
alias glog="git log --pretty=format:'%C(bold red)%h%Creset %C(bold green)[%cr]%Creset - %C(bold)%s %C(bold blue)<%an>%Creset'"

# eza for ls
alias ls="eza --group-directories-first"
alias ll="eza -1 -la --group-directories-first"
alias tree="eza -T --group-directories-first"

