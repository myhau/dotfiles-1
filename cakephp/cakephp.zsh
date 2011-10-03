function setCakeProject() {
    if [[ $TMUX != "" ]]; then
        tmux_uid=${TMUX//[^0-9]/}
        key="VIMCAKE$tmux_uid"
    else;
        key="VIM"
    fi
    export cakeVimServerKey="$key"
    export cakeAppBase=$PWD
    export cakeApp=$PWD/app
    alias -r vim-project-server="vim --servername $cakeVimServerKey"
    alias -r v="tmux select-pane -t 0; vim --servername $cakeVimServerKey --remote-silent"
    if [[ $1 = "launchVim" ]]; then
        vim --servername $cakeVimServerKey
    fi
}

function cake() {
    $cakeAppBase/cake/cake/console/cake $@ -app $cakeApp -working $cakeApp -root $cakeAppBase/cake -core $cakeAppBase/cake
}
