#! /bin/bash
mytitle="Nmap Vuln scan"
echo -e '\033k'$mytitle'\033\\'
echo "---------------------------------------------"
echo "Running nmap vulnerability scan only "
echo "---------------------------------------------"
nmap -sS -sV --script vuln -iL ip.txt -oA vuln
#cp vuln.* /output
