#!/bin/bash

# This script will create an ssl certificate that can be used with haproxy.
# It also will schedule a job every 10 days to ensure any changes to the cert file are available to haproxy without user intervention.

echo "Please enter your fully qualified domain name or a comma seperated list of domains"
read DOMAIN
echo "Please enter your email address"
read EMAIL


sudo apt update && sudo apt upgrade -y

# Install NGINX for letsencrypt
sudo apt install snapd nginx -y

# Install certbot
sudo snap install certbot --classic

# Request cert 
certbot certonly -d $DOMAIN --non-interactive --agree-tos --email $EMAIL --nginx

sudo mkdir -p /etc/ssl/"$DOMAIN"
sudo bash -c "cat /etc/letsencrypt/live/"$DOMAIN"/fullchain.pem /etc/letsencrypt/live/"$DOMAIN"/privkey.pem > /etc/ssl/"$DOMAIN"/"$DOMAIN".pem"

# Create a script to combine certificate files
sudo touch /opt/scripts/update-certs.sh
sudo cat > /opt/scripts/update-certs.sh <<EOF
sudo bash -c "cat /etc/letsencrypt/live/"$DOMAIN"/fullchain.pem /etc/letsencrypt/live/"$DOMAIN"/privkey.pem > /etc/ssl/"$DOMAIN"/"$DOMAIN".pem"
sudo service haproxy reload
EOF
sudo chmod +x /opt/scripts/update-certs.sh

# Cron job every 10 days
sudo (crontab -l 2>/dev/null; echo "0 18 */10 * * root bash /opt/scriptsupdate-certs.sh") | crontab -
