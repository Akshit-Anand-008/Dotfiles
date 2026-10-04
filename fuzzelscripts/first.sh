#!/usr/bin/env bash

export CUR_WIFI=$(nmcli -t -f TYPE,NAME con show --active | rg -vw 'lo' | head -n 1 | cut -d: -f2-)
prompt_label="${CUR_WIFI:-Disconnected}"
wifi="WIFI [$prompt_label]"

myopen(){
    local file="$1"
    local mime
    mime=$(file -biL "$file")
    case "$mime" in
        *text*|*empty*|application/json|application/xml)
            alacritty -e "${VISUAL:-nvim}" "$file" ;;
        *)
            xdg-open "$file" &>/dev/null & ;;
    esac
}

selection=$(cat <<EOF | fuzzel -d
Calculator
$wifi
Files
EOF
)

case "$selection" in
    "Calculator")
    # alacritty --class="Calculator" --config-file="$HOME/.config/alacritty/launcher.toml" -e fend;;
    alacritty --class="Calculator"  -e fend;;
    # expr=$(printf '' | fuzzel --dmenu --prompt="calc > ") || exit 0
    # [[ -z "$expr" ]] && exit 0
    # result=$(fend "$expr" 2>&1)
    # printf '%s' "$result" | wl-copy
    # notify-send "$expr" "$result";;

    "Files")
    ans=$(fd -t f -C "$HOME" | fuzzel -d) || exit 0;
    myopen "$ans";;

    "$wifi")
    nmcli radio wifi on
    "$HOME/fuzzelscripts/wifi.sh";;

    *)
    exit 0 ;;
esac
