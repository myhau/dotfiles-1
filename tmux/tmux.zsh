function unlocktmux() {
chmod -R 777 /tmp/tmux-1000
}

function locktmux() {
chmod -R 700 /tmp/tmux-1000
}
