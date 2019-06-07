#!/bin/bash

#Installing NS-2.35
sudo apt-get install build-essential
sudo apt-get install tcl8.4 tcl8.4-dev
sudo apt-get install tk8.4-dev
sudo apt-get install libxmu-dev
tar -xvzf  ns-allinone-2.35.tar.gz
cd ns-allinone-2.35
cp ../ls.h ./linkstate/
./install


#Installing gnu plot
#sudo apt install gnuplot


