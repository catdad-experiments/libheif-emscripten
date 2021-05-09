#!/bin/bash
set -e

echoerr() { echo "$@" 1>&2; }

function assertFile {
  if [ ! -f "$1" ]; then
    echoerr "$1" does not exist
    exit 1
  fi
}

mkdir -p dist
rm -rf dist/*
cp libheif/libheif.js dist/libheif.js
cp libheif/COPYING dist/LICENSE

assertFile dist/libheif.js
assertFile dist/LICENSE

chown $(whoami) dist/libheif.js dist/LICENSE
ls -la dist
