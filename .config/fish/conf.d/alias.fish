alias ls='ls --color=auto'

# clipboard
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

# Editor
alias nv="nvim"
alias emacs="emacs -nw"

# Git
alias gitlog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
