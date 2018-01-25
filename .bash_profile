source ~/.profile

# OPAM configuration
. /Users/ev1stensberg/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

