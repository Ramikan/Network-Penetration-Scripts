#! /bin/bash
mytitle="Nmap Discovery scan"
echo -e '\033k'$mytitle'\033\\'
echo "---------------------------------------------"
echo "Running nmap discovery,safe script scan only "
echo "---------------------------------------------"
nmap -sS -sV --script discovery,safe -iL ip.txt -oA nmap-safes-discoveryscript 

