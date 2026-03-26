#!/usr/bin/env bash

# Configuration
BARS=12
MAX_RANGE=8 # Matches the number of icons in the bar string
PIPE="/tmp/cava.fifo"

# Clean up old pipe
[ -p "$PIPE" ] && unlink "$PIPE"
mkfifo "$PIPE"

# Create temporary CAVA config
CAVA_CONF="/tmp/waybar_cava_conf"
echo "
[general]
bars = $BARS
framerate = 30
monstercat = 1
[output]
method = raw
raw_target = $PIPE
data_format = ascii
ascii_max_range = $MAX_RANGE
" > "$CAVA_CONF"

# Run CAVA in background
cava -p "$CAVA_CONF" &

# Map of heights to icons and colors (Pango Markup)
# You can customize these hex codes for your gradient
icons=(" " "▂" "▃" "▄" "▅" "▆" "▇" "█")
colors=("#8be9fd" "#8be9fd" "#6272a4" "#bd93f9" "#ff79c6" "#f1fa8c" "#ffb86c" "#ff5555")

# Read from pipe and process
while read -r line; do
    output=""
    # Split the semicolon-separated values from CAVA
    IFS=';' read -ra values <<< "$line"

    for val in "${values[@]}"; do
        if [[ -n "$val" ]]; then
            # Clamp value to array index
            idx=$val
            [[ $idx -ge ${#icons[@]} ]] && idx=$((${#icons[@]} - 1))

            # Wrap icon in Pango color tag
            output+="<span color='${colors[$idx]}'>${icons[$idx]}</span>"
        fi
    done
    echo "$output"
done < "$PIPE"
