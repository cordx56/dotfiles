switch (uname -s)
case Darwin
	alias ls="ls -G"
case Linux
	alias ls="ls --color=auto"
end

# clipboard
if not which pbcopy 1>/dev/null 2>&1
	alias pbcopy="xsel --clipboard --input"
end
if not which pbpaste 1>/dev/null 2>&1
	alias pbpaste="xsel --clipboard --output"
end

# Editor
alias nv="nvim"
alias emacs="emacs -nw"

# Git
alias gitlog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
