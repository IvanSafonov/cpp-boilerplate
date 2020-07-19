ARG IMAGE="ubuntu:20.04"
FROM $IMAGE

RUN set -eux; \
    echo "Installing Clang 10 ..."; \
    apt-get update; \
    export DEBIAN_FRONTEND=noninteractive; \
    apt-get -y install --no-install-recommends wget curl ca-certificates make ninja-build \
        clang-10 clang-tidy-10 clang-format-10 llvm-10; \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 100; \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang-10 100; \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-10 100; \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-10 100; \
    update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-10 100; \
    update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-10 100; \
    update-alternatives --install /usr/bin/llvm-cov llvm-cov /usr/bin/llvm-cov-10 100; \
    update-alternatives --install /usr/bin/llvm-profdata llvm-profdata /usr/bin/llvm-profdata-10 100

RUN set -eux; \
    echo "Installing CMake ..."; \
    CMAKE_URL=https://github.com/Kitware/CMake/releases/download/v3.18.0/cmake-3.18.0-Linux-x86_64.tar.gz; \
    mkdir -p /opt/cmake; \
    wget --no-verbose -c ${CMAKE_URL} -O - | tar -xz --strip-components 1 -C /opt/cmake/

ENV PATH="/opt/cmake/bin:${PATH}"

RUN set -eux; \
    echo "Installing Google Test ..."; \
    TMP_DIR=/tmp/gtest; \
    mkdir -p $TMP_DIR; \
    cd $TMP_DIR; \
    GTEST_URL=https://github.com/google/googletest/archive/v1.10.x.tar.gz; \
    wget --no-verbose -O ./googletest.tar.gz $GTEST_URL; \
    tar xzf ./googletest.tar.gz --strip-components 1; \
    mkdir -p build; \
    cd build; \
    cmake -DBUILD_SHARED_LIBS=ON ..; \
    make --silent -j `nproc`; \
    make --silent install; \
    cd /; \
    rm -rf $TMP_DIR

ARG VSCODE="false"

RUN set -eux; \
    if [ "$VSCODE" = "true" ]; then \
        echo "Installing extra IDE tools ..."; \
        apt-get update; \
        export DEBIAN_FRONTEND=noninteractive; \
        apt-get -y install --no-install-recommends clangd-10 gdb; \
        update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-10 100; \
        echo "Set disable_coredump false" >> /etc/sudo.conf; \
    fi
