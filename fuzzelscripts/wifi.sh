#!/usr/bin/env bash

prompt_label="${CUR_WIFI:-Disconnected}"
newsel=$(nmcli -t -f TYPE,NAME con show | grep '^802-11-wireless:' | cut -d: -f2- | fuzzel --dmenu --prompt="$prompt_label ") || exit 0

if [[ "$newsel" = "$CUR_WIFI" ]]; then
    notify-send "Already connected to $newsel"
    exit 0;
fi
notify-send "Connecting to $newsel..."

if nmcli connection up "$newsel" &>/dev/null; then
    notify-send "Successfully connected to $newsel"
else
    notify-send "Failed to connect to $newsel"
fi
