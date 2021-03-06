#!/bin/bash

ip=$1
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "${GREEN}---------------------Installing and updating---------------------\n"
printf "${NC}\n"

sudo apt install nmap -y
cd /usr/share/nmap/scripts
sudo git clone https://github.com/vulnersCom/nmap-vulners
cd
sudo apt install gobuster -y


printf "${GREEN}---------------------Starting NMAP scan---------------------\n"
printf "${NC}\n"
sudo nmap -sS -sV -O -p- -T5 --script vulners -oN nmapscan.txt $ip

printf "${GREEN}---------------------Starting Dirbuster scan---------------------\n"
printf "${NC}\n"
sudo gobuster dir -e -u http://$ip -w /usr/share/wordlists/dirb/common.txt
