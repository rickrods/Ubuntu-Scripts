#!/bin/bash

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED,DNAT -j ACCEPT
iptables -A INPUT -p tcp -m multiport --ports 22,53 -m comment --comment "SSH/DNS" -j ACCEPT
iptables -A INPUT -p udp -m multiport --ports 123,53 -m comment --comment "NTP/DNS" -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED,DNAT -j ACCEPT
