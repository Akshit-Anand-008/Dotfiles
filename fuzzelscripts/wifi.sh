#!/usr/bin/env bash

prompt_label="${CUR_WIFI:-Disconnected}"
newsel=$(nmcli -t -f TYPE,NAME con show | grep '^802-11-wireless:' | cut -d: -f2- | fzf --prompt="$prompt_label ") || exit 0

if [[ "$newsel" = "$CUR_WIFI" ]]; then
    notify-send "Already connected to $newsel"
    exit 0
fi
notify-send "Connecting to $newsel..."

setsid -f bash -c '
    if nmcli connection up "$1" &>/dev/null; then
        notify-send "Successfully connected to $1"
    else
        notify-send "Failed to connect to $1"
    fi
' _ "$newsel" >/dev/null 2>&1
