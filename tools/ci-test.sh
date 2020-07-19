#!/bin/bash

set -ex

CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $CUR_DIR/..
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCLANG_TIDY=ON \
      -DTESTS=ON \
      -DCOVERAGE=ON \
      -DCOVERAGE_LCOV=OFF \
      -DCOVERAGE_TEXT=ON \
      -DCOVERAGE_HTML=ON \
      -GNinja \
      -S . -B build
cmake --build build
cmake --build build --target coverage
$CUR_DIR/check-format.sh
