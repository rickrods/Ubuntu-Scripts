#!/bin/bash

# Allow loopback in
iptables -A INPUT -i lo -j ACCEPT
# Allow Related, Established, and DNAT connections
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED,DNAT -j ACCEPT
# SSH and DNS TCP
iptables -A INPUT -p tcp -m multiport --ports 22,53 -m comment --comment "SSH/DNS" -j ACCEPT
# NTP and DNS UDP
iptables -A INPUT -p udp -m multiport --ports 123,53 -m comment --comment "NTP/DNS" -j ACCEPT
# Allow loopback out
iptables -A OUTPUT -o lo -j ACCEPT
# Allow NEW,UNTRACKED, RELATED,ESTABLISHED,and DNAT connections
iptables -A OUTPUT -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED,DNAT -j ACCEPT
