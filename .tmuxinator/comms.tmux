#!/usr/local/bin/zsh
tmux start-server

if ! $(tmux has-session -t 'Comms'); then
cd ~/

env TMUX= tmux start-server \; set-option -g base-index 1 \; new-session -d -s 'Comms' -n 'main'
tmux set-option -t 'Comms' default-path ~/



# set up tabs and panes

# tab "main"

tmux send-keys -t 'Comms':1 'irssi' C-m

tmux splitw -t 'Comms':1
tmux send-keys -t 'Comms':1 'mutt' C-m

tmux select-layout -t 'Comms':1 'main-vertical'



tmux select-window -t 'Comms':1

fi

if [ -z $TMUX ]; then
    tmux -u attach-session -t 'Comms'
else
    tmux -u switch-client -t 'Comms'
fi