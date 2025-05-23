#!/bin/bash

function u() {
    # https://stackoverflow.com/questions/27652458/whats-the-best-way-to-embed-a-unicode-character-in-a-posix-shell-script
    printf $(printf '\\%o' $(printf %08x "0x$1" | sed 's/../0x& /g')) | iconv -f UTF-32BE -t UTF-8
}

function styled() {
    echo "#[$1]#[push-default]#[default]$2#[pop-default]#[default]"
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
    $bind -n c-w kill-window

    # variable
    $set -ag update-environment " SSH_AUTH_SOCK "

    # Customize
    #$set -g status 1
    $set -g status-interval 1
    local set_default="#[bg=$c_default_bg,fg=$c_default_fg]"
    local left_accent="$(styled "bg=$c_blue,fg=$c_default_fg" " ")"
    local right_accent="$(styled "bg=$c_red" " ")"
    $set -g status-bg $c_default_bg
    $set -g status-fg $c_default_fg
    $set -g window-status-format " #I$l_slash#W "
    $set -g window-status-current-format "$(styled "bg=$c_default_bg,fg=$c_red" "$lr_tri")$(styled "bg=$c_red,fg=$c_default_fg" "#I")$(styled "bg=$c_default_bg,fg=$c_red" "$ul_tri")#W "
    local os_icon="?"
    case "$(uname -s)" in
        Darwin)
            os_icon="$(styled "fg=$c_purple" "$macos_icon")"
            ;;
        Linux)
            os_icon="$(styled "fg=$c_yellow" "$linux_icon")"
            ;;
    esac
    # Status lines
    local session_name="$(styled "fg=#89b4fa" "  #S ")"
    local windows=" #{W:#{E:window-status-format},#{E:window-status-current-format}} "
    $set -g status-format[0] "$left_accent  $os_icon$session_name$windows$(styled "align=right" "#{E:user}@#H  %Y-%m-%d %H:%M:%S  $right_accent")"
    #$set -g status-format[1] "$left_accent  #[align=right]  $right_accent"
}

config_tmux
