#!/usr/bin/env bash

rm -rf includes
mkdir includes
mkdir includes/install includes/build_opencv
cd includes
git clone -q -b 4.2.0 --depth 1 git@github.com:opencv/opencv.git
git clone -q -b 4.2.0 --depth 1 git@github.com:opencv/opencv_contrib.git
cd build_opencv
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=../install \
      -D INSTALL_C_EXAMPLES=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ../opencv

export CPUS=$(expr "$(nproc)" / 2)
make -j $CPUS
make install
