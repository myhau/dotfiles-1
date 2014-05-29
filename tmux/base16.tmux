## set status bar
set -g status-bg '#151515'
set -g status-fg "#c3c3c3"

## highlight active window
setw -g window-status-current-bg '#151515'
setw -g window-status-current-fg '#ffffff'

## highlight activity in status bar
setw -g window-status-activity-bg '#cf6a4c'
setw -g window-status-activity-fg '#151515'

## pane border and colors
set -g pane-active-border-bg default
set -g pane-active-border-fg '#151515'
set -g pane-border-bg default
set -g pane-border-fg '#151515'

set -g clock-mode-colour "#8f9d6a"
set -g clock-mode-style 24

set -g message-bg "#cf6a4c"
set -g message-fg "#ffffff"

set -g message-command-bg "#8abeb7"
set -g message-command-fg "#000000"

set -g mode-bg "#8f9d6a"
set -g mode-fg "#ffffff"

set -g status-left '#(~/.dotfiles/tmux/base16/status_left.sh)'
set -g status-right '#(~/.dotfiles/tmux/base16/status_right.sh)'
