#!/bin/bash

# Update minimal install
sudo apt update && sudo apt upgrade -y
sudo apt install git curl wget zip unzip lz4 gzip bzip2 nano htop iotop nmon nload net-tools whois bash-completion software-properties-common apt-transport-https ca-certificates libssl-dev openssl apt-utils jq mlocate dialog -y

# Update configs
sudo wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/sshd_config && sudo systemctl restart sshd
sudo wget -O /etc/systemd/journald.conf https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/journalctl.conf && sudo systemctl restart systemd-journald
sudo wget -O /etc/systemd/system.conf https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/system.conf



