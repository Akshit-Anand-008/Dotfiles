#  ~/.zshrc

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
export NB_DIR="$HOME/NoteBooks"
export WIKI_PATH="$NB_DIR/Wiki"
export LS_COLORS="di=00;34:fi=00:ex=00;38;5;192:ln=00;36:*.*=0:*.pdf=35:*.jpg=35:*.png=35:*.zip=31:*.tar.gz=31"

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS

# calling zsh scripts
source ~/.zshscripts/aliases.sh
source ~/.zshscripts/functions.sh
source ~/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

autoload -U add-zsh-hook
autoload -Uz compinit
compinit
add-zsh-hook chpwd load-venv
load-venv

eval "$(starship init zsh)"
cl
