#!/bin/bash
usage="Usage: DeleteUser.sh user"

if [ $# -eq 1 ]; then
        user=$1
else
    echo $usage; exit 1
fi

home=`cat /etc/passwd | grep "^$user\>" | cut -d: -f6`

find $home -user $user -type f > /tmp/backuperfile.txt
tar -cvf /tmp/backup_$user -T /tmp/backuperfile.txt
rm /tmp/backuperfile.txt

find $home -user $user -print0 | xargs -0 rm -rf

chsh -s /usr/local/lib/no-login $user



