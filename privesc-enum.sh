#!/bin/bash

s=$(printf "%-80s" "*")



# OS/KERNEL-INFO
echo "${s// /*}"
echo "OS/KERNEL-INFO"
cat /etc/issue
cat /etc/*-release
cat /etc/lsb-release    
cat /etc/redhat-release
echo "${s// /*}"

# apps and services
echo "Apps and Services NON-ROOT"
ps aux
ps -ef
top
cat /etc/services
echo "${s// /*}"

#apps and services ROOT
echo "Apps and Services ROOT"
ps aux | grep root
ps -ef | grep root
echo "${s// /*}"

#What applications are installed? What version are they? Are they currently running?
echo "Application status"
ls -alh /usr/bin/
ls -alh /sbin/
dpkg -l
rpm -qa
ls -alh /var/cache/apt/archivesO
ls -alh /var/cache/yum/
echo "${s// /*}"

# What sensitive files can be found?
echo "Sensitive files"
cat /etc/passwd
cat /etc/group
cat /etc/shadow
ls -alh /var/mail/
echo "${s// /*}"

#Any plain text usernames and/or passwords?
echo "Plain text usernames/passwords"
grep -i user [filename]
grep -i pass [filename]
grep -C 5 "password" [filename]
find . -name "*.php" -print0 | xargs -0 grep -i -n "var $password"   # Joomla
echo "${s// /*}"

#List home directories
echo "Home directories"
ls -ahlR /root/
ls -ahlR /home/
echo "${s// /*}"

# SSH info
echo "SSH INFO"
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
echo "${s// /*}"
