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

function generateCtags () {
    PROJECT=$1
    PROJECT_PATH=$2
    RPWD=$PWD
    cd $PROJECT_PATH
    ctags-exuberant -f ~/.ctags/$PROJECT -h \".php\" -R --totals=yes --tag-relative=yes --PHP-kinds=+cf --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public |static |abstract |protected |private )+function ([^ ])*/\2/f/'
    cd $RPWD
}
