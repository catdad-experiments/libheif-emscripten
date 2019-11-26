#!/bin/bash
set -e

# this path is used by the scripts, and everything is executed
# relative to this path, so set it to the submodule root
export REAL_TRAVIS_BUILD_DIR=$TRAVIS_BUILD_DIR
export TRAVIS_BUILD_DIR=$REAL_TRAVIS_BUILD_DIR/libheif

# this variable is used to determine the emscripten version to use
export EMSCRIPTEN_VERSION=1.37.26

cd $TRAVIS_BUILD_DIR
echo "pwd = $(pwd)"

# build scripts from libheif travis build
./scripts/install-ci-linux.sh
./scripts/prepare-ci.sh
./scripts/run-ci.sh

cd $REAL_TRAVIS_BUILD_DIR
