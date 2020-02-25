#!/bin/sh

# install jool
echo "-- install the tools need to build jool.........."
sudo apt -y install raspberrypi-kernel-headers dkms libxtables-dev libnl-genl-3-dev build-essential pkg-config libtool-bin

# make jool
echo "-- make and install jool.........."
cd
git clone https://github.com/NICMx/Jool.git
cd Jool/
./autogen.sh
./configure
make
sudo make install
sudo dkms install .

echo "-- done."

exit 0
