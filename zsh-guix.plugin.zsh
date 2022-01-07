alias gx="guix"
function gxs () {
    if [ $# -eq 0 ]; then
	guix search; # Generates appropriate error
	return;
    fi;
    guix search $@ | \
	recsel -R name -U | \
	grep -v "^$" | \
	fzf +s --border --preview "guix show {}";
}
function gxsi () {
    PACKAGE="$(gxs $@)"
    if [ ! -z $PACKAGE ]; then
	guix install "$PACKAGE"
    fi;
}
function run () {
    guix shell "$@" -- "$@"
}
alias gxi="gx install"
alias gxb="gx build"
alias gxsh="gx shell"
alias gxe="gx environment"
alias gxtm="gx time-machine"

function gxup () {
    guix pull
    guix package -u
}

: {GUIX_CDIR:="$HOME/.config/guix"}

function gxrcon () {
    sudo guix system reconfigure "$GUIX_CDIR/$1.scm" -L "$GUIX_CDIR"
}
