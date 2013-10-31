## set status bar
#set -g status-bg "#373b41"
set -g status-bg colour238
set -g status-fg "#c5c8c6"

## highlight active window
setw -g window-status-current-bg default
setw -g window-status-current-fg colour39

## highlight activity in status bar
setw -g window-status-activity-bg colour39
setw -g window-status-activity-fg colour233

## pane border and colors
set -g pane-active-border-bg default
set -g pane-active-border-fg colour233
set -g pane-border-bg default
set -g pane-border-fg colour233

set -g clock-mode-colour "#81a2be"
set -g clock-mode-style 24

set -g message-bg "#8abeb7"
set -g message-fg "#000000"

set -g message-command-bg "#8abeb7"
set -g message-command-fg "#000000"

set -g mode-bg "#8abeb7"
set -g mode-fg "#000000"

set -g status-left '#(~/.dotfiles/tmux/powerline/status_left.sh)'
set -g status-right '#(~/.dotfiles/tmux/powerline/status_right.sh)'
