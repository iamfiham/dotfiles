#!/usr/bin/env bash

SINK="@DEFAULT_AUDIO_SINK@"

# Get volume and mute status from wpctl output
read -r volume_line < <(wpctl get-volume "$SINK")

# Extract volume decimal number
volume=$(echo "$volume_line" | awk '{print $2}')

# Convert volume decimal to integer percentage
vol_percent=$(awk "BEGIN {printf \"%d\", $volume * 100}")

# Check if muted (if the word MUTED exists in the output)
if echo "$volume_line" | grep -q "\[MUTED\]"; then
    muted=true
else
    muted=false
fi

# Prepare notification title and icon based on mute status
if $muted; then
    title="Volume (Muted)"
    icon="/home/iamfiham/.local/share/icons/WhiteSur-dark/status/symbolic/audio-volume-muted-symbolic.svg"
else
    title="Volume"
	icon="/home/iamfiham/.local/share/icons/WhiteSur-dark/status/symbolic/audio-volume-medium-symbolic.svg"
fi

# Show notification with volume progress bar and mute status if muted
notify-send  "$title" "$vol_percent%" \
			 -i "$icon" \
			 -t 1500 \
 			 -h int:value:"$vol_percent" \
			 -h string:x-canonical-private-synchronous:volume \
			 -u normal 
