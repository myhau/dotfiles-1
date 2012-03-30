export TMUX_UID=${TMUX//[^0-9]/}
if [[ $TMUX != "" ]] then
    export VIM_SERVER_KEY="VIM$TMUX_UID"
else
    export VIM_SERVER_KEY="VIM"
fi

function vim-project-server() {
    vim --servername $VIM_SERVER_KEY $@
}

function setProject () {
    export app_root=$PWD
    export app=$PWD/app
    alias -r v="tmux select-pane -t 0; vim --servername $VIM_SERVER_KEY --remote-silent"
}

function generateCtags () {
    ____gctPROJECT_PATH=$1
    ____gct____gctPROJECT_PATH_PATH=$2
    ____gctRPWD=$PWD
    cd $____gct____gctPROJECT_PATH_PATH
    ctags-exuberant -f ~/.ctags.d/$____gctPROJECT_PATH -h \".php\" -R --totals=yes --tag-relative=yes --PHP-kinds=+cf-v --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public |static |abstract |protected |private )+function ([^ ])*/\2/f/'
    cd $____gctRPWD
    ____gctRPWD=
    ____gctPROJECT_PATH=
    ____gct____gctPROJECT_PATH_PATH=
}
