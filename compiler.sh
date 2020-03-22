#!/bin/sh

CURR_PWD=$PWD
BUILD_PATH=out
TOOLCHAIN_FILE=$PWD/toolchain.cmake
LIBUSB_PATH=libusb/

if [ ! -d $BUILD_PATH ]; then
    mkdir -p $BUILD_PATH
fi

if [ ! -f $LIBUSB_PATH/config.h ]; then
    cd $LIBUSB_PATH
    ./autogen.sh
    cd -
fi

cd $BUILD_PATH

cmake ../ -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_FILE -GNinja
ninja
cd -
