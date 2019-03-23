#!/bin/bash
usage="Usage: ocupacio.sh "

if [ $# -ne 0 ]; then
	if [ $# -eq 1 ]; then
        t=$1
	else
		echo $usage; exit 1
	fi
else 
    echo $usage; exit 1
fi

p=`echo $t | cut -c ${#t}`
t=`echo ${t::-1}`

if [ "$p" = "M" ]; then
   t=$((t*1024))
fi


for user in `cat /etc/passwd | cut -d: -f1`; do
	home=`cat /etc/passwd | grep "^$user\>" | cut -d: -f6`
	
	if [ `echo $home | cut -d/ -f2` = "home" ]; then
       if [ `echo $home | cut -d/ -f3` = "festival" ]; then
            echo "festival"
       else
        u=`du -sh $home | cut  -f1`
        echo $user $u

            p=`echo $u | cut -c ${#u}`
            u=`echo ${u::-1}`

            if [ "$p" = "M" ]; then
                u=$((u*1024))
            fi
            
            
            if [ $u -ge $t ]; then
                if [ `cat $home/.profile | grep "You use too much space" | wc -l` -eq 0 ]; then 
                    echo "echo \"You use too much space!\"" >> $home/.profile
                    echo "> .profile updated"
                fi
            fi  
        fi
	fi

done
















