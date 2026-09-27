#!/usr/bin/env bash

address="$1"
button="$2"

if [ -z "$address" ]; then
    exit 1
fi

if [ "$button" -eq 1 ]; then
    # 1. Block the cursor from jumping
    hyprctl keyword cursor:no_warps true

    # 2. Focus the window natively via Lua
    hyprctl dispatch "hl.dsp.focus({ window = \"address:$address\" })"

    # 3. Restore default cursor behavior safely
    hyprctl keyword cursor:no_warps false
elif [ "$button" -eq 2 ]; then
    # Middle click: close/kill window cleanly
    hyprctl dispatch "hl.dsp.window.kill({ window = \"address:$address\" })"
fi
