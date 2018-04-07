[[ $- != *i* ]] && return

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

set -o ignoreeof
export IGNOREEOF=42

color_prompt=yes

source $HOME/src/dot-files/sh-env.sh

source $HOME/src/dot-files/sh-aliases.sh

PS1="\[\033[01;34m\]\w\[\033[00m\]\[\033[01;00m\]\$(parse_git_branch)\[\033[00m\] "
