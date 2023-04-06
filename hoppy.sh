#!/bin/sh
mytitle="Hoppy scan"
echo -e '\033k'$mytitle'\033\\'
rm hoppy80.out hoppy443.out hoppy.out
echo "Running Hoppy on web applcaition "
for ip in $(cat parsed_xml.txt); do
./hoppy-1.8.1/hoppy -h $ip -4 >>hoppy.out
done

#echo "Running Hoppy on web applcaition on port 443"
#for ip in $(cat port443.out); do
#./hoppy-1.8.1/hoppy -h $ip -p 443 -4 >>hoppy443-1.out
#done

#echo "Running Hoppy on web applcaition on port 8080"
#for ip in $(cat port8080.out); do
#./hoppy-1.8.1/hoppy -h $ip -p 8080 -4 >>hoppy8080.out
#done

#echo "Running Hoppy on web applcaition on port 8081"
#for ip in $(cat port8081.out); do
#./hoppy-1.8.1/hoppy -h $ip -p 8081 -4 >>hoppy8081.out
#done
#echo "Running Hoppy on web applcaition on port 8443"
#for ip in $(cat port8443.out); do
#./hoppy-1.8.1/hoppy -h $ip -p 8443 -4 >>hoppy8443.out
#done
