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

ls -la libheif

cp libheif/libheif.js dist/libheif.js
cp libheif/COPYING dist/LICENSE
cp libheif/libheif.wasm dist/libheif.wasm || echo wasm not found

assertFile dist/libheif.js
assertFile dist/LICENSE

chown $(whoami) dist/libheif.js dist/LICENSE
chown $(whoami) dist/libheif.wasm || echo wasm not found
ls -la dist
