#!/bin/bash

tar -xvzf  ns-allinone-2.35.tar.gz
cd ns-allinone-2.35
./install

cp ../CAPS-dark.patch ./

patch -p5 < CAPS-dark.patch

cd ns-2.35
sudo make

