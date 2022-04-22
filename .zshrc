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

#setopt localoptions ksharrays

if [ -d ~/.zplug ]; then
	source ~/.zplug/init.zsh
	zplug 'zplug/zplug', hook-build:'zplug --self-manage'
	zplug "romkatv/powerlevel10k", as:theme, depth:1
	zplug "zsh-users/zsh-syntax-highlighting", defer:2
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

setopt auto_cd

case "$(uname -s)" in
	Darwin)
		alias ls="ls -G"
		;;
	Linux)
		alias ls="ls --color=auto"
esac
export VISUAL="vim"

if [ $TERM="screen" ] && [ -e /usr/share/terminfo/s/screen-256color ]; then
	export TERM="screen-256color"
fi
if [ $TERM="xterm" ] && [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM="xterm-256color"
fi

# Path
export PATH="$HOME/.local/bin:$PATH"
## Rust
export PATH="$HOME/.cargo/bin:$PATH"
## Golang
if which go 1>/dev/null 2>&1; then
	export GOPATH="$HOME/.go"
	export GOENV_ROOT="$HOME/.goenv"
	export PATH="$GOENV_ROOT/bin:$PATH"
	export PATH="$GOPATH/bin:$PATH"
fi
## Python
### pyenv
if [ -d "$HOME/.pyenv" ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
fi
## Ruby
if which gem 1>/dev/null 2>&1; then
	export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
fi
## Node
### npm
if which npm 1>/dev/null 2>&1; then
	export NPM_PACKAGES="$HOME/.npm-packages"
	export PATH="$NPM_PACKAGES/bin:$PATH"
	unset MANPATH
	if which manpath 1>/dev/null 2>&1; then
		export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
	fi
	export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
fi
### yarn
if which yarn 1>/dev/null 2>&1; then
	export PATH="`yarn global bin`:$PATH"
fi
### nvm
if which nvm 1>/dev/null 2>&1; then
	export NVM_DIR="$HOME/.nvm"
	export NVM_SOURCE="/usr/share/nvm"
	[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"
fi
## PHP composer
if which php 1>/dev/null 2>&1; then
	export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi
## TeX
export TEXMFCNF="$HOME/.texmf:"
alias pandoc-beamer="pandoc -t beamer --slide-level=3"
## Android
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# anyenv
if which anyenv 1>/dev/null 2>&1; then
	eval "$(anyenv init -)"
fi
# asdf
if [ -d "$HOME/.asdf" ]; then
	source $HOME/.asdf/asdf.sh
fi
# homebrew
if [ -e /opt/homebrew/bin/brew ]; then
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


# Git alias
alias gitlog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"


# Vim settings
alias nv="nvim"


# Emacs settings
alias emacs="emacs -nw"


# Python settings
## pipenv
export PIPENV_VENV_IN_PROJECT=true


#
# PowerLevel9K
#
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
