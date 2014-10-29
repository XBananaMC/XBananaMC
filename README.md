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
comes later... 
First have a look at install.sh
