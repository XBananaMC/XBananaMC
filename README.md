XBMC for Banana Pi
===========
The Banana Pi is a trademark of LeMaker, Shenzhen, China. It is a little singleboard with much more power as the Raspberry Pi. Unfortunatly there isn't a well working XBMC out there. So we build our own ;)

#### Installer Image ####
To take the users the work, we're working on an Installer Image. This installer Image downloads the newest version of XBMC and makes it working, so that the user don't have to do anything. Just Plug&Play!

#### Updater ####
Next to the Installer we're working on an updater. This updater is based on a script which gets executed on every boot, or when the user want, he can do it with the RaspBMC Settings App. It checks our downloadserver for Updates, and when there is a update, he downloads the new version and replace the old one. Before he make that step, he makes a backup, in case of something goes wrong.

#### RaspBMC Settings App ####
A success-factor of RaspBMC was its Settings App. About this Settings app you can manage your hole device. 
Start one of the packages like SMB, overclock the Pi or install a nighlty build.
We try to get this script working on the Banana Pi, too.

#### Scripts of RaspBMC ####
To get a perfect XBMC with hardware-acceleration, an auto-update-system, Airplay Mirroring and much more features we took some scripts of RaspBMC for Raspberry Pi and edited them.
RaspBMC is the work of Sam Nazarko!

#### Minimal Debian ####
"Under" our XBMC Installation is minimal Debian. The name of it is Bananian and it is developed by Nico Isenberg.
The Image supports hardware-acceleration and some very useful scripts to hold the image up-to-date.
https://www.bananian.org

Build it!
===========
Thanks to Sam Nazarko http://www.raspbmc.com/wiki/technical/building-xbmc/

#### First we have to update our packages ####
    sudo apt-get update
    sudo apt-get upgrade

#### Install XBMC to /home/xbmc/installation ####
    mkdir /home/xbmc/
    cd /home/xbmc/
    git clone https://github.com/xbmc/xbmc
    mv xbmc installation

#### Patch XBMC Source ####
    wget http://svn.stmlabs.com/svn/raspbmc/patches/XBMC-hardfp/patch_xbmc.sh
    sh patch_xbmc.sh

#### Install XBMC ####
    sh /tools/rbp/setup-sdk.sh
    make -C /tools/rbp/depends/xbmc
    cd installation
    make -jX
    wget https://github.com/Noahgie/XBMCScripts/blob/master/create_tarball.sh
    make install
    sh create_tarball.sh

#### Install rPlay for Airplay Mirroring(!) ####
    sudo apt-get install libao-dev avahi-utils libavahi-compat-libdnssd-dev libva-dev youtube-dl
    sudo youtube-dl –update
    sudo apt-get -f install
    wget -O rplay-1.0.1-armhf.deb http://www.vmlite.com/rplay/rplay-1.0.1-armhf.deb
    sudo dpkg -i rplay-1.0.1-armhf.deb
To use rPlay please send an E-Mail to info@vmlite.com and ask for a license key. Add this license key at http://IPdesPi:7100/admin. We are working on an own Settings App where you can add the license key in XBMC.

#### Start XBMC ####
    sudo initctl stop xbmc
    sudo tar -xzf xbmc-rbp*.tar.gz -C /opt
    sudo initctl start xbmc
