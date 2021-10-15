sudo nmap 10.0.5.1-255 -p 53 -Pn --open -oG - | grep "/open" | awk '{ print $2 }' >> dns-servers.txt
