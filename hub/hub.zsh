if [[ -f "/usr/local/bin/hub" ]]; then
    alias -r git="hub"
fi

if [[ -f "$HOME/bin/hub" ]]; then
    alias -r git="$HOME/bin/hub"
fi
