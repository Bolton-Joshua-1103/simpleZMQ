#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
BUILD_DIR="$SCRIPT_DIR/../build"
SERVER="$BUILD_DIR/test_server"
CLIENT="$BUILD_DIR/test_client"

echo "STARTING ALL SERVICES"

$SERVER &
SERVER_PID=$!

$CLIENT &
CLIENT_PID=$!

cleanup() {
    echo "Cleaning up..."
    kill "$SERVER_PID" "$CLIENT_PID" 2>/dev/null
    wait "$SERVER_PID" "$CLIENT_PID" 2>/dev/null
}

trap cleanup EXIT

wait
