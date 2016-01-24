#!/bin/sh

sudo ip6tables-restore < /etc/ip6tables.firewall.rules
sudo iptables-restore < /etc/iptables.firewall.rules
