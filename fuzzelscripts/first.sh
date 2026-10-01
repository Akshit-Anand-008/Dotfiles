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
$wifi
Calculator
FZF
EOF
)

case "$selection" in
    "Calculator")
    exec fend;;

    "FZF")
    ans=$(fd -C "/home/akshit/" | fuzzel -d) || exit 0;
    myopen "$ans";;

    "$wifi")
    nmcli radio wifi on
    "$HOME/fuzzelscripts/wifi.sh";;

    *)
    exit 0 ;;
esac
