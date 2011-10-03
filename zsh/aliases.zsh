### Aliases

alias -r t="/usr/local/bin/todo.sh"
alias -r g="google"
if [[ -f "/usr/local/bin/hub" ]]; then
	alias -r git="hub"
fi
alias -r scpresume="rsync --partial --progress --rsh=ssh"
alias -r sshxeon="ssh paul@xeon.local"
alias -r svim="vim --servername VIM --remote-silent"
alias -g tmuxinit="-t \". /etc/profile; tmux attach\""

### Functions

function ssht {
	ssh -t $1 'tmux attach'
}
function pman {
	man -t "$1" > /tmp/"$1".ps; open /tmp/"$1".ps;
}

function gcal_today() {
	g calendar today title --cal ".*" | sed -E "/^$/d" | sed -E "/\[(.*)\]/d" | sed -E "s/^(.*)/(E) \1/g"
}

function initFakeDisplay() {
	startx -- /usr/bin/Xvfb :2 -screen 0 1024x768x24 & disown
}

### Cake Development Functions

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
	#alias -r v="vim --servername $cakeVimServerKey --remote-silent; tmux select-pane -t 0"
	alias -r v="tmux select-pane -t 0; vim --servername $cakeVimServerKey --remote-silent"
	if [[ $1 = "launchVim" ]]; then
		vim --servername $cakeVimServerKey
	fi
}

function cake() {
	$cakeAppBase/cake/cake/console/cake $@ -app $cakeApp -working $cakeApp -root $cakeAppBase/cake -core $cakeAppBase/cake
}
