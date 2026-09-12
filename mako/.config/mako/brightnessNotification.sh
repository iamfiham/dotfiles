#!/usr/bin/env bash

# Get current brightness percentage (remove % symbol)
brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
brightness_percent=$(awk "BEGIN {printf \"%d\", ($brightness / $max_brightness) * 100}")

# Set icon based on brightness level
icon="/home/iamfiham/.local/share/icons/WhiteSur-dark/status/symbolic/display-brightness-high-symbolic.svg"

# Show notification
notify-send	"Brightness" "$brightness_percent%" \
			-h int:value:"$brightness_percent" \
			-t 1500 \
			-h string:x-canonical-private-synchronous:brightness \
			-u low \
			-i "$icon" 
