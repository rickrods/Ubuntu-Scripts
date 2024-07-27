#!/bin/bash

echo "Enter the swapfile size. example = 2G"
read SWAPSIZE
sudo fallocate -l $SWAPSIZE /swapfile
sudo chmod 0600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show

echo "Swapfile setup is complete"
