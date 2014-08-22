
set -o vi
export PS1="\u@\h:\w\$ "

# -- Terminal Enhancements
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls="gls -p --color=auto --group-directories-first"

# -- Tool protips
alias rpoop="rsync -avzP -e 'ssh'"
function vag() { vim $(ag -l "$@") ;}
function rfar() { find . \( -path ./node_modules -o -path **/bower_components \) -prune -o \( -name "*.html" -o -name "*.js" -o -name "*.json" \) -print0 | xargs -0 sed -i '' -e "s/$1/$2/g" ;}
