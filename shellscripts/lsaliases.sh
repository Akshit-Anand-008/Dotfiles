alias l='lsd -h1 --group-directories-first'
alias ls='lsd --group-directories-first'
alias ll='lsd -lh --group-directories-first --git'
alias la='lsd -Ah1 --group-directories-first'
alias lal='lsd -lAh --group-directories-first --git'
alias tree='lsd --tree'
alias tr='lsd --tree --level=2'
nb=$(printf '%s' "$LS_COLORS" | perl -pe 's{(?<==)([^:]*)}{my $v = $1; join ";", grep { !/^0*1$/ } $v =~ /[34]8;(?:5;\d+|2;\d+;\d+;\d+)|[^;]+/g}ge')
export LS_COLORS="ex=32:di=34:ln=36:bd=33:cd=33:do=35:so=35:$nb"
unset nb
