#!/bin/bash
cat ./list.txt | while read host_ip
do
  ping -c 1 -W 1 "$host_ip" > /dev/null
  if [ $? -eq 0 ]; then
    echo "EC2 Instance $host_ip is UP"
  else
    echo "EC2 Instance $host_ip is DOWN"
  fi
done
