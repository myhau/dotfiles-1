function genTimestamp () {
    date '+%s'
}

function formatTimestamp() {
    date -d @$@
}

function compProj() {
    diff -r -x .git -x _notes $1 $2
}

setopt nocorrectall
