# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="prose"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github)

source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/zsh/aliases

# Customize to your needs...
export VIM_APP_DIR=/Applications/Utils/Development
export TODOTXT_DEFAULT_ACTION=ls

export EDITOR=vim

export PATH=/usr/local/bin:$PATH:/usr/local/sbin:/sbin:/usr/libexec:/usr/bin:/Applications:/Developer/usr/bin:/Users/shunuk/Documents/Dropbox/Projects/src/todo

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm" # Load RVM function
