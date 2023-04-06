#! /bin/sh
mytitle="VPN-IKE scan"
echo -e '\033k'$mytitle'\033\\'
echo -e  "-------------------------------------------------------------------------------------" >>ike-scan.out
echo -e  "                                  IKER Result" >>ike-scan.out
echo -e  "-------------------------------------------------------------------------------------" >>ike-scan.out

for ip in $(cat VPNU500.out); do

        python /usr/gk/tools/iker/iker.py $ip >>ike-scan.out
done
echo -e  "-------------------------------------------------------------------------------------" >>ike-scan.out
echo -e  "                                  IKE-SCAN Result" >>ike-scan.out
echo -e  "-------------------------------------------------------------------------------------" >>ike-scan.out
for ip in $(cat VPNU500.out); do

        ike-scan -M -A -id=admin $ip >>ike-scan.out
done


