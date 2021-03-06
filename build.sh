#!/usr/bin/env bash

cmake \
  -DBUILD_PLUGIN_CPD=ON \
  -DBUILD_PLUGIN_MBIO=ON \
  -DBUILD_PLUGIN_GREYHOUND=ON \
  -DBUILD_PLUGIN_HEXBIN=ON \
  -DBUILD_PLUGIN_ICEBRIDGE=ON \
  -DBUILD_PLUGIN_MRSID=ON \
  -DBUILD_PLUGIN_NITF=ON \
  -DBUILD_PLUGIN_OCI=OFF \
  -DBUILD_PLUGIN_PCL=ON \
  -DBUILD_PLUGIN_PGPOINTCLOUD=OFF \
  -DBUILD_PLUGIN_SQLITE=OFF \
  -DBUILD_PLUGIN_RIVLIB=OFF \
  -DBUILD_PLUGIN_PYTHON=OFF \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DENABLE_CTEST=OFF \
  -DWITH_APPS=OFF \
  -DWITH_LAZPERF=ON \
  -DWITH_LASZIP=ON \
  -DWITH_TESTS=OFF \
  -DWITH_PDAL_JNI=OFF \
  -DBUILD_PLUGIN_MATLAB=OFF \
  -DMATLAB_FIND_DEBUG=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  .

make -j 4
make install
rm -rf /PDAL
