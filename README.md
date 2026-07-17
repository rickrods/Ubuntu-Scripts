# Ubuntu Config Files 

#### Create Scripts Folder
```sudo mkdir -p /opt/scripts```

#### SSH (Security hardened) 
```sudo wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/sshd_config && sudo systemctl restart sshd```

#### System Journal (Performance tuned)
```sudo wget -O /etc/systemd/journald.conf https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/journalctl.conf && sudo systemctl restart systemd-journald```

#### SSH Login Banner 
```sudo wget -O /etc/banner https://raw.githubusercontent.com/ImStaked/Ubuntu-Scripts/main/configs/banner```

#### LetsEncrypt for Haproxy
```sudo wget -O /opt/scripts/letsencrypt.sh https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/refs/heads/main/haproxy/letsencrypt.sh```
```sudo chmod +x /opt/scripts/letsencrypt.sh && sudo bash /opt/scripts/letsencrypt.sh```

#### Setup Swap (interactive)
```sudo wget -o /opt/scripts/setup_swap.sh https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/refs/heads/main/swap/setup_swap.sh && sudo chmod +x /opt/scripts/setup_swap.sh && sudo bash /opt/scripts/setup_swap.sh```

