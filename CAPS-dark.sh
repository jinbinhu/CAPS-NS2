#!/bin/bash

chmod 777 *
#Installing
tar -xvzf  ns-allinone-2.35.tar.gz
cd ns-allinone-2.35
./install

#Patching
cp ../CAPS-dark.patch ./
patch -p5 < CAPS-dark.patch

#Compiling
cd ns-2.35
sudo make

