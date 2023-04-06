#!/bin/sh
mytitle="Start script TCP & UDP scan"
echo -e '\033'$mytitle'\033\\'
rm *.out *.gnmap *.xml *.nmap
echo "---------------------------"
read -p " Enter The target company Name:" client
if [ "$client" == 0 ]; then
read -p " Enter The target Domain Name:" client
fi
echo "-----------------------------"
echo "Performing Info Gathering"
echo "-----------------------------"
gnome-terminal -- ./infogathering.sh &&
#./infogathering.sh &&
echo "-----------------------------"
echo "Performing Whois"
echo "-----------------------------"
./whois.sh &&
for ip in 'ip.txt'
do
echo "-----------------------------"
echo "Performing Reverse-Lookup"
echo "-----------------------------"
cat ip.txt | while read ip; do dig +noall +answer -x $ip; done > reverse-lookup.out
echo "-----------------------------"
echo "Checking for live host"
echo "-----------------------------"
nmap -sn -iL $ip -oG live.out
cat live.out | grep "Status: Up" | cut -d " " -f 2 >liveip.out
echo "-----------------------------------------"
echo "Running UDP scan only open top 25 ports"
echo "-----------------------------------------"
gnome-terminal -- ./UDPscan.sh
#./UDPscan.sh &&
cat live.out | grep "Status: Up" | cut -d " " -f 2 >liveip.out
echo "-----------------------------------------"
echo "Checking for service & OS with A -sS & -Pn switch and vuln scrfipt"
echo "-----------------------------------------"
nmap -Pn -sV -sS -O -iL ip.txt --open --script vuln -oA service
echo "-----------------------------------------"
Sleep 10
echo "-----------------------------------------"
echo "----------------------------"
echo " Finding host with open port"
echo "----------------------------"
cat service.gnmap | grep "/open/" | cut -d " " -f 2 >openport.out
echo "--------------------------------"
echo " Finding host with filtered port"
echo "--------------------------------"
cat service.gnmap | grep "/filtered/" | cut -d " " -f 2 >filterport.out
echo "-------------------------------------"
echo " Finding host with open port 80 & 443"
echo "-------------------------------------"
cat service.gnmap | grep "80/open/tcp" | cut -d " " -f 2 >port80.out
cat service.gnmap | grep "443/open/tcp" | cut -d " " -f 2 >port443.out
echo "----------------------------"
echo "List of TCP ports found"
echo "----------------------------"
cat service.gnmap | grep "21/open/tcp" | cut -d " " -f 2 >port21.out
cat service.gnmap | grep "22/open/tcp" | cut -d " " -f 2 >port22.out
cat service.gnmap | grep "23/open/tcp" | cut -d " " -f 2 >port23.out
cat service.gnmap | grep "25/open/tcp" | cut -d " " -f 2 >port25.out
cat service.gnmap | grep "20/open/tcp" | cut -d " " -f 2 >port20.out
cat service.gnmap | grep "53/open/tcp" | cut -d " " -f 2 >port53.out
cat service.gnmap | grep "110/open/tcp" | cut -d " " -f 2 >port110-pop3.out
cat service.gnmap | grep "135/open/tcp" | cut -d " " -f 2 >port135.out
cat service.gnmap | grep "139/open/tcp" | cut -d " " -f 2 >port139.out
cat service.gnmap | grep "445/open/tcp" | cut -d " " -f 2 >port445.out
cat service.gnmap | grep "143/open/tcp" | cut -d " " -f 2 >port143-imap.out
cat service.gnmap | grep "500/open/tcp" | cut -d " " -f 2 >port500-vpn.out
cat service.gnmap | grep "161/open/tcp" | cut -d " " -f 2 >port161-snmp.out
cat service.gnmap | grep "995/open/tcp" | cut -d " " -f 2 >port995-pop3s.out
cat service.gnmap | grep "993/open/tcp" | cut -d " " -f 2 >port993-imaps.out
cat service.gnmap | grep "465/open/tcp" | cut -d " " -f 2 >port465-smtps.out
cat service.gnmap | grep "1720/open/tcp" | cut -d " " -f 2 >port1720-h323.out
cat service.gnmap | grep "1433/open/tcp" | cut -d " " -f 2 >port1433-mssql.out
cat service.gnmap | grep "3306/open/tcp" | cut -d " " -f 2 >port3306-mysql.out
cat service.gnmap | grep "1723/open/tcp" | cut -d " " -f 2 >port1723-pptp.out
cat service.gnmap | grep "3389/open/tcp" | cut -d " " -f 2 >port3389-rdp.out
cat service.gnmap | grep "5900/open/tcp" | cut -d " " -f 2 >port5900-vnc.out
cat service.gnmap | grep "5800/open/tcp" | cut -d " " -f 2 >port5800-vnc.out
cat service.gnmap | grep "8080/open/tcp" | cut -d " " -f 2 >port8080.out
cat service.gnmap | grep "8081/open/tcp" | cut -d " " -f 2 >port8081.out
cat service.gnmap | grep "8000/open/tcp" | cut -d " " -f 2 >port8000.out
cat service.gnmap | grep "5060/open/tcp" | cut -d " " -f 2 >port5060-sip.out
cat service.gnmap | grep "1723/open/tcp" | cut -d " " -f 2 >port1723-pptp.out
cat service.gnmap | grep "8443/open/tcp" | cut -d " " -f 2 >port8443.out

echo "--------------------------------------"
echo "Deleting empty files"
echo "--------------------------------------"
find -empty -type f -delete
echo "--------------------------------------"
echo "-----------------------------------------------------------------"
echo " Running scrying on host having port 80, 443, 8080, 8081, 3389, 5900"
echo "-----------------------------------------------------------------"
eyewitness --web --no-prompt -x service.xml --timeout 8 --max-retries 2 --threads 20 -d $client-Eye-screenshots
xvfb-run scrying --nmap service.xml --output $client-scrying-screenshots

echo " Running Whatweb"
whatweb --no-errors --url-prefix https:// --input-file=ip.txt >>whatweb.out
whatweb --no-errors --url-prefix http:// --input-file=ip.txt >>whatweb.out
#whatweb --input-file=port80.out >>whatweb.out
#whatweb --input-file=port8080.out >>whatweb.out
#whatweb --input-file=port8081.out >>whatweb.out
#whatweb --input-file=port443.out >>whatweb.out


echo "-------------------------------"
echo " Running Nmap discovery script"
echo "-------------------------------"
gnome-terminal -- ./Nmap-discovery.sh
#./Nmap-discovery.sh &&
#./Nmap-vuln.sh &&
echo "------------------------------------------------------------"
echo "Teasting FREAK vulnerability on host having port 80 and 443"
echo "------------------------------------------------------------"
gnome-terminal -- ./Freak.sh
echo "---------------------------------------------------------"
echo " Running SSLSCAN & TestSSL on host with port 443 & 3389"
echo "---------------------------------------------------------"
#testssl -iL parsed_xml.txt >>testssl.out
testssl --color 0 -iL service.gnmap >>testssl.out
./sslscan.sh &
#sslscan --targets=port8000.out --show-certificate >>sslscan.out &

 echo "-----------------------------------------------------------------"
 echo " Running Nikto and Hoppy on host having port 80, 443, 8080, 8081"
 echo "-----------------------------------------------------------------"
gnome-terminal -- ./Nikto.sh
gnome-terminal -- ./hoppy.sh
#./nikto.sh &&
#./hoppy.sh &&
echo "Running NMAP Vulnerability scan script-using Vulner DB"
#nmap -sS -sV --script=vulners --script-args mincvss=4.0 -iL ip.txt -oA vulners-scan.out 
echo "--------------------------------------------------------------------"
echo "Checking for TCP All Ports &  service & OS with A & -sV & -Pn switch"
echo "--------------------------------------------------------------------"
nmap -p1-65535 -sV -O -Pn -A -sS -iL ip.txt -d -oA fullportscan.out
echo "--------------------------------------"
echo "Deleting empty files"
echo "--------------------------------------"
find -empty -type f -delete
echo "--------------------------------------"
echo "Checking Services for Other Tests like sshaudit, enum4linux, ike-scan etc"
echo "--------------------------------------"

[[ -f port22.out ]] && ./sshaudit.sh
[[ -f VPNU500.out ]] && ./vpn-scan.sh
[[ -f port445.out ]] && ./enum4linux.sh
#gnome-terminal -- ./sshaudit.sh
#gnome-terminal -- ./vpn-scan.sh
#gnome-terminal -- ./enum4linux.sh
echo "--------------------------------------"
find -empty -type f -delete
echo "--------------------------------------"
done
