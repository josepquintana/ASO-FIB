#!/bin/bash
p=0
usage="Usage: infouser.sh name"
# detecció de opcions d'entrada: només son vàlids: sense paràmetres i -p
if [ $# -ne 0 ]; then
	if [ $# -eq 1 ]; then
			p=$1
		else
			echo $usage; exit 1
		fi
else
	echo $usage; exit 1
fi


# afegiu una comanda per llegir el fitxer de password i només agafar el camp de # nom de l'usuari
exists=`cat /etc/passwd | grep "^$p\>" | wc -l`

if [ $exists -eq 0 ]; then 
    echo "Invalid username"
else
    home=`cat /etc/passwd | grep "^$p\>" | cut -d: -f6`
    echo "Home: $home"
    echo "Home size: `du -sh $home | cut  -f1`"
    echo "Other dirs: "
#    for archivo in `find / -type f -user $p`; do
 #       if [ "`echo $archivo | cut -d/ -f2`" != "proc" ]; then
  #          if [ "`echo $archivo | cut -d/ -f2`" != "home" ]; then
   #             if [ "`echo $archivo | cut -d/ -f3`" != "$p" ]; then
    #                dirname $archivo
     #           fi
      #      fi
       # fi
    #done | sort | uniq
    echo "Active processes: `ps -u $p | wc -l`"
    
fi



































