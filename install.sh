#!/bin/sh
# script executed at first boot
# thanks to Sam Nazarko http://www.raspbmc.com/wiki/technical/building-xbmc/

dialog --title "XBananaMC Installer" --infobox "Load XBMC from Github" 5 50
# make dir
mkdir /home/xbmc/
cd /home/xbmc/
git clone https://github.com/xbmc/xbmc
mv xbmc installation

dialog --title "XBananaMC Installer" --infobox "Load Patch" 5 50
# patch source
wget http://svn.stmlabs.com/svn/raspbmc/patches/XBMC-hardfp/patch_xbmc.sh
sh patch_xbmc.sh

dialog --title "XBananaMC Installer" --infobox "Build XBMC" 5 50
# build
sh /tools/rbp/setup-sdk.sh
make -C /tools/rbp/depends/xbmc
cd installation
make -jX

# Packaging XBMC
wget https://github.com/Noahgie/XBMCScripts/blob/master/create_tarball.sh
make install
sh create_tarball.sh

dialog --title "XBananaMC Installer" --infobox "Installation complete! Starting..." 5 50
# install build
sudo initctl stop xbmc
sudo tar -xzf xbmc-rbp*.tar.gz -C /opt
sudo initctl start xbmc
