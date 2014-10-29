#!/bin/bash

# this script is forked from http://svn.stmlabs.com/svn/raspbmc/patches/nightly_scripts/create_tarball.sh thanks to Sam Nazarko
# Script of RaspBMC!!
# free Software, licensed under GNU

# splash / changed to LeMedia Splash
wget http://download.raspbmc.com/downloads/bin/xbmc/RaspbmcLogo_small.png -O /opt/xbmc-bcm/xbmc-bin/share/xbmc/media/Splash.png

# Settings App / change!!!!
wget http://download.raspbmc.com/downloads/bin/xbmc/raspbmc-plugin.tar.gz

# Browser App / maybe delete, maybe not
wget http://download.raspbmc.com/downloads/bin/xbmc/browser-plugin.tar.gz

wget http://svn.stmlabs.com/svn/raspbmc/patches/hama_mce.xml -O /opt/xbmc-bcm/xbmc-bin/share/xbmc/system/keymaps/hama_mce.xml

#CEC Client / test our one, maybe change to it...
wget http://download.raspbmc.com/downloads/bin/cec-client -O /opt/xbmc-bcm/xbmc-bin/bin/cec-client
chmod +x /opt/xbmc-bcm/xbmc-bin/bin/cec-client


#wget http://www.mirrorservice.org/sites/raspbmc.com/downloads/bin/xbmc/skin.confluence.raspbmc.zip
#unzip skin.confluence.raspbmc.zip -d /opt/xbmc-bcm/xbmc-bin/share/xbmc/addons
#rm skin.confluence.raspbmc.zip
#mv /opt/xbmc-bcm/xbmc-bin/share/xbmc/addons/skin.confluence /opt/xbmc-bcm/xbmc-bin/share/xbmc/addons/skin.confluence.classic
#ln -s /opt/xbmc-bcm/xbmc-bin/share/xbmc/addons/skin.confluence.raspbmc /opt/xbmc-bcm/xbmc-bin/share/xbmc/addons/skin.confluence
#sed -e 's/id="skin.confluence"/id="skin.confluence.classic"/' -i /opt/xbmc-bcm/xbmc-bin/share/xbmc/addons/skin.confluence.classic/addon.xml
#wget http://svn.stmlabs.com/svn/raspbmc/patches/xbmc-eventclient-hama-mce/remote.xml -O /opt/xbmc-bcm/xbmc-bin/share/xbmc/system/keymaps/hama_mce.xml
tar -xzf raspbmc-plugin.tar.gz -C /opt/xbmc-bcm/xbmc-bin/share/xbmc/addons
rm raspbmc-plugin.tar.gz
tar -xzf browser-plugin.tar.gz -C /opt/xbmc-bcm/xbmc-bin/share/xbmc/addons
rm browser-plugin.tar.gz
cd /opt/xbmc-bcm/xbmc-bin/lib/xbmc/system
echo Manually installing libraries
wget http://download.raspbmc.com/downloads/bin/lib/librtmp.so.0.hardfp -O librtmp.so.0
wget http://download.raspbmc.com/downloads/bin/lib/libnfs.so.1.0.3.hardfp -O libnfs.so.1.0.3
wget http://download.raspbmc.com/downloads/bin/lib/libafpclient.so.0.0.0.hardfp -O libafpclient.so.0.0.0
wget http://download.raspbmc.com/downloads/bin/lib/libbluray.so.1.0.0.hardfp -O libbluray.so.1.0.0
wget http://download.raspbmc.com/downloads/bin/lib/libmp3lame.so.0.0.0.hardfp -O libmp3lame.so.0.0.0
wget http://download.raspbmc.com/downloads/bin/lib/libtag.so.1.12.0 -O libtag.so.1.12.0
wget http://download.raspbmc.com/downloads/bin/lib/libcec.so.2.0.1
# deactivate shairport, because of using rPlay
# wget http://download.raspbmc.com/downloads/bin/lib/libshairplay.so.0.0.0
wget http://download.raspbmc.com/downloads/bin/lib/libcurl.so.4.2.0
wget http://download.raspbmc.com/downloads/bin/lib/libdvdcss.so.2.1.0
wget http://download.raspbmc.com/downloads/bin/lib/libssh2.so.1.0.1
ln -sf libnfs.so.1.0.3 libnfs.so.1
ln -sf libnfs.so.1 libnfs.so
ln -sf libafpclient.so.0.0.0 libafpclient.so.0
ln -sf libafpclient.so.0 libafpclient.so
ln -sf librtmp.so.0 librtmp.so
ln -sf libbluray.so.1.0.0 libbluray.so.1.0
ln -sf libbluray.so.1.0 libbluray.so.1
ln -sf libmp3lame.so.0.0.0 libmp3lame.so.0.0
ln -sf libmp3lame.so.0.0 libmp3lame.so.0
ln -sf libtag.so.1.12.0 libtag.so.1.0
ln -sf libtag.so.1.0 libtag.so.1
ln -sf libcec.so.2.0.1 libcec.so.2
ln -sf libcec.so.2 libcec.so
# deactivate shairport, because of using rPlay
# ln -sf libshairplay.so.0.0.0 libshairplay.so.0
# ln -sf libshairplay.so.0 libshairplay.so
ln -sf libcurl.so.4.2.0 libcurl.so.4
ln -sf libcurl.so.4 libcurl.so.3
ln -sf libcurl.so.3 libcurl.so
ln -sf libdvdcss.so.2.1.0 libdvdcss.so.2
ln -sf libdvdcss.so.2 libdvdcss.so
ln -sf libssh2.so.1.0.1 libssh2.so.1
# install rplay / maybe we make own one
# have a look at install.sh

# try to get that working for Banana Pi Firmware:
# wget --no-check-certificate https://github.com/raspberrypi/firmware/tarball/master
# tar -xzf master
# rm master
# FWDIR=$(ls | grep raspberrypi-firmware-*)
# echo $FWDIR
# cp -R $FWDIR/hardfp/opt/vc/lib/* .
# rm -rf $FWDIR
wget http://svn.stmlabs.com/svn/raspbmc/patches/nightly_scripts/build-pvr.sh
sh build-pvr.sh
rm -rf /tmp/*
rm /opt/xbmc-bcm/xbmc-bin/lib/xbmc/system/build-pvr.sh
cd /opt/
tar -czf xbmc-rbp-$(date +%Y%m%d).tar.gz xbmc-bcm
md5sum xbmc-rbp-$(date +%Y%m%d).tar.gz > xbmc-rbp-$(date +%Y%m%d).md5
rm -rf xbmc-bcm
