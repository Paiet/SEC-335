#!/bin/bash

read -p "Please input the first 3 octets of the network you would like to lookup: " subnet

read -p "Please input the IP of the DNS server: " serverip

echo "DNS resolution for $subnet.0:"

for i in $(seq 1 255); do
    
    #grep -v hides text. -e ^$ seaches for empty lines and removes them, lines with NSDOMAIN are also removed
    timeout .5 bash -c "nslookup $subnet.$i $serverip" 2>&1 | grep -v -e '^$' -e 'NXDOMAIN'

done
