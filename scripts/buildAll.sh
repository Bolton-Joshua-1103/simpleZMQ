#!/usr/bin/env bash

ORIGINAL_DIR="$(pwd)"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
DEFAULT_PRESET="WSL-default"
REPO_DIR="$SCRIPT_DIR/.." #scripts directory is assumed to be always at <REPO_ROOT>/scripts
BUILD_DIR="$REPO_DIR/build/$DEFAULT_PRESET"
SUBMODULE_DIR="$REPO_DIR/Submodules"

echo "====== BEGIN buildAll.sh ======"

#Install Dependencies, Configure Submodules, Configure VCPKG, universal step for all targets
$SCRIPT_DIR/configureBuild.sh

#Prepare build direcdtory
mkdir -p $BUILD_DIR
echo "==== BUILD DIR: $BUILD_DIR ===="
cd $BUILD_DIR

#CMake build
echo "==== BEGIN CMAKE BUILD ===="
cmake ../.. --preset $DEFAULT_PRESET
cmake --build .
echo "==== CMAKE BUILD COMPLETE ===="

cleanup() {
    echo "====== buildAll.sh Complete ======"
    cd $ORIGINAL_DIR
}

trap cleanup EXIT