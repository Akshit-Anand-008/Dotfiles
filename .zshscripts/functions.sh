#!/usr/bin/zsh

# --- FUNCTIONS ---
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

mkcd() { mkdir -p "$1" && cd "$1" }

jot() {
  local target="$WIKI_PATH/jotted.md"
  mkdir -p "$(dirname "$target")"
  echo "- [$(date "+%Y-%m-%d %H:%M")]: $*" >> "$target"
}

n() {
    if [ -n "$NNNLVL" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config/nnn}/.lastd"
    mkdir -p "$(dirname "$NNN_TMPFILE")"
    command nnn -e "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

fw() {
    local file=$(fd --type f --hidden --exclude .git --search-path $WIKI_PATH | fzf)
    if [ -n "$file" ]; then
        nvim "$file"
    fi
}

ff() {
    local file=$(fd --type f --hidden --exclude .git | fzf)
    if [ -n "$file" ]; then
        nvim "$file"
    fi
}

# Auto-activate Python venv
load-venv() {
  local venv_path="${PWD:A}/.venv"
  if [[ -d "$venv_path" ]]; then
    if [[ "$VIRTUAL_ENV" != "$venv_path" ]]; then
      source "$venv_path/bin/activate"
    fi
  elif [[ -n "$VIRTUAL_ENV" ]]; then
    if [[ "${PWD:A}" != "${VIRTUAL_ENV:h:h}"* ]]; then
      deactivate
    fi
  fi
}
