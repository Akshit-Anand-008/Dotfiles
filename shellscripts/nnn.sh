export NNN_PLUG='f:fzopen;d:fzcd;o:fzf-launcher;x:togglex;e:editall'
export NNN_BMS='d:~/Downloads/'
export NNN_OPTS="Aeu"

export NNN_OPENER='/home/akshit/.config/nnn/plugins/nuke'
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
