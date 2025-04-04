if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_autosuggestion_enabled 1
    set -U fish_term24bit 1
end

#yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

#fzf for cd
function fcd
    set dir (find . -type d | fzf)
    if test -n "$dir"
        cd "$dir"
    end
end

#calling tmux
function t
  if tmux list-sessions &>/dev/null
    tmux attach
  else
    tmux
  end
end

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull --rebase"
alias nf='fzf -m --preview="bat --color=always {}" --bind "enter:become(nvim {+})"'

zoxide init --cmd cd fish | source
