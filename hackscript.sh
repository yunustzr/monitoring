#!/bin/bash


echo -n "Message send:"
read message

for ((i=0;i<${#message};i++))
do
   data=${message:$i:1}
   asciValue=$(echo ${data}|od -t d1|awk '{printf "%s",$2}')
   echo "$data : $asciValue"
   ping -c 1 -s $((asciValue-8)) -p aa  127.0.0.1
   sleep 0.5
done


#ping -c 5 -s 121 -p aa  127.0.0.1
