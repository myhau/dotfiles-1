#!/usr/local/bin/zsh
tmux start-server

if ! $(tmux has-session -t 'DuxTest'); then
cd /home/searchfirst/dux.searchfirst.co.uk/user/test

env TMUX= tmux start-server \; set-option -g base-index 1 \; new-session -d -s 'DuxTest' -n 'editor'
tmux set-option -t 'DuxTest' default-path /home/searchfirst/dux.searchfirst.co.uk/user/test



# set up tabs and panes

# tab "editor"

tmux send-keys -t 'DuxTest':1 'setCakeProject launchVim' C-m

tmux splitw -t 'DuxTest':1
tmux send-keys -t 'DuxTest':1 'setCakeProject' C-m

tmux splitw -t 'DuxTest':1
tmux send-keys -t 'DuxTest':1 'setCakeProject' C-m

tmux select-layout -t 'DuxTest':1 'main-horizontal'



tmux select-window -t 'DuxTest':1

fi

if [ -z $TMUX ]; then
    tmux -u attach-session -t 'DuxTest'
else
    tmux -u switch-client -t 'DuxTest'
fi