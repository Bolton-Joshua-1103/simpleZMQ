#!/usr/bin/env bash

ORIGINAL_DIR="$(pwd)"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_DIR="$SCRIPT_DIR/.." #scripts directory is assumed to be always at <REPO_ROOT>/scripts
SUBMODULE_DIR="$REPO_DIR/Submodules"

#VCPKG REQUIRED PACKAGES
echo "==== INSTALL BUILD DEPENDENCIES ===="
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
echo "==== BUILD DEPENDENCIES INSTALLED ===="

#Configure Submodules
echo "==== SETUP SUBMODULES ===="
git submodule sync
git submodule update --init --recursive
echo "==== SETUP SUBMODULES COMPLETE ===="

#Configure VCPKG
echo "==== VCPKG BEGIN SETUP ===="
$SUBMODULE_DIR/vcpkg/bootstrap-vcpkg.sh
echo "==== VCPKG SETUP COMPLETE ===="
