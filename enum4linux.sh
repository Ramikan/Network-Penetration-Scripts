#! /bin/sh
mytitle="Enum4linux"
echo -e '\033k'$mytitle'\033\\'

for ip in $(cat port135.out); do

       enum4linux $ip >>enum4linux-135.out
done
for ip in $(cat port139.out); do

       enum4linux $ip >>enum4linux-139.out
done

for ip in $(cat port445.out); do

        enum4linux $ip >>enum4linux-445.out
done


