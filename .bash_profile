source ~/.profile

# OPAM configuration
. /Users/myName/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

