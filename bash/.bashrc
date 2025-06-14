red=$(tput setaf 9)
cyan=$(tput setaf 39)
green=$(tput setaf 2)
blue=$(tput setaf 4)
pink=$(tput setaf 225)
reset=$(tput setaf sgr0)

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

color() {
	for c in {0..255}; do
		tput setaf $c
		echo -n "$c "
	done
	tput sgr0
	echo
}

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /';
}

hostname_if_ssh(){
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "[$(hostname)] "
  fi
}

# export PS1="${cyan}$(hostname_if_ssh)\w ${red}$(parse_git_branch)${reset}🚀 "
export   PS1='\[$red\]\u\[$reset\]@\[$pink\]\h\[$reset\]:\[$blue\]\w\[$reset\] 🚀 '
set -o vi
