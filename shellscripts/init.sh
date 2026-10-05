setopt NO_NOTIFY
setopt INTERACTIVE_COMMENTS

# ENVIRONMENT
export PATH="$PATH:$HOME/bin"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="nvim +Man!"
export FZF_DEFAULT_OPTS="--cycle"
export NB_DIR="$HOME/NoteBooks"
export DIARY_PATH="$NB_DIR/Diary"
export PS1=$'\n%B%U%F{yellow}%~/%f%u%b '

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS

# Sourcing shellscripts
source ~/shellscripts/aliases.sh
source ~/shellscripts/functions.sh
source ~/shellscripts/nnn.sh
source ~/shellscripts/lsaliases.sh

# Other
zvm_after_init_commands+=('source <(fzf --zsh)')
eval "$(starship init zsh)"
task
