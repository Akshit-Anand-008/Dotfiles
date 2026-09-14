#!/usr/bin/env bash

selected=$(nmcli -g NAME con show --active | grep -v '^lo$' | head -n 1)
prompt_label="${selected:-Disconnected}"
newsel=$(nmcli -g NAME con show | fuzzel -d --prompt="[$prompt_label] ") || exit 0

if [[ "$newsel" = "$selected" ]]; then
    notify-send "Already connected to $newsel"
    exit 0
fi
notify-send "Connecting to $newsel..."

if nmcli connection up "$newsel" &>/dev/null; then
    notify-send "Successfully connected to $newsel"
else
    notify-send "Failed to connect to $newsel"
fi
