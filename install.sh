#!/bin/sh
# script executed at first boot
# thanks to Sam Nazarko http://www.raspbmc.com/wiki/technical/building-xbmc/

# load new packages
sudo apt-get update
sudo apt-get upgrade

# make dir
dialog --title "XBananaMC Installer" --infobox "Load XBMC from Github" 5 50
mkdir /home/xbmc/
cd /home/xbmc/
git clone https://github.com/xbmc/xbmc
mv xbmc installation

# patch source
dialog --title "XBananaMC Installer" --infobox "Load Patch" 5 50
wget http://svn.stmlabs.com/svn/raspbmc/patches/XBMC-hardfp/patch_xbmc.sh
sh patch_xbmc.sh

# build
dialog --title "XBananaMC Installer" --infobox "Build XBMC" 5 50
sh /tools/rbp/setup-sdk.sh
make -C /tools/rbp/depends/xbmc
cd installation
make -jX

# Packaging XBMC
wget https://github.com/Noahgie/XBMCScripts/blob/master/create_tarball.sh
make install
sh create_tarball.sh

# install rplay for AirPlay Mirroring
dialog --title "XBananaMC Installer" --infobox "Install rPlay for Airplay Mirroring(!)..." 5 50
sudo apt-get install libao-dev avahi-utils libavahi-compat-libdnssd-dev libva-dev youtube-dl
sudo youtube-dl –update
sudo apt-get -f install
wget -O rplay-1.0.1-armhf.deb http://www.vmlite.com/rplay/rplay-1.0.1-armhf.deb
sudo dpkg -i rplay-1.0.1-armhf.deb
# ask for license key at info@vmlite.com
# go to http://IPdesPi:7100/admin and set up rPlay

dialog --title "XBananaMC Installer" --infobox "Installation complete! Starting..." 5 50
# install build
sudo initctl stop xbmc
sudo tar -xzf xbmc-rbp*.tar.gz -C /opt
sudo initctl start xbmc
