#!/bin/sh

counter=1
BEGIN=6030
END=7000

items=`cat cpu.log | grep all | grep PM | awk 'BEGIN{FS=" "}{print $9}'`

for item in $items
do
    if [ $counter -le $END ] && [ $counter -ge $BEGIN ] 
    then
        echo $item
    fi
    counter=`expr $counter + 1`
done
