function genTimestamp () {
    date '+%s'
}

function formatTimestamp() {
    date -d @$@
}

setopt nocorrectall
