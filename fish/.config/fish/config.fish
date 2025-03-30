if status is-interactive
    set -U fish_autosuggestion_enabled 1
    set -U fish_term24bit 1
end
function fcd
    set dir (find . -type d | fzf)
    if test -n "$dir"
        cd "$dir"
    end
end
source ~/.bashrc
#alias v='nvim'
#alias gs="git status"
#alias ga="git add ."
#alias gc="git commit -m"
#alias gp="git push"
#alias gl="git pull --rebase"
