#!/bin/bash
set -e

build_target="$1"

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

function copyJs() {
  cp libheif/libheif.js dist/libheif.js
  cp libheif/libheif.d.ts dist/libheif.d.ts
  cp libheif/COPYING dist/LICENSE

  assertFile dist/libheif.js
  assertFile dist/libheif.d.ts
  assertFile dist/LICENSE

  chown $(whoami) dist/libheif.js dist/LICENSE
}

function copyWasm() {
  copyJs

  cp libheif/libheif.wasm dist/libheif.wasm
  assertFile dist/libheif.wasm
  chown $(whoami) dist/libheif.wasm
}

if [ "$build_target" = "js" ]
then
  copyJs
elif [ "$build_target" = "wasm" ]
then
  copyWasm
else
  echo "unknown build target: $build_target"
  exit 1
fi

ls -la dist
