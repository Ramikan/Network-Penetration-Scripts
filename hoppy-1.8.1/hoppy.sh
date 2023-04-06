#!/bin/sh
rm *.out
echo "Running Hoppy on web applcaition on port 80"
for ip in $(cat ./port80.out); do
./hoppy-1.8.1/hoppy -h $ip -p 80 -4 >>hoppy80.out
done

echo "Running Hoppy on web applcaition on port 443"
for ip in $(cat ./port443.out); do
./hoppy-1.8.1/hoppy -h $ip -p 443 -4 >>hoppy443.out
done