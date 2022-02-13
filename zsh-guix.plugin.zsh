alias gx="guix"
function gxp () {
    if [ $# -eq 0 ]; then
	guix package; # Generates appropriate error
	return;
    fi;
    guix show $@ 2>/dev/null 1>/dev/null
    if [ $? -eq 1 ]; then
	PKG="$(
	    guix search "$@" | \
	    	 recsel -R name -U | \
	    	 grep -v "^$" | \
	    	 fzf +s \
		     --border \
		     --preview "guix show {}" \
		     --preview-window=right:80%:wrap \
		     ;
	    )"
	[ $? -eq 0 ] && guix install "$PKG";
    else;
	guix install "$@";
    fi;
}

function run () {
    guix shell "$1" -- "$@"
}

alias gxi="gx install"
alias gxb="gx build"
alias gxsh="gx shell"
alias gxtm="gx time-machine"

