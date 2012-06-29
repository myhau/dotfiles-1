### Aliases

alias -r g="google"
alias -r scpresume="rsync --partial --progress --rsh=ssh"

### Functions

function gcal_today() {
	g calendar today title --cal ".*" | sed -E "/^$/d" | sed -E "/\[(.*)\]/d" | sed -E "s/^(.*)/(E) \1/g"
}
