#!/bin/bash

#Variables
export SOURCE_PATH=$HOME/Documents/freeflyer
export ANDROID_PATH="${SOURCE_PATH}_android"
export INSTALL_PATH="${SOURCE_PATH}_install/native"
export BUILD_PATH="${SOURCE_PATH}_build/native"

#Update repos
cd $SOURCE_PATH
git pull
cd $ANDROID_PATH
git pull

#Rebuild dependencies 
pushd $SOURCE_PATH
cd scripts/setup
./add_ros_repository.sh
cd debians
./build_install_debians.sh
cd ../
./install_desktop_16_04_packages.sh
popd

#Configure build
pushd $SOURCE_PATH
./scripts/configure.sh -l -F -D -p $INSTALL_PATH -b $BUILD_PATH
popd

#Building the code
pushd $BUILD_PATH
make -j2
popd