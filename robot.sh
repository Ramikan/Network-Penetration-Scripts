#! /bin/sh
mytitle="ROBOT Vulnerabity Scan"
echo -e '\033k'$mytitle'\033\\'

for ip in $(cat port443.out); do

	robot-detect $ip >>ROBOT.out
done

