export NNN_PLUG='s:fzplug;e:myopen;f:fzopen;d:fzcd;x:togglex;l:fzlaunch'
export NNN_BMS="d:$HOME/Downloads/"
export NNN_OPTS="QAEeu"
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"

export NNN_FIFO='/tmp/nnn.fifo'
export NNN_SEL='/tmp/.sel'
export NNN_TMPFILE='/tmp/.lastd'

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
