#!/bin/bash

s=$(printf "%-80s" "*")

normal=`echo -en "\e[0m"`
red=`echo -en "\e[31m"`
green=`echo -en "\e[32m"`
blue=`echo -en "\e[34m"`

# OS/KERNEL-INFO
echo "${red}${s// /*}"
echo "${green}OS/KERNEL-INFO${normal}"
cat /etc/issue
cat /etc/*-release
cat /etc/lsb-release    
cat /etc/redhat-release
echo "${red}${s// /*}"

#apps and services ROOT
echo "${green}Apps and Services ROOT${normal}"

ps aux | grep root
ps -ef | grep root
echo "${red}${s// /*}"


# What sensitive files can be found?
echo "${green}Sensitive files${normal}"

cat /etc/passwd
cat /etc/group
cat /etc/shadow
ls -alh /var/mail/
echo "${red}${s// /*}"

#Any plain text usernames and/or passwords?
echo "${green}Plain text usernames/passwords${normal}"

grep -i user [filename]
grep -i pass [filename]
grep -C 5 "password" [filename]
find . -name "*.php" -print0 | xargs -0 grep -i -n "var $password"   # Joomla
echo "${red}${s// /*}"

#List home directories
echo "${green}Home directories${normal}"

ls -ahlR /root/
ls -ahlR /home/
echo "${red}${s// /*}"

# SSH info
echo "${green}SSH INFO${normal}"
cat ~/.ssh/authorized_keys
cat ~/.ssh/identity.pub
cat ~/.ssh/identity
cat ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa
cat ~/.ssh/id_dsa.pub
cat ~/.ssh/id_dsa
cat /etc/ssh/ssh_config
cat /etc/ssh/sshd_config
cat /etc/ssh/ssh_host_dsa_key.pub
cat /etc/ssh/ssh_host_dsa_key
cat /etc/ssh/ssh_host_rsa_key.pub
cat /etc/ssh/ssh_host_rsa_key
cat /etc/ssh/ssh_host_key.pub
cat /etc/ssh/ssh_host_key
echo "${red}${s// /*}"