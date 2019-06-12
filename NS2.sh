#!/bin/bash

#Installing NS-2.35
sudo apt-get update && sudo apt-get install vim
sudo apt-get install libx11-dev
sudo apt-get install build-essential
sudo apt-get install tcl8.4 tcl8.4-dev
sudo apt-get install tk8.4-dev
sudo apt-get install libxmu-dev libxmu-headers
tar -xvzf  ns-allinone-2.35.tar.gz
cd ns-allinone-2.35
cp ../ls.h  ./ns-2.35/linkstate/
./install


#Installing gnuplot
#sudo apt install gnuplot


