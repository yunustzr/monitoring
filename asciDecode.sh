#!/bin/bash
rm -rf message*

function chr {
  if [ "$1" == "1000" ]
  then
    FILE=`dirname $0`/output
    echo "$(cat output)"
    zenity --text-info  --title="Message" --filename=$FILE
    printf "\n--endMesage----\n"
    kill -9 `pidof tcpdump`
    exit 0
  else
    printf "\x$(printf %x $1)" >> output
  fi
}

tcpdump -i any icmp -w message.pcap &  >/dev/null 2>&1
echo "Gonderilen Mesaj"
while true
do
  rm -rf output
  tcpdump -r message.pcap >message.txt & >/dev/null 2>&1
  echo "-----------"
  echo "$(cat message.txt)"
  sleep 1
  for i in $(cat message.txt |grep length|grep request|awk '{print $14 }')
  do
   chr "$i"
  done
done
