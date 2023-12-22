#!/bin/bash

function u() {
    # https://stackoverflow.com/questions/27652458/whats-the-best-way-to-embed-a-unicode-character-in-a-posix-shell-script
    printf $(printf '\\%o' $(printf %08x "0x$1" | sed 's/../0x& /g')) | iconv -f UTF-32BE -t UTF-8
}

function config_tmux() {
    local t="tmux"
    local bind="$t bind"
    local set="$t set"

    local lh_div="$(u e0b0)"
    local lr_tri="$(u e0ba)"
    local ul_tri="$(u e0bc)"
    local l_slash="$(u e0bb)"
    local linux_icon="$(u f17c)"
    local macos_icon="$(u f179)"

    # Colour
    local c_white="#cccccc"
    local c_black="#202328"
    local c_red="#cc0000"
    local c_green="#039300"
    local c_blue="#51afef"
    local c_yellow="#fed73b"
    local c_purple="#c678dd"
    local c_default_bg="$c_black"
    local c_default_fg="$c_white"

    # Shell/Terminal info
    ZSH_PATH="$(which zsh)"
    DEFAULT_SHELL=${ZSH_PATH:-$SHELL}
    $set -g default-command "${DEFAULT_SHELL}"
    $set -g default-terminal "xterm-256color"
    $set -ag terminal-overrides ",$TERM:Tc"

    # mouse
    $set -g mouse on

    # tmux key binds
    $bind -n c-u detach-client
    $bind -n c-s choose-tree
    $bind -n c-t new-window -c "#{pane_current_path}"
    $bind -n c-h previous-window
    $bind -n c-l next-window
    $bind -n c-p split-window -v -c "#{pane_current_path}"
    $bind -n c-v split-window -h -c "#{pane_current_path}"
    $bind -n s-left select-pane -L
    $bind -n s-right select-pane -R
    $bind -n s-up select-pane -U
    $bind -n s-down select-pane -D

    # Customize
    $set -g status 1
    $set -g status-interval 1
    local set_default="#[bg=$c_default_bg,fg=$c_default_fg]"
    local left_accent="#[bg=$c_blue,fg=$c_default_fg] $set_default"
    local right_accent="#[bg=$c_red] $set_default"
    $set -g status-bg $c_default_bg
    $set -g status-fg $c_default_fg
    $set -g window-status-format "$set_default #I$l_slash#W "
    $set -g window-status-current-format "#[bg=$c_default_bg,fg=$c_red]$lr_tri#[bg=$c_red,fg=$c_default_fg]#I#[bg=$c_default_bg,fg=$c_red]$ul_tri$set_default#W "
    local os_icon="?"
    if [ "$(uname -o)" = 'Linux' ]; then
        os_icon="#[fg=$c_yellow]$linux_icon"
    elif [ "$(uname -o)" = 'Darwin' ]; then
        os_icon="#[fg=$c_purple]$macos_icon"
    fi
    # Status lines
    local session_name="#[bg=$c_green,fg=$c_default_bg]$lh_div #[bg=$c_green,fg=$c_default_fg]#S #[bg=$c_default_bg,fg=$c_green]$lh_div$set_default"
    local windows="#{W:#{E:window-status-format},#{E:window-status-current-format}}"
    $set -g status-format[0] "$left_accent  $os_icon $session_name $windows#[align=right]#{E:user}@#H  $right_accent"
    #$set -g status-format[1] "$left_accent  #[align=right]  $right_accent"
}

config_tmux
