#!/bin/bash

#Installing
tar -xvzf  ns-allinone-2.35.tar.gz
cd ns-allinone-2.35
./install

#Patching
cp ../CAPS.patch ./
patch -p5 < CAPS.patch   

#Compiling
cd ns-2.35
sudo make

