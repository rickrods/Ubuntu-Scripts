# Ubuntu Things

- Ubuntu Config Files - 22.04

#### SSH  - hardened   
```wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/sshd_config && systemctl restart sshd```

#### System Journal     
```wget -O /etc/systemd/journald.conf https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/journalctl.conf && systemctl restart systemd-journald```

#### System Limits - reboot to apply  
```wget -O /etc/systemd/system.conf https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/system.conf```

#### NTP
```wget -O /etc/systemd/timesyncd.conf https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/timesyncd.conf && systemctl restart systemd-timesyncd```

#### User limits
```wget -O /etc/systemd/timesyncd.conf https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/user.conf && systemctl restart systemd-user-sessions.service```
