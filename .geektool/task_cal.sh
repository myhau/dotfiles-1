#!/bin/bash
echo '------------------------------------------------'
echo 'Calendar'
echo '------------------------------------------------'
google calendar today title --cal ".*" | sed -E "/^$/d" | sed -E "/\[(.*)\]/d" | sed -E -e "s/^(.*)/\x1b[33m*\x1b[0m \1/g"
#echo '------------------------------------------------'
#echo 'Tasks'
#echo '------------------------------------------------'
#~/Documents/Dropbox/Library/Shell/todo.txt-cli/todo.sh ls | sed  -E -e 's/^--$//g' -e 's/^TODO.*//g' -e '/^$/d'
