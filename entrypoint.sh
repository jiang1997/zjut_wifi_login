#!/bin/sh

address=$(ip address show $3 | awk '/inet / {print $2}' | cut -d/ -f1)
echo logging...

while true
do
  while ! ping -c 1 www.baidu.com &> /dev/null
  do
    echo "try logging"
    curl --interface $3 -s "http://192.168.8.1:801/eportal/?c=Portal&a=login&callback=dr1003&login_method=1&user_account=,0,$1&user_password=$2&wlan_user_ip=$address" 
    sleep 1
  done

  sleep 2
done


