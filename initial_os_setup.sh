#!/bin/bash

# Update minimal install
sudo apt update && sudo apt upgrade -y
sudo apt install git curl wget zip unzip lz4 gzip bzip2 nano htop iotop nmon nload net-tools whois bash-completion software-properties-common apt-transport-https ca-certificates libssl-dev openssl apt-utils jq mlocate dialog -y


