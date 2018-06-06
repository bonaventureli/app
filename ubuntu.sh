#!/bin/bash
case ${1} in
	"a")
#sudo apt-get  update

#sudo vi /etc/NetworkManager/NetworkManager.conf
#sudo service network-manager restart

#sudo apt-get install vim

#sudo lshw -C network
#firfox https://wireless.wiki.kernel.org/en/users/Drivers/iwlwifi
#wget https://wireless.wiki.kernel.org/_media/en/users/drivers/iwlwifi-1000-ucode-128.50.3.1.tgz
#cd /home/andy/Downloads
#tar -zxvf iwlwifi-1000-ucode-128.50.3.1.tgz
#
#sudo mv /lib/firmware/iwlwifi-1000-5.ucode /lib/firmware/iwlwifi-1000-5.bak
#cd iwlwifi-1000-ucode-128.50.3.1
#cp iwlwifi-1000-3.ucode iwlwifi-1000-5.ucode
#sudo cp iwlwifi-1000-5.ucode /lib/firmware
#sudo modprobe -r iwlagn
#sudo modprobe iwlagn
mkdir /samba-ubuntu
#apt-get install make
#apt-get install g++
#apt-get install libghc-x11-dev
#apt-get install libgl1-mesa-dev
#apt-get install libglu1-mesa-dev
#apt-get install libghc-zlib-dev
#apt-get install libudev-dev
#apt-get install libusb-1.0-0-dev
#apt-get install terminator
#apt-get install git
#apt-get install cmake
#apt-get install libmagick++-dev
#apt-get install libboost1.63-dev
#apt-get install libyazpp-dev
#apt-get install libzip-dev
#apt-get install libghc-zlib-dev
#apt-get install libzip-dev
#apt-get install libdb5.3-stl-dev
#apt-get install libghc-bzlib-dev
#apt-get install libghc-zlib-dev
#apt-get install libzip4
#apt-get install libzipios++-dev
#apt-get install libyazpp6
#apt-get install libzzip-dev
#apt-get install zlib1g-dev
#apt-get install zlib1g
apt-get install libtar-dev
apt-get install libiw-dev
#AVR
apt-get install pathogen
apt-get install python-pip
pip install ino
apt-get -f install
apt-get install gcc-avr
	;;
    "alias")
(
cat << EOF
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
EOF
)>> /root/.bashrc
source /root/.bashrc
	;;
	"arduino")
	apt-get insall avrdude
	apt-get install arduino
	apt-get install arduino-core
	;;
	"ruby")
	gem install json -v '1.8.2' -V
	apt-get install ruby-dev
	bundle install
	gem install bundler
	;;
	"virtualbox")
	apt-get install virtualbox
	;;
	"network")
		apt-get install net-tools
	;;
    *)
	    apt autoremove
	;;
esac
