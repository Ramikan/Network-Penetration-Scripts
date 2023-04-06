#! /bin/sh
mytitle="Nikto scan"
echo -e '\033k'$mytitle'\033\\'

for ip in $(cat parsed_xml.txt); do

	nikto -no404 -C all -maxtime 1600s -host $ip >>nikto.out
done

