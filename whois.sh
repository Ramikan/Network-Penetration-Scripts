#!/bin/sh
rm  whois.out
cat /usr/gk/tools/my-nmap/ip.txt | xargs -I% curl http://ipinfo.io/% >>whois.out

for ip in $(cat ip.txt); do
whois $ip>>whois-long.out
done
