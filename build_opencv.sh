#!/bin/bash

set -e

wget -O opencv.zip https://github.com/opencv/opencv/archive/master.zip

unzip opencv.zip

mkdir opencv-build 

cd opencv-build
 
cmake ../opencv-master

make -j20

make install
