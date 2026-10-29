#!/usr/bin/env bash

ORIGINAL_DIR="$(pwd)"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
DEFAULT_PRESET="WSL-default"
REPO_DIR="$SCRIPT_DIR/.." #scripts directory is assumed to be always at <REPO_ROOT>/scripts
BUILD_DIR="$REPO_DIR/build/$DEFAULT_PRESET"

echo "====== PREBUILD CONFIG BEGIN ======"
$SCRIPT_DIR/preBuildAll.sh
echo "====== PREBUILD CONFIG END ======"

echo "====== BEGIN buildAll.sh ======"
cd $BUILD_DIR
cmake --build .

cleanup() {
    echo "====== buildAll.sh Complete ======"
    cd $ORIGINAL_DIR
}

trap cleanup EXIT