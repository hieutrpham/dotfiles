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
# Add this at the end of ~/.bashrc
if [[ -x $(which fish) ]]; then
    exec fish
fi
# fcd() {
#     local dir
#     dir=$(find . -type d | fzf)
#     if [[ -n "$dir" ]]; then
#         cd "$dir" || return 1
#     fi
# }
