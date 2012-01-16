export TMUX_UID=${TMUX//[^0-9]/}
if [[ $TMUX != "" ]] then
    export VIM_SERVER_KEY="VIM$TMUX_UID"
else
    export VIM_SERVER_KEY="VIM"
fi

function vim-project-server() {
    vim --servername $VIM_SERVER_KEY
}

function setProject () {
    export app_root=$PWD
    export app=$PWD/app
    alias -r v="tmux select-pane -t 0; vim --servername $VIM_SERVER_KEY --remote-silent"
}
