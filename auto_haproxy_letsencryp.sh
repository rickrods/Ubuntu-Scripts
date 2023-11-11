#!/bin/bash

# Snapd automatically handles renewing the certificate
echo "Please enter your fully qualified domain name or a comma seperated list of domains"
read DOMAIN

echo "Please enter your email address"
read EMAIL

sudo apt update && sudo apt upgrade -y
sudo apt install snapd nginx -y
snap install certbot --classic

certbot certonly -d $DOMAIN --non-interactive --agree-tos --email $EMAIL --nginx

sudo mkdir -p /etc/ssl/"$DOMAIN"

bash -c "cat /etc/letsencrypt/live/"$DOMAIN"/fullchain.pem /etc/letsencrypt/live/"$DOMAIN"/privkey.pem > /etc/ssl/"$DOMAIN"/"$DOMAIN".pem"


# Snap should renew the cert automatically
# Create Script that runs daily
touch /opt/update-certs.sh
cat > /opt/update-certs.sh <<EOF
bash -c "cat /etc/letsencrypt/live/"$DOMAIN"/fullchain.pem /etc/letsencrypt/live/"$DOMAIN"/privkey.pem > /etc/ssl/"$DOMAIN"/"$DOMAIN".pem"
service haproxy reload
EOF
chmod +x /opt/update-certs.sh

# Schedule script to run daily
touch /etc/cron.d/cert-update
echo "0 0 * * * root bash /opt/update-certs.sh" > /etc/cron.d/cert-update
