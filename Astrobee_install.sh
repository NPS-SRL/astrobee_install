#!/bin/bash

#Variables
export SOURCE_PATH=$HOME/Documents/freeflyer
export ANDROID_PATH="${SOURCE_PATH}_android"
export INSTALL_PATH="${SOURCE_PATH}_install/native"
export BUILD_PATH="${SOURCE_PATH}_build/native"

#Copy source code
sudo apt-get install build-essential git
git clone https://github.com/nasa/astrobee.git $SOURCE_PATH
git clone https://github.com/nasa/astrobee_android.git $ANDROID_PATH

#Dependencies
pushd $SOURCE_PATH
cd scripts/setup
./add_ros_repository.sh
cd debians
./build_install_debians.sh
cd ../
./install_desktop_16_04_packages.sh
sudo rosdep init
rosdep update

#Fix permissions just in case
sudo rosdep fix-permissions
popd

#Configure build
pushd $SOURCE_PATH
./scripts/configure.sh -l -F -D -p $INSTALL_PATH -b $BUILD_PATH
popd

#Install a package that is apparently missing
sudo apt-get install libignition-math2-dev 

#Building the code
pushd $BUILD_PATH
make -j2
popd