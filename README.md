# zjut_wifi_login
## wifi login in CS building ZJUT
---
# 使用方法
## 直接使用
`./bash entrypoint.sh [username] [passwd] [interface]`

interface 可由 `ip address` 查询

```sh
jieke@jieke-mini:~/Downloads/zjut_wifi_login$ ip address
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇
    inet ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ brd 10.81.255.255 scope global dynamic noprefixroute wlan0
       valid_lft 247961sec preferred_lft 247961sec
    inet6 fe80::947c:e1d:f2c0:c6bb/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
...
```
`wlan0` 即为所需的 interface

## Daemonize by Docker
```sh
sudo docker build -t jieke/autologin .
sudo docker run -d --name zjut_wifi_autologin --restart unless-stopped --network host jieke/autologin [username] [passwd] [interface]
```
~~ps 有线网登录只需修改脚本文件中的
`"http://192.168.8.1:801/eportal/?c=Portal&a=login&callback=dr1003&login_method=1&user_account=,0,$1&user_password=$2&wlan_user_ip=$address"`
为
`"http://192.168.6.1:801/eportal/?c=Portal&a=login&callback=dr1003&login_method=1&user_account=,0,$1&user_password=$2&wlan_user_ip=$address"`~~

经测试,修改不是必要
