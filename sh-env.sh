export GPG_TTY=$(tty)

export LANG=en_CA.UTF-8
export EDITOR=vim
export VISUAL=vim
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/id_rsa"

export PATH=$PATH:~/.cabal/bin
export GOPATH=~/.go
export PATH=$PATH:~/.go/bin
export PGROOT=/var/lib/postgres

export NODE_REPL_HISTORY_FILE="$HOME/.node-repl-history"
export N_PREFIX=$HOME
export TERM=xterm-256color
export EDITOR=vim

export DEBFULLNAME="Brent Lintner"
export DEBEMAIL="brent.lintner@gmail.com"

# local node install (put before usr/bin, etc)
export PATH=$HOME/.node/bin:$PATH
export PATH="$PATH:$HOME/.composer/vendor/bin"
