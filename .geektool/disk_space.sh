#!/bin/bash
 
proto_table=$(echo "|"Volume"|"Free"\n"
ls /Volumes/ | while read FILE; do
	if [[ "$FILE" != "Mac OS X Install DVD" ]] && [[ "$FILE" != "Potato" ]]; then
	  free=`df -H /Volumes/"$FILE"`
	  free=`echo $free | awk '{print $11}'` 
	  echo "|""$FILE""|"$free"\n"
	fi
done)
echo -----------------------------------
echo DISK SPACE
echo -----------------------------------
echo -e $proto_table | sed 's/ |/|/g'| column -c 2 -s "|" -t
