#!/usr/bin/zsh

# --- ALIASES ---

# --- FILE SYSTEM ---
alias ls='eza --group-directories-first --color=automatic --no-quotes --icons'
alias l='eza -h1 --group-directories-first --icons'
alias ll='eza -lh --group-directories-first --grid --git --icons'
alias la='eza -ah1 --group-directories-first --icons'
alias lal='eza -lah --group-directories-first --grid --git --icons'
alias tree='eza -T --icons'
alias tr='eza -T --level=2 --icons'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

# -- UTILITIES --
alias fuck='fortune | cowsay | lolcat'
alias q='exit'
alias v='nvim'
alias c='clear'
alias z='zathura'
alias open='xdg-open'
alias rd='bat'
alias rm='rm -Iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

# --- SHORTCUTS ---
alias t='task'
alias nu='nb use'
alias ne='nb edit'
alias szsh='source ~/.zshrc'
alias czsh='nvim ~/.zshrc'
alias cnvim='cd ~/.config/nvim/lua/plugins'
alias csvenv='python -m venv .venv && source .venv/bin/activate'
alias id="nvim $WIKI_PATH/index.md"
alias td="nvim $WIKI_PATH/diary/diary.md -c VimwikiMakeDiaryNote"

# --- GIT ---
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
alias gl="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short && echo && echo '--Branches--' && git branch"
