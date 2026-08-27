#!/usr/bin/env bash

ORIGINAL_DIR="$(pwd)"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_DIR="$SCRIPT_DIR/.." #scripts directory is assumed to be always at <REPO_ROOT>/scripts
BUILD_DIR="$REPO_DIR/build"
SUBMODULE_DIR="$REPO_DIR/Submodules"

#VCPKG REQUIRED PACKAGES
sudo apt-get update
sudo apt-get install -y \
    build-essential \
    curl \
    zip \
    unzip \
    tar \
    pkg-config \
    git \
    ninja-build \
    cmake

#Configure VCPKG
git submodule sync
git submodule update --init --recursive
$SUBMODULE_DIR/vcpkg/bootstrap-vcpkg.sh

#CMake build
mkdir -p $BUILD_DIR
cd $BUILD_DIR
cmake .. --preset WSL-default
cmake --build .

cleanup() {
    echo "====== buildAll.sh Complete ======"
    cd $ORIGINAL_DIR
}

trap cleanup EXIT