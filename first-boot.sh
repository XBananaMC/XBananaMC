#!/bin/bash
# start dialog
dialog --title "Raspbmc Installer" --infobox "Setting up Raspbmc for first run..." 5 50

# regenate ssh keys
ssh-keygen -q -f /etc/ssh/ssh_host_key -N '' -t rsa1
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa -b 521

# install XBMC 
cd /home/xbmc
sh install.sh
rm install.sh

#install cec listener / maybe use original CEC Plugin, look how it works
# https://github.com/Noahgie/raspbmc-hdmi-cec-xbmc-shutdown-script for more info
cd /tmp
git clone https://github.com/Noahgie/raspbmc-hdmi-cec-xbmc-shutdown-script cec
cd cec
rm readme.md
cd /
mv /tmp/* /usr/local/bin
sudo chmod +x /usr/local/bin/cec_listener.* /usr/local/bin/new_listener.sh

echo -e "raspberry\nraspberry" | smbpasswd -a -s pi

reboot
sleep 999
