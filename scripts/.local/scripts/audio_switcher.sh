#!/usr/bin/bash

echo audio test
# Get a list of available audio sinks (output devices)
# We extract the name and description for dmenu
# The 'Name:' field is the unique identifier for pactl set-default-sink
sink_info=$(pactl list sinks | awk '/Name:/{name=$2} /Description:/{print name "("$0")"}' | sed 's/Description: //')

# Use dmenu to let the user choose a sink
selected_sink_line=$(echo -e "$sink_info" | dmenu -i -l 10 -p "Select audio output:")

# Extract the sink name from the selected line
# The sink name is the part before the first space
selected_sink_name=$(echo "$selected_sink_line" | awk '{print $1}')

# Check if a sink was selected
if [ -n "$selected_sink_name" ]; then
    # Set the default sink
    pactl set-default-sink "$selected_sink_name"

    # Optional: Move all currently playing streams to the new sink
    # This loop is important because pactl set-default-sink only affects *new* streams.
    # Existing streams might continue playing on the old sink.
    for app_id in $(pactl list sink-inputs | grep -oP 'Sink Input #\K\d+'); do
        pactl move-sink-input "$app_id" "$selected_sink_name"
    done

    # Optional: Send a notification (requires 'notify-send' from libnotify)
    # notify-send "Audio Output Changed" "Switched to: $(echo "$selected_sink_line" | sed 's/ (.*//')" -t 3000
fi
