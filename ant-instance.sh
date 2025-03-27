#!/bin/bash
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
yum install -y iptables-services
systemctl start iptables
systemctl enable iptables
iptables -F
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
service iptables save
