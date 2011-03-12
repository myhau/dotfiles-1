#!/bin/bash
#source ~/.bash_profile
google calendar today title --cal ".*" | sed -E "/^$/d" | sed -E "/\[(.*)\]/d" | sed -E "s/^(.*)/ ◊ | \1/g"
~/Documents/Dropbox/Library/Shell/todo.txt-cli/todo.sh ls | sed -E '/^(--|TODO)/d' | sed -E "s/?(.*)/\1/g" | sed -E "s/^([0-9;m\[]*) (.*)$/\1 | \2/" | sed -E '/^\[(.*)/`echo `[\1/'