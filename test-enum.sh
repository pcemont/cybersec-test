#!/bin/bash

echo "What's the IP of the target machine?"
read varIP

sudo apt update
sudo apt install ffuf -y
apt install gobuster -y

git clone https://github.com/vulnersCom/nmap-vulners
mv /root/nmap-vulners/vulners.nse /usr/share/nmap/scripts

git clone https://github.com/21y4d/nmapAutomator.git
sudo ln -s $(pwd)/nmapAutomator/nmapAutomator.sh /usr/local/bin/
cd nmapAutomator
./nmapAutomator.sh --host $varIP --type All
