#!/bin/bash

cd ns-allinone-2.35

#Patching CAPS-dark 
cp ../CAPS-dark.patch ./
patch -p5 < CAPS-dark.patch

#Compiling NS2
cd ns-2.35
sudo make

