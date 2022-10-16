#!/bin/bash

chr() {
  printf \\$(printf '%03o' $1)
}
echo "Gonderilen Mesaj"
for i in $(cat message.txt |grep request|grep length|awk '{print $14}')
do
   chr $i
done
echo ""
