#!/bin/bash

file="attackerIP.txt"

while IFS= read -r line
do
	echo "==============================================================================="
	echo ".....................Blocking Attacker IP --> "$line".................."
	echo "==============================================================================="
	iptables -A INPUT -s "$line" -p tcp --destination-port 80 -j DROP
	echo "..........................IP Address Blocked!!................................."
	echo "...........................Attack Mitigated!!.................................."
	echo "==============================================================================="
done <"$file"
