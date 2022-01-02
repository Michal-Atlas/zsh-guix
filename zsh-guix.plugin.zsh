alias gx="guix"
alias gxs="gx search"
alias gxi="gx install"
alias gxb="gx build"
alias gxs="gx shell"
alias gxe="gx environment"
alias gxtm="gx time-machine"

: {GUIX_CDIR:="$HOME/.config/guix"}

gxrcon () {
    sudo guix system reconfigure "$GUIX_CDIR/$1.scm" -L "$GUIX_CDIR"
}
