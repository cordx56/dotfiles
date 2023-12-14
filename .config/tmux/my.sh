#!/bin/bash

function u() {
    local ubin = $(dc -e "16i 2o $1 p")
    echo $ubin
    #| xxd -r -p
}

function config_tmux() {
    local t="tmux"
    local bind="$t bind"
    local set="$t set"

    # Shell/Terminal info
    $set -g default-command "/bin/zsh"
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
    $set -g status 2
    $set -g status-interval 1
    local c_white="#cccccc"
    local c_black="#202328"
    local c_red="#cc0000"
    local c_green="#039300"
    local c_blue="#51afef"
    local c_yellow="#fed73b"
    local c_purple="#c678dd"
    local c_default_bg="$c_black"
    local c_default_fg="$c_white"
    local set_default="#[bg=$c_default_bg,fg=$c_default_fg]"
    local left_accent="#[bg=$c_blue,fg=$c_default_fg] $set_default"
    local right_accent="#[bg=$c_red] $set_default"
    $set -g status-bg $c_default_bg
    $set -g status-fg $c_default_fg
    $set -g window-status-format "$set_default #I$(u e0bb)#W "
    $set -g window-status-current-format "#[bg=$c_default_bg,fg=$c_red]\ue0ba#[bg=$c_red,fg=$c_default_fg]#I#[fg=$c_black]\ue0ba$set_default#W "
    local os_icon="?"
    if [ "$(uname -o)" = 'Linux' ]; then
        os_icon="#[fg=$c_yellow]\\uf17c"
    elif [ "$(uname -o)" = 'Darwin' ]; then
        os_icon="#[fg=$c_purple]\uf179"
    fi
    # Status lines
    local session_name="#[bg=$c_green,fg=$c_black]\ue0b0 #[bg=$c_green,fg=$c_default_fg]#S #[bg=$c_default_bg,fg=$c_green]\ue0b0$set_default"
    local windows="#{W:#{E:window-status-format},#{E:window-status-current-format}}"
    $set -g status-format[0] "$left_accent  $os_icon $session_name $windows#[align=right]#{E:user}@#H  $right_accent"
}

config_tmux
