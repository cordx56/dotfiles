set -gx VISUAL vim

# Path
set -gx PATH $HOME/.local/bin $PATH
## Rust
if [ -d $HOME/.cargo ]
	set -gx PATH $HOME/.cargo/bin $PATH
end
## Golang
if [ -d $HOME/.go ]
	set -gx GOPATH $HOME/.go
	set -gx PATH $GOPATH/bin $PATH
end
if [ -d $HOME/.goenv ]
	set -gx GOENV_ROOT $HOME/.goenv
	set -gx PATH $GOENV_ROOT/bin $PATH
end
## Python
if [ -d $HOME/.pyenv ]
	set -gx PYENV_ROOT $HOME/.pyenv
	set -gx PATH $PYENV_ROOT/bin $PATH
end
## Node
### npm
if [ -d $HOME/.npm-packages ]
	set -gx NPM_PACKAGES $HOME/.npm-packages
	set -gx PATH $NPM_PACKAGES/bin $PATH
end
## TeX
set -gx TEXMFCNF $HOME/.texmf:

# Python settings
## pipenv
set -gx PIPENV_VENV_IN_PROJECT true
