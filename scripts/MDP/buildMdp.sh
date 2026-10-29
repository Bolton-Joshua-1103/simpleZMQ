#!/usr/bin/env bash

ORIGINAL_DIR="$(pwd)"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
MDP_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
PREBUILD_SCRIPT="$SCRIP_DIR/../preBuildAll.sh"
DEFAULT_PRESET="WSL-default"
REPO_DIR="$SCRIPT_DIR/../.." #scripts directory is assumed to be always at <REPO_ROOT>/scripts
BUILD_DIR="$REPO_DIR/build/$DEFAULT_PRESET"
SUBMODULE_DIR="$REPO_DIR/Submodules"


#CMake Configuration, Submodule stuff, Directory Creating
echo "====== PREBUILD CONFIG BEGIN ======"
$SCRIPT_DIR/../preBuildAll.sh
echo "====== PREBUILD CONFIG END ======"

#CMake build
echo "==== BEGIN MDP CMAKE BUILD ===="
cd $BUILD_DIR
cmake --build . --target test_mdp
echo "==== CMAKE MDP BUILD COMPLETE ===="

cleanup() {
    echo "====== buildAll.sh Complete ======"
    cd $ORIGINAL_DIR
}

trap cleanup EXIT