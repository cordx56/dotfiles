# Golang
## goenv
if which goenv 1>/dev/null 2>&1
	goenv init - | source
end
# Python
## pyenv
if which pyenv 1>/dev/null 2>&1
	pyenv init - | source
end
# Haskell
## stack
if which stack 1>/dev/null 2>&1
	#stack --bash-completion-script stack | source
end
