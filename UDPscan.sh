#! /bin/bash
mytitle="UDP scan"
echo -e '\033k'$mytitle'\033\\'
rm UDPopen.out udpport.out.* UPfiltered.out
echo "-----------------------------------------"
echo "Running UDP scan only open top 50 ports"
echo "-----------------------------------------"
nmap -sU --top-port 50 --open --script vuln -iL ip.txt -oA udpport.out
cat udpport.out.gnmap | grep "/open/" | cut -d " " -f 2 >>UPDopen.out
cat udpport.out.gnmap | grep "/open|filtered/" | cut -d " " -f 2 >>UPfiltered.out

echo "Scanning IP addresses of open TFTP"
cat udpport.out.gnmap | grep "69/open/udp/" | cut -d " " -f 2 >> TFTP69.out
cat udpport.out.gnmap | grep "69/open|filtered/udp/" | cut -d " " -f 2 >> TFTP69f.out

echo "Scanning IP addresses of open DNS"
cat udpport.out.gnmap | grep "53/open/udp/" | cut -d " " -f 2 >> DNSU53.out

echo "Scanning IP addresses of open SNMP"
cat udpport.out.gnmap | grep "161/open|filtered/udp/" | cut -d " " -f 2 >> SNMPU161f.out
cat udpport.out.gnmap | grep "161/open/udp/" | cut -d " " -f 2 >> SNMPU161.out

echo "Scanning IP addresses of open NTP"
cat udpport.out.gnmap | grep "123/open/udp" | cut -d " " -f 2 >> NTP123.out
cat udpport.out.gnmap | grep "123/open|filtered/udp/" | cut -d " " -f 2 >> NTP123f.out

echo "Scanning IP addresses of open RPCBIND"
cat udpport.out.gnmap | grep "111/open/udp" | cut -d " " -f 2 >> RPCBIND111.out

echo "Scanning IP addresses of open NFS 2049"
cat udpport.out.gnmap | grep "2049/open/udp" | cut -d " " -f 2 >> NFS2049.out

echo "Scanning IP addresses of open NFS 2048"
cat udpport.out.gnmap | grep "2048/open/udp" | cut -d " " -f 2 >> NFS2048.out

echo "Scanning IP addresses of open MSSQL 1434"
cat udpport.out.gnmap | grep "1434/open/udp" | cut -d " " -f 2 >> MSSQLU1434.out

echo "Scanning IP addresses of open VPN 500/1194"
cat udpport.out.gnmap | grep "500/open/udp" | cut -d " " -f 2 >> VPNU500.out
cat udpport.out.gnmap | grep "1194/open/udp" | cut -d " " -f 2 >> VPNU1194.out

echo "Scanning IP addresses of open Netbiod 137,138"
cat udpport.out.gnmap | grep "137/open|filtered/udp/" | cut -d " " -f 2 >> NETBIOSU137f.out
cat udpport.out.gnmap | grep "137/open/udp" | cut -d " " -f 2 >> NETBIOSU137.out
cat udpport.out.gnmap | grep "138/open|filtered/udp/" | cut -d " " -f 2 >> NETBIOSU138f.out
cat udpport.out.gnmap | grep "138/open/udp/" | cut -d " " -f 2 >> NETBIOSU138.out
sleep 2
#find -empty -type f -delete
