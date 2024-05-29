#!/bin/bash

function download_files
{
  sudo wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/sshd_config
  sudo wget -O /etc/systemd/journald.conf https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/journalctl.conf
  sudo wget -O /etc/systemd/system.conf https://raw.githubusercontent.com/rickrods/Ubuntu-Scripts/main/configs/system.conf
  sudo wget -O /etc/banner https://raw.githubusercontent.com/ImStaked/Ubuntu-Scripts/main/configs/banner
}

function restart_services
{
  systemctl restart sshd 
  systemctl restart systemd-journald 
  systemctl daemon-reexec
}

download_files
restart_services
