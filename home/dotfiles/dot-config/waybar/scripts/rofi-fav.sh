#!/usr/bin/env bash

# 1. Define your pinned apps (one per line)
FAVORITES="Firefox
kitty
ghostty
Steam
yazi
Kate"


# 2. Build the pinned list with icons
PINNED_LIST=""
for item in "${FAVORITES[@]}"; do
    NAME="${item%|*}"
    PINNED_LIST+="${NAME}\n"
done

# 3. Define where NixOS stores desktop files
# This covers your user profile and the system-wide profile
APP_DIRS="$HOME/.nix-profile/share/applications /run/current-system/sw/share/applications"

# 4. Get all apps in lowercase
ALL_APPS=$(grep -h '^Name=' $APP_DIRS/*.desktop 2>/dev/null | cut -d'=' -f2- | tr '[:upper:]' '[:lower:]' | sort -u)

# 5. Filter favorites
REMAINING_APPS="$ALL_APPS"
for item in "${FAVORITES[@]}"; do
    NAME="${item%|*}"
    REMAINING_APPS=$(echo "$REMAINING_APPS" | grep -vFx "$NAME")
done

# 6. Launch Rofi
CHOICE=$(echo -e "${PINNED_LIST}${REMAINING_APPS}" | rofi -dmenu -i -show-icons -p "apps")

# 7. NixOS Native Execution Logic
echo $CHOICE
if [ -n "$CHOICE" ]; then
    # Find the actual .desktop file path by matching the Name field (case-insensitive)
    # We use -l to return the filename only
    FILE_PATH=$(grep -ril "^Name=$CHOICE$" $APP_DIRS/*.desktop 2>/dev/null | head -n 1)
    echo $FILE_PATH
    if [ -n "$FILE_PATH" ]; then
        # 'gio launch' is the native way to run a .desktop file path
        gio launch "$FILE_PATH" &
    else
        # Fallback to direct execution if no desktop file is found
        setsid "$CHOICE" &
    fi
fi


