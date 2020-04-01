#!/bin/sh

# system update
echo "-- do apt update and apgrade.........."
sudo apt update && sudo apt -y upgrade

# install hostapd
echo "-- install hostapd.........."
sudo apt -y install hostapd
sudo systemctl unmask hostapd

# install radvd
echo "-- install radvd.........."
sudo apt -y install radvd

# install isc-dhcp-server
echo "-- install isc-dhcp-server.........."
sudo apt -y install isc-dhcp-server

# install unbound
echo "-- install unbound.........."
sudo apt -y install unbound

# backup original configuration files
echo "-- backup original configuration files.........."
sudo cp -p /etc/dhcp/dhcpd.conf /etc/dhcp/dhpcd.conf.orig
sudo cp -p /etc/dhcp/dhcpd6.conf /etc/dhcp/dhpcd6.conf.orig
sudo cp -p /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.orig

# install network utilities
echo "-- install network utilities.........."
sudo apt -y install ntpdate dnsutils tcpdump iftop git ethtool sipcalc bridge-utils

echo "-- done."

# reboot system now
echo -n "Would you like to reboot now? [Y/n]: "
read -r ANS

case $ANS in
  "" | [Yy]* )
    sync
    sudo reboot
    ;;
  * )
    echo "Reboot is required to make Jool."
    ;;
esac

exit 0
