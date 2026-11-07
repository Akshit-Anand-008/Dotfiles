export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="nvim +Man!"

export NB_DIR="$HOME/NoteBooks"
export DIARY_PATH="$NB_DIR/Diary"

export QT_QPA_PLATFORMTHEME=qt6ct
export GTK_USE_PORTAL=1
export GDK_DEBUG=portals

# FZF
export FZF_DEFAULT_OPTS="--cycle"
export FZF_DEFAULT_COMMAND='fd'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# NNN
export NNN_OPTS="QAEeu"
export NNN_PLUG='s:fzplug;e:openall;f:fzopen;d:fzcd;x:togglex'
export NNN_BMS="d:$HOME/Downloads/"
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_SEL='/tmp/.sel'
