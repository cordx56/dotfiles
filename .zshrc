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

bindkey	"\e[3~"	delete-char
bindkey	"\e[1~"	beginning-of-line
bindkey	"\e[4~"	end-of-line
bindkey	"\e[5~"	history-search-backward
bindkey	"\e[6~"	history-search-forward


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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status user host dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs vcs)

if [[ ! -v POWERLEVEL9K_MODE ]]; then
	POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0C6 "
fi
#POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR="%F{031}\uE0C6 "

POWERLEVEL9K_LINUX_ICON="\uF303"

POWERLEVEL9K_STATUS_OK=false
#POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{248} $(print_icon 'LEFT_SUBSEGMENT_SEPARATOR')%K{237} %F{254}"
POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{250}$(echo $'\uE0BB') %F{254}"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER="."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_USER_DEFAULT_FOREGROUND="252"
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="240"
POWERLEVEL9K_HOST_LOCAL_FOREGROUND="252"
POWERLEVEL9K_HOST_LOCAL_BACKGROUND="238"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="254"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="237"
POWERLEVEL9K_DIR_HOME_FOREGROUND="254"
POWERLEVEL9K_DIR_HOME_BACKGROUND="031"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="254"
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="237"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="031"

POWERLEVEL9K_VCS_CLEAN_BACKGROUND="039"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="234"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="003"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="234"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="161"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="255"

if [[ ! -v POWERLEVEL9K_MODE ]]; then
	POWERLEVEL9K_MODE="nerdfont-complete"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -e /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]; then
	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
elif [ -e /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme ]; then
	source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
elif [ -e ~/.powerlevel10k/powerlevel10k.zsh-theme ]; then
	source ~/.powerlevel10k/powerlevel10k.zsh-theme
elif [ -e ~/.powerlevel9k/powerlevel9k.zsh-theme ]; then
	source ~/.powerlevel9k/powerlevel9k.zsh-theme
elif [ `which pacman` ]; then
	sudo pacman -S zsh-theme-powerlevel10k
else
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
fi

if [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -e ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ `which pacman` ]; then
	sudo pacman -S zsh-syntax-highlighting
else
	git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting
fi

if [ -d ~/.zsh-completions ]; then
	fpath=($HOME/.zsh-completions/src $fpath)
fi

function update_zsh_tools() {
	if [ -d ~/.powerlevel10k ]; then
		(cd ~/.powerlevel10k && git pull origin master)
	fi
	if [ -d ~/.zsh-syntax-highlighting ]; then
		(cd ~/.zsh-syntax-highlighting && git pull origin master)
	fi
}
