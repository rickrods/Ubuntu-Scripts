# Ubuntu Config Files - 22.04

#### SSH  - hardened   
```sudo wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/sshd_config && sudo systemctl restart sshd```

#### System Journal     
```sudo wget -O /etc/systemd/journald.conf https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/journalctl.conf && sudo systemctl restart systemd-journald```

#### System Limits - reboot to apply  
```sudo wget -O /etc/systemd/system.conf https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/system.conf```



