#!/usr/bin/env bash

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

selectedwifi=$(nmcli -g NAME con show --active | grep -v '^lo$' | head -n 1)
prompt_label="${selectedwifi:-Disconnected}"

SELECTION=$(cat <<EOF | fuzzel -d
WIFI [$prompt_label]
Calculator
FZF
EOF
)

case "$SELECTION" in
    "Calculator")
    alacritty -e bc -ql;;
    # ans=$(fuzzel -d | bc -l) || exit 0;
    # notify-send "$ans";;

    "FZF")
    ans=$(fd -C "/home/akshit/" | fuzzel -d) || exit 0;
    myopen "$ans";;

    "WIFI [$prompt_label]")
    if [[ $prompt_label = "Disconnected" ]]; then
        nmcli radio wifi on
    else
        "$HOME/fuzzelscripts/wifi.sh" &

    fi;;
    *)
    exit 0 ;;
esac
