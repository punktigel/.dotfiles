# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree="$HOME"'
alias dfs="dotfiles status"
alias dfd="dotfiles diff"
alias dflog="dotfiles log --pretty=format:'%C(bold red)%h%Creset %C(bold green)[%cr]%Creset - %C(bold)%s %C(bold blue)<%an>%Creset'"

# git
alias gshow="git config --global --list"
alias gs="git status"
alias glog="git log --pretty=format:'%C(bold red)%h%Creset %C(bold green)[%cr]%Creset - %C(bold)%s %C(bold blue)<%an>%Creset'"

# eza for ls
alias ls="eza --group-directories-first"
alias ll="eza -1 -la --group-directories-first"
alias tree="eza -T --group-directories-first"

alias latex="compile_latex"
alias cmd="command_history"

command_history() {
    input=$(history | fzf)
    cmd_info=$(echo "CMD: $input" | sed -E 's/^[[:space:]]*[0-9]+[[:space:]]*//' | sed -E 's/[[:space:]]+/ /g')
    echo "$cmd_info" &&
    sleep 1 &&
    read _ &&
    eval "$(echo "$input" | sed -E 's/^[[:space:]]*[0-9]+[[:space:]]*//')"
}

compile_latex() {
    filename=$(echo "$1" | cut -f1 -d '.')
    echo "$filename"

    pdflatex "$filename.tex"
    pdflatex "$filename.tex"

    rm "$filename.aux"
    rm "$filename.log"

    xdg-open "$filename.pdf"
}

# special
alias G="gcm ~/.GCM_config"
alias gcommit="git_auto"

git_auto() {
    gcm ~/.GCM_config --auto --output &&
    sleep 1 &&
    read _ &&
    git commit
}
