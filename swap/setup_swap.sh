#!/bin/bash

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)."
  exit 1
fi

SWAP_FILE="/swapfile"

echo "Enter the swapfile size. example = 2G"
read SWAPSIZE
sudo fallocate -l "$SWAPSIZE" "$SWAP_FILE"
sudo chmod 0600 "$SWAP_FILE"
sudo mkswap "$SWAP_FILE"
sudo swapon "$SWAP_FILE"
sudo swapon --show

# 5. Append to /etc/fstab only if it doesn't already exist
if ! grep -q "$SWAP_FILE" /etc/fstab; then
    echo "$SWAP_FILE none swap defaults 0 0" | tee -a /etc/fstab
    echo "Swapfile successfully added to /etc/fstab."
else
    echo "Swapfile entry already exists in /etc/fstab."
fi

echo "Swapfile setup is complete"
