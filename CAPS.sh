#!/bin/bash

cd ns-allinone-2.35

#Patching CAPS
cp ../CAPS.patch ./
patch -p5 < CAPS.patch   

#Compiling NS2
cd ns-2.35
sudo make

