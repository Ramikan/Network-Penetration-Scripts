#!/bin/sh
mytitle="Freak vuln scan"
echo -e '\033k'$mytitle'\033\\'
echo -e "\e[1;32m----------------------------------------------------------\e[00m"
echo " Testing FREAK Vulnerability on port 443,3389,8080 "
echo -e "\e[1;32m----------------------------------------------------------\e[00m"
for ip in $(cat port443.out); do
openssl s_client -connect $ip:443 -cipher EXPORT | grep " Cipher    :" >>FREAK443.out
done
echo -e "\e[1;32m----------------------------------------------------------\e[00m"
echo " Check out the result @ FREAK443.out"
echo -e "\e[1;32m----------------------------------------------------------\e[00m"

for ip in $(cat port8080.out); do
openssl s_client -connect $ip:8080 -cipher EXPORT | grep " Cipher    :" >>FREAK8080.out
done
echo -e "\e[1;32m----------------------------------------------------------\e[00m"
echo " Check out the result @ FREAK8080.out"
echo -e "\e[1;32m----------------------------------------------------------\e[00m"
for ip in $(cat port3389-rdp.out); do
openssl s_client -connect $ip:3389 -cipher EXPORT | grep " Cipher    :" >>FREAK3389.out
done
echo -e "\e[1;32m----------------------------------------------------------\e[00m"
echo " Check out the result @ FREAK3389.out
echo -e "\e[1;32m----------------------------------------------------------\e[00m"
