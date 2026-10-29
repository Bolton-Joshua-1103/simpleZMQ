#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
BUILD_DIR="$SCRIPT_DIR/../../build/WSL-default"
TEST_APP="$BUILD_DIR/test_mdp"

echo "STARTING ALL SERVICES"

$TEST_APP &
TEST_APP_PID=$!

cleanup() {
    echo "Cleaning up..."
    kill "$TEST_APP_PID" 2>/dev/null
    wait "$TEST_APP_PID" 2>/dev/null
}

trap cleanup EXIT

wait
