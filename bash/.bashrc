alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias vi='nvim'
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull --rebase"
alias nf='fzf -m --preview="bat --color=always {}" --bind "enter:become(nvim {+})"'

#find directory using fzf and cd into it
fcd() {
    local dir
    dir=$(find . -type d | fzf)
    if [[ -n "$dir" ]]; then
        cd "$dir" || return 1
    fi
}

set -o vi
