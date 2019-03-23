#!/bin/bash
t=0
usage="Usage: InactiveUser.sh -t X{d/m}"
# detecció de opcions d'entrada: només son vàlids: sense paràmetres i -p
if [ $# -ne 0 ]; then
	if [ $# -eq 2 ]; then
		if [ $1 == "-t" ]; then
			t=$2
		else
			echo $usage; exit 1
		fi
	else
		echo $usage; exit 1
	fi
else 
    echo $usage; exit 1
fi

p=`echo $t | cut -c ${#t}`
t=`echo ${t::-1}`

if [ "$p" = "m" ]; then
   t=$((t*30))
fi

first=0
for user in `lastlog -b $t | cut -f1 -d\ `; do
    if [ $first -eq 0 ]; then
        first=1
    else
        home=`cat /etc/passwd | grep "^$user\>" | cut -d: -f6`
        if [ -d $home ]; then
            mods=`find $home -user $user -mtime $t`
            num_fich=`find $home -type f -user $user`
            
            
        fi
    fi
done
