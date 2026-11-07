setopt NO_NOTIFY
setopt INTERACTIVE_COMMENTS
export PROMPT=$'\n%B%U%F{yellow}%~/%f%u%b '
export CS231_TRACE_DIR="/home/akshit/Lab-DLDCA/traces"

# Sourcing shellscripts
source ~/shellscripts/aliases.sh
source ~/shellscripts/gitaliases.sh
source ~/shellscripts/functions.sh
source ~/shellscripts/historyrc.sh
source ~/shellscripts/lsrc.sh
source ~/.pyvenv/bin/activate

# Other
zvm_after_init_commands+=('source <(fzf --zsh)')
eval "$(starship init zsh)"
task
