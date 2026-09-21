mkcd() {
    mkdir -p "$1" && cd "$1"
}

jot() {
    local target
    target="$WIKI_PATH/jotted.md"
    mkdir -p "$(dirname "$target")"
    echo "- [$(date "+%Y-%m-%d %H:%M")]: $*" >> "$target"
}

fw() {
    local file
    file=$(fd --type file --search-path "$WIKI_PATH" | fzf)
    [[ -f "$file" ]] && nvim "$file"
}

fh() {
    local file
    file=$(fd --type file --search-path "$HOME" | fzf)
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

export FZF_DEFAULT_COMMAND='fd'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
