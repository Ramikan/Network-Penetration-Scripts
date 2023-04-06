#! /bin/sh
mytitle="SSL scan"
echo -e '\033k'$mytitle'\033\\'
rm sslscan.out
for ip in $(cat port8080.out); do
       sslscan --no-colour --show-certificate $ip:8080 >>sslscan-8080.out
done
for ip in $(cat port8081.out); do
       sslscan --no-colour --show-certificate $ip:8081 >>sslscan-8081.out
done

for ip in $(cat port443.out); do
       sslscan --no-colour --show-certificate $ip >>sslscan-443.out
done

for ip in  $(cat port21.out); do
        sslscan --starttls-ftp --no-colour --show-certificate  $ip:21 >sslscan-21.out 
done

for ip in  $(cat port25.out); do
        sslscan --starttls-smtp --no-colour --show-certificate  $ip:25  >sslscan-25.out
done

for ip in  $(cat port110.out); do
        sslscan --starttls-pop3 --no-colour --show-certificate $ip:110 >sslscan-110.out
done

for ip in  $(cat port1433.out); do
        sslscan --starttls-mysql --no-colour --show-certificate $ip:1433 >sslscan-1433.out
done

for ip in  $(cat port3389-rdp.out); do
        sslscan --rdp --no-colour --show-certificate $ip:3389 >sslscan-3389.out &
done

for ip in $(cat port8000.out); do
       sslscan --no-colour --show-certificate $ip:8000 >>sslscan-8000.out
done
for ip in $(cat port8443.out); do
       sslscan --no-colour --show-certificate $ip:8443 >>sslscan-8443.out
done
#find -empty -type f -delete
cat sslscan-* >>sslscan.out

