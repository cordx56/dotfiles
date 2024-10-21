# gpg
export GPG_TTY=$(tty)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt hist_expire_dups_first
setopt extended_history
setopt inc_append_history
#setopt share_history
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

function loaded {
	(echo "$LOADED" | grep "$1:" > /dev/null) || \
		(export LOADED="$1:$LOADED" && false)
}
function setpath {
	(echo "$PATH" | grep "$1:" > /dev/null) || \
		export PATH="$1:$PATH"
}

#setopt localoptions ksharrays

ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

if [ -d ~/.zplug ]; then
	source ~/.zplug/init.zsh
	zplug 'zplug/zplug', hook-build:'zplug --self-manage'
	zplug "romkatv/powerlevel10k", as:theme, depth:1
	zplug "zsh-users/zsh-syntax-highlighting", defer:2
	zplug "jeffreytse/zsh-vi-mode"
	if ! zplug check; then
		zplug install
	fi
	zplug load
else
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

bindkey	"\e[3~"	delete-char
bindkey	"\e[1~"	beginning-of-line
bindkey	"\e[4~"	end-of-line
bindkey	"\e[5~"	history-search-backward
bindkey	"\e[6~"	history-search-forward

# zsh vim keybind
zvm_bindkey vicmd "H" beginning-of-line
zvm_bindkey vicmd "L" end-of-line

setopt auto_cd

case "$(uname -s)" in
	Darwin)
		alias ls="ls -G"
		;;
	Linux)
		alias ls="ls --color=auto"
esac
export VISUAL="vim"

# Path
setpath "$HOME/.local/bin"
## Rust
setpath "$HOME/.cargo/bin"
## Golang
if which go 1>/dev/null 2>&1; then
	export GOPATH="$HOME/.go"
	export GOENV_ROOT="$HOME/.goenv"
	setpath "$GOENV_ROOT/bin"
	setpath "$GOPATH/bin"
fi
## Python
### pyenv
if [ -d "$HOME/.pyenv" ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	setpath "$PYENV_ROOT/bin"
fi
## Ruby
if which gem 1>/dev/null 2>&1; then
	setpath "`ruby -e 'puts Gem.user_dir'`/bin"
fi
## Node
### npm
export NPM_PACKAGES="$HOME/.npm-packages"
setpath "$NPM_PACKAGES/bin"
### nvm
if which nvm 1>/dev/null 2>&1; then
	export NVM_DIR="$HOME/.nvm"
	export NVM_SOURCE="/usr/share/nvm"
	[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"
fi
## PHP composer
if which php 1>/dev/null 2>&1; then
	setpath "$HOME/.config/composer/vendor/bin"
fi
# Haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
## Lean
if [ -e "$HOME/.elan/env" ]; then
	loaded "$HOME/.elan/env" && \
		source "$HOME/.elan/env"
fi
## TeX
export TEXMFCNF="$HOME/.texmf:"
alias pandoc-beamer="pandoc -t beamer --slide-level=3"
## Android
export ANDROID_HOME="$HOME/Android/Sdk"
if [ -d "$ANDROID_HOME" ]; then
	setpath "$ANDROID_HOME/emulator"
	setpath "$ANDROID_HOME/tools"
	setpath "$ANDROID_HOME/tools/bin"
	setpath "$ANDROID_HOME/platform-tools"
fi

# anyenv
if which anyenv 1>/dev/null 2>&1; then
	eval "$(anyenv init -)"
fi
# docker
if [ -d "$HOME/.docker/bin" ]; then
	setpath "$HOME/.docker/bin"
fi
# homebrew
if [ -e /opt/homebrew/bin/brew ]; then
	loaded "/opt/homebrew/bin/brew" || \
		eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Completion
## Golang goenv
if which goenv 1>/dev/null 2>&1; then
	eval "$(goenv init -)"
fi
## Python pyenv
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi
## Haskell stack
if which stack 1>/dev/null 2>&1; then
	autoload -U +X compinit && compinit
	autoload -U +X bashcompinit && bashcompinit
	eval "$(stack --bash-completion-script stack)"
fi

# clipboard
if ! which pbcopy 1>/dev/null 2>&1; then
	alias pbcopy="xsel --clipboard --input"
fi
if ! which pbpaste 1>/dev/null 2>&1; then
	alias pbpaste="xsel --clipboard --output"
fi


# Git settings
alias g="git"
if which git 1>/dev/null 2>&1; then
	source $HOME/.gitconfig.sh
fi

# 1Password
_update_ssh_auth_sock() {
	if [[ -n "$TMUX" ]]; then
		local val
		val=$(tmux show-environment | grep "^SSH_AUTH_SOCK=")
		if [[ -n "$val" ]]; then
			export $val
		fi
	fi
	if [ $(uname -s) = "Linux" ] \
		&& [ -e "$HOME/.1password/agent.sock" ] \
		&& [ -z "$SSH_AUTH_SOCK" ]; then
		export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
	fi
	if [ $(uname -s) = "Darwin" ] \
		&& [ -e "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" ] \
		&& [[ "$SSH_AUTH_SOCK" =~ "Listeners$" ]]; then
		export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
	fi
}
add-zsh-hook precmd _update_ssh_auth_sock


# Vim settings
alias nv="nvim"


# Emacs settings
alias emacs="emacs -nw"


# Python settings
## pipenv
export PIPENV_VENV_IN_PROJECT=true

# iTerm2
loaded "${HOME}/.iterm2_shell_integration.zsh" || \
	(test -e "${HOME}/.iterm2_shell_integration.zsh" && \
	source "${HOME}/.iterm2_shell_integration.zsh")

# my scripts
.env() {
	local current="$(pwd)"
	local argfrom=1
	local envfile="${current}/.env"
	if [[ "$1" = "-f" ]]; then
		argfrom=3
		envfile="${current}/${2}"
	fi
	env $(cat "${envfile}") "${@:${argfrom}}"
}
# tmux
_tmux_wrap() {
	if [[ "$1" = "n" ]]; then
		tmux new-session -d -s "$2" && \
			(tmux switch-client -t "$2" || tmux attach-session -t "$2")
	else
		tmux "$@"
	fi
}
alias t=_tmux_wrap

# ==========================#
# INSERT CHANGES ABOVE HERE #
# ========================= #

# asdf
if [ -d "$HOME/.asdf" ]; then
	loaded "$HOME/.asdf" || \
		source $HOME/.asdf/asdf.sh
fi
# mise
if [ -f "$HOME/.local/bin/mise" ]; then
	loaded "$HOME/.local/bin/mise" || \
		eval "$($HOME/.local/bin/mise activate zsh)"
fi
# rye
if [ -e "$HOME/.rye/env" ]; then
	loaded "$HOME/.rye/env" || \
		source "$HOME/.rye/env"
fi

#
# PowerLevel9K
#
[[ ! -f ~/.p10k.zsh ]] || loaded ~/.p10k.zsh || source ~/.p10k.zsh
