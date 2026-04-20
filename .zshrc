###############################
#  ~/.zshrc — SYSTEM OVERRIDE #
###############################

# --- INTERNAL ZSH SETTINGS ---

setopt GLOB_STAR_SHORT      # Allows **/*.js
unsetopt FLOW_CONTROL       # Replaces stty -ixon

# --- ENVIRONMENT ---
export PATH="$PATH:/home/akshit_anand/.local/bin"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="nvim +Man!"
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPTS="Ee"

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS

# LS_COLORS Setup
export LS_COLORS="di=00;34:fi=00:ex=00;38;5;192:ln=00;36:*.cpp=00:*.h=00:*.py=00:*.txt=00:*.pdf=35:*.c=00:*.lua=00:*.md=00:*.rs=00:*.tex=00"

# --- ALIASES ---
# --- FILE SYSTEM ---
alias ls='eza --group-directories-first --color=always --no-quotes --icons'
alias l='eza -h1 --group-directories-first --icons'
alias ll='eza -lh --group-directories-first --grid --git --icons'
alias la='eza -ah1 --group-directories-first --icons'
alias lal='eza -lah --group-directories-first --grid --git --icons'
alias tree='eza -T --icons'
alias tr='eza -T --level=2 --icons'
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'
# --- SAFETY & UTILS ---
alias q='exit'
alias v='nvim'
alias c='clear'
alias vim='nvim'
alias z='zathura'
alias open='xdg-open'
alias rd='batcat'
alias t='task'
alias tt='task done'
alias ta='task add'
alias szsh='source ~/.zshrc'
alias czsh='nvim ~/.zshrc'
alias cnvim='cd ~/.config/nvim/lua'
alias csvenv='python -m venv .venv && source .venv/bin/activate'
alias id='nvim ~/vimwiki/index.md'
alias commands='nvim ~/vimwiki/commands.md'
alias diary='nvim ~/vimwiki/diary/diary.md'
alias td='nvim -c VimwikiMakeDiaryNote'
alias rm='rm -Iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
# --- GIT ---
alias lg='lazygit'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gacm='git add --all && git commit -m'
alias gacmd='git add --all && git commit -m "Commit on $(date +%Y-%m-%d\ %H:%M)"'
alias gacmdp='git add --all && git commit -m "Commit on $(date +%Y-%m-%d\ %H:%M)" && git push'
alias gca='git commit --amend'
alias gps='git push'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gplnr='git pull --no-rebase'
alias gpf='git push --force-with-lease'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gds='git diff --staged'
alias gst='git stash'
alias gsp='git stash pop'
alias grv='git remote -v'
alias gcan='git commit --amend --no-edit'
alias gclean='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gl="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short && echo && echo '--Branches--' && git branch"

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

mkcd() {
  mkdir -p "$1" && cd "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_KEYTIMEOUT=0.01


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

fn() {
  local file=$(find ~/vimwiki -type f | fzf --prompt="Select Note > " --height=40% --reverse)
  if [ -n "$file" ]; then
    nvim "$file"
  fi

}

jot() {
  local target="$HOME/vimwiki/journals.md"
  mkdir -p "$(dirname "$target")"
  echo "- [ ] $(date "+%Y-%m-%d %H:%M"): $*" >> "$target"
}

ff() {
    local cmd
    if command -v fdfind &> /dev/null; then
        cmd="fdfind --type f --hidden --exclude .git"

    elif command -v fd &> /dev/null; then
        cmd="fd --type f --hidden --exclude .git"
    else
        cmd="find . -not -path '*/.*' -type f"
    fi
    local file=$(eval "$cmd" | fzf \
        --prompt=" Find File > " \
        --header "ENTER: nvim | CTRL-Y: copy path" \
        --height=80% --reverse --border \
        --preview 'batcat --color=always --style=numbers --line-range=:500 {}' \
        --bind 'ctrl-y:execute-silent(echo {} | xclip -sel clip)+abort')
    if [ -n "$file" ]; then
        nvim "$file"
    fi
}

# Auto-activate Python venv
autoload -U add-zsh-hook
load-venv() {
  if [[ -d .venv ]]; then
    if [[ "$VIRTUAL_ENV" != "$PWD/.venv" ]]; then
      source .venv/bin/activate
    fi
  elif [[ -n "$VIRTUAL_ENV" ]]; then
    if [[ "$PWD" != "${VIRTUAL_ENV%/*}"* ]]; then
      deactivate
    fi
  fi
}
add-zsh-hook chpwd load-venv
load-venv
cl
eval "$(starship init zsh)"
