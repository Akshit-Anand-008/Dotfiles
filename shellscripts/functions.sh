ex() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.tar.xz)    tar xf "$1"     ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.rar)       unrar x "$1"    ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.tbz2)      tar xjf "$1"    ;;
      *.tgz)       tar xzf "$1"    ;;
      *.zip)       unzip "$1"      ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"       ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

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
    dir=$(fd --type directory --base-directory "$HOME" | fzf)
    dir="$HOME/$dir"
    [[ -d "$dir" ]] && cd "$dir"
}

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
