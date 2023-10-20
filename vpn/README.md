# Setup Openvpn Quickly

1. Launch hetzner cloud 2cpu machine.
2. Paste the contents of cloud config file in this folder in the cloud-init box.
3. Build machine.
4. When you log in execute the following to setup.
   ```
   su vpn && cd ~ && ./openvpn_setup.sh
   ```
