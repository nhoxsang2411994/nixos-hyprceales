#!/usr/bin/env bash

# Get the raw path from playerctl
RAW_PATH=$(playerctl metadata mpris:artUrl)

# Remove the 'file://' prefix
CLEAN_PATH=${RAW_PATH#file://}

OUTPUT="/tmp/mpris_thumb.png"

# Update the symlink so Waybar always looks at the same "file"
if [ -f "$CLEAN_PATH" ]; then
    ln -sf "$CLEAN_PATH" "$OUTPUT"
else
    TARGET=$(readlink -f "$OUTPUT")
    # 3. Check if the target exists (broken symlink check)
    if [ ! -e "$TARGET" ]; then
        echo "Error: Symlink is broken. Target does not exist."
        exit 1
    fi
fi

echo "$OUTPUT"
echo "Current Video Thumbnail"
