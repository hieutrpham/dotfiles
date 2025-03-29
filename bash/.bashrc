alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull --rebase"
# Add this at the end of ~/.bashrc
if [[ -x $(which fish) ]]; then
    exec fish
fi
