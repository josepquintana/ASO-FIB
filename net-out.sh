#!/bin/bash

usage="Usage: net-out.sh [time]"
if [ $# -ne 0 ]; then
	if [ $# -eq 1 ]; then
        t=$1
	else
		echo $usage; exit 1
	fi
else 
    t=5
fi

while [ 1 ]; do
    for int in `netstat -i | cut -d\  -f1`; do
        if [ $int != "Kernel" ]; then
            if [ $int != "Iface" ]; then
                echo "$int: `cat /sys/class/net/$int/statistics/tx_packets`"
            fi
        fi


    done
    sleep $t
done


 
 
 

 
 
 
 
 
