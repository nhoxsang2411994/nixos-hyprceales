#!/usr/bin/env bash

# Get the raw path from playerctl
# RAW_PATH=$(playerctl metadata --format '{{mpris:artUrl}}')
# ART_DIR="$HOME/.config/mozilla/firefox/firefox-mpris"
# Remove the 'file://' prefix
# CLEAN_PATH=${RAW_PATH#file://}

# OUTPUT="/tmp/mpris_thumb.png"

# Update the symlink so Waybar always looks at the same "file"
# if [ -f "$CLEAN_PATH" ]; then
    # ln -sf "$CLEAN_PATH" "$OUTPUT"
# else
    # TARGET=$(readlink -f "$OUTPUT")
    # 3. Check if the target exists (broken symlink check)
#     if [ ! -e "$TARGET" ]; then
#         echo "Error: Symlink is broken. Target does not exist."
#         exit 1
#     fi
# fi

# echo "$OUTPUT"
# echo "Current Video Thumbnail"

# skip playerctl
TARGET_DIR="$HOME/.config/mozilla/firefox/firefox-mpris/"
# Default fallback image if nothing is playing
FALLBACK_PATH="$HOME/.config/mozilla/firefox/fallback.png"
OUTPUT="/tmp/mpris_thumb.png"


NEWEST_FILE=$(find "$TARGET_DIR" -type f -name "*.png" ! -name "$LINK_NAME" ! -name "fallback.png" -printf '%T@ %p\n' | sort -n | tail -1 | cut -d' ' -f2-)
if [ -n "$NEWEST_FILE" ]; then
    ln -sf "$NEWEST_FILE" "$OUTPUT"
else
    # If Firefox clears the art or stops playing, fallback gracefully
    if [ -f "$FALLBACK_PATH" ]; then
        ln -sf "$FALLBACK_PATH" "$OUTPUT"
    else
        echo "No thumbnail found"
    fi
fi

