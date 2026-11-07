mkcd() {
    mkdir -p "$1" && cd "$1"
}

jot() {
    local target
    target="$NB_DIR/jotted.md"
    mkdir -p "$(dirname "$target")"
    echo "- [$(date "+%Y-%m-%d %H:%M")]: $*" >> "$target"
}

fw() {
    local file
    file=$(fd --type file --search-path "$WIKI_PATH" | fzf) || return
    [[ -f "$file" ]] && nvim "$file"
}

fh() {
    local file
    file=$(fd --type file --search-path "$HOME" | fzf) || return
    [[ -f "$file" ]] && "$NNN_OPENER" "$file"
}

f() {
    local file
    file=$(fd --type file | fzf) || return
    [[ -f "$file" ]] && "$NNN_OPENER"  "$file"
}

d() {
    local dir
    dir=$(fd --type directory --base-directory "$HOME" | fzf) || return
    dir="$HOME/$dir"
    [[ -d "$dir" ]] && cd "$dir"
}

function n() {
    if [ -n "$NNNLVL" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config/nnn}/.lastd"
    mkdir -p "$(dirname "$NNN_TMPFILE")"
    command nnn "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
