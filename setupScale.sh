#!/bin/sh


if [ "$(id -u)" != "0" ]; then
  echo "Sudo privs needed for the tool installation " 
	exit 1
fi

echo "*********************************************"
echo "* cloning repository " 
echo "*********************************************"
git clone --branch v0.1 https://github.com/guillep/Scale /tmp/scale 
cd /tmp/scale
echo "*********************************************"
echo "* building scale image  " 
echo "*********************************************"
./build/build.sh
echo "*********************************************"
echo "* checking if there is any old installation " 
echo "*********************************************"
./build/scale-bootstrap build/uninstall.st
echo "*********************************************"
echo "* Copying files!  " 
echo "*********************************************"
./build/scale-bootstrap build/install.st
echo "*********************************************"
echo "* Cleaning the mess :)   " 
echo "*********************************************"
rm /tmp/scale -rf


