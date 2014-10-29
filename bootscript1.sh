#!/bin/sh

#start cec listener
# https://github.com/Noahgie/raspbmc-hdmi-cec-xbmc-shutdown-script for more info
sh /usr/local/bin/cec_listener.sh

#load updates
bananian-update

# install XBMC on first boot
cd /home/xbmc
sh first-boot.sh
rm first-boot.sh

#start hardware acceleration
modprobe mali
