#!/bin/sh

git clone https://github.com/guillep/Scale /tmp/scale 
cd /tmp/scale
./build/build.sh
sudo ./build/uninstall.st
sudo ./build/install.st


