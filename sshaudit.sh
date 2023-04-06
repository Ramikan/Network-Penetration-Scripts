#!/bin/bash
mytitle="SSHscan" echo -e '\033k'$mytitle'\033\\'
rm sshaudit.out
for ip in $(cat port22.out); do
echo "Audting $ip">>sshaudit.out
ssh-audit $ip >>sshaudit.out
echo "-----------------------$ip-Done-------------------------">>sshaudit.out
echo "-------------------$ip Completed-----------------">>sshaudit.out
done
