#!/bin/bash
set -e

# this path is used by the scripts, and everything is executed
# relative to this path, so set it to the submodule root
export REAL_TRAVIS_BUILD_DIR=$TRAVIS_BUILD_DIR
export TRAVIS_BUILD_DIR=$REAL_TRAVIS_BUILD_DIR/libheif

# this variable are used to determine what is built?
export WITH_LIBDE265=1
export WITH_X265=1
export WITH_GRAPHICS=1

cd $TRAVIS_BUILD_DIR
echo "pwd = $(pwd)"

# build scripts from libheif travis build
./scripts/install-ci-linux.sh
./scripts/prepare-ci.sh
./scripts/run-ci.sh

cd $REAL_TRAVIS_BUILD_DIR
