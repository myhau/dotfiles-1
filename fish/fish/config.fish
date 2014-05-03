# Path to your oh-my-fish.
set fish_path $HOME/.dotfiles/oh-my-fish

# Theme
#set -g theme_display_user yes
#set -g default_user _connrs
set fish_theme base16

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

set -x EDITOR vim

set -x PATH /usr/local/bin $PATH /usr/local/sbin /usr/libexec /usr/bin

set platform (uname)

switch (uname)
  case Darwin
    set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
    set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
  case Linux
end

set -x PATH $HOME/bin $PATH

set -x DISABLE_AUTO_TITLE true

if test -s $HOME/.dotfiles.local/pre.fish
  source $HOME/.dotfiles.local/pre.fish
end

for source_file in $HOME/.dotfiles/*/*.fish
  #echo "LOADING SOURCE $source_file"
  #source $source_file
end

if test -s $HOME/.dotfiles.local/post.fish
  source $HOME/.dotfiles.local/post.fish
end

if test -n "$TMUX"
    set -x TERM screen-256color
end
