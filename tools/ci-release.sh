#!/bin/bash

set -ex

CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $CUR_DIR/..
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCLANG_TIDY=ON \
      -DTESTS=ON \
      -DCOVERAGE=OFF \
      -GNinja \
      -S . -B build
cmake --build build
cmake --build build --target test
$CUR_DIR/check-format.sh
