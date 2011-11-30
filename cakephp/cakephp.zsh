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
    if [[ -a "$cakeAppBase/cake/lib/Cake/VERSION.txt" ]]; then
        /usr/local/bin/php -c $cakeAppBase/../cgi/php.ini -q $cakeApp/Console/cake.php -working "$cakeApp" -root "$cakeAppBase" -app "$cakeApp" "$@"
    elif [[ -a "$cakeAppBase/cake/cake/VERSION.txt" ]]; then
        $cakeAppBase/cake/cake/console/cake $@ -app $cakeApp -working $cakeApp -root $cakeAppBase/cake -core $cakeAppBase/cake
    else
        echo Failed to load cake console
    fi
}
