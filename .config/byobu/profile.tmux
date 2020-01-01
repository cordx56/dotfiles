source $BYOBU_PREFIX/share/byobu/profiles/tmux

set -g default-shell /bin/zsh
set -g default-command /bin/zsh
set -g default-terminal xterm-256color
set -ga terminal-overrides ',xterm-256color:Tc'
set -g mouse on
set -g mouse-utf8 on
