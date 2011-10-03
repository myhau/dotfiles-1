### Aliases

alias -r g="google"
alias -r scpresume="rsync --partial --progress --rsh=ssh"
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
