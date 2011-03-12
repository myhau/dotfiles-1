echo '------------------------------------------------'
echo 'System Status'
echo '------------------------------------------------'
top -orsize -F -R -l1 | grep % | grep -v COMMAND | cut -c 12-1000;
uptime | sed -E 's/^[0-9\: ]{5,5}[[:blank:]]*up (.*), [0-9]* users.*/Uptime: \1/';
