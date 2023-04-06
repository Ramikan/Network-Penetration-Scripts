#! /bin/bash
rm harvester-* fierce.out
echo "---------------------------"
echo "Info Gethering Stage"
echo "---------------------------"
read -p " Enter The target Domain Name:" company
if [ "$company" == 0 ]; then
read -p " Enter The target Domain Name:" company
fi
echo "---------------------------"
echo "Performing Harvester"
echo "---------------------------"
theHarvester -d $company -l 500 -b yahoo > harvester-yahoo.out
theHarvester -d $company -l 500 -b bing  >harvester-bing.out
theHarvester -d $company -l 500 -b linkedin  >harvester-linkedin.out
theHarvester -d $company -l 500 -b google  >harvester-google.out
echo "---------------------------"
echo "Performing Fierce"
echo "---------------------------"
fierce --domain $company --dns-server 8.8.8.8 --subdomain-file /usr/share/seclists/Discovery/DNS/sortedcombined-knock-dnsrecon-fierce-reconng.txt --wide >fierce.out

echo "Infogathering Done"
done
