export SHELL=zsh
export GPG_TTY=$(tty)

export LANG=en_CA.UTF-8
export LC_ALL=en_US.UTF-8

export ARCHFLAGS="-arch `uname -m`"
export SSH_KEY_PATH="~/.ssh/id_ed25519"

export PAGER="most"

export HEROKU_NOTIFICATIONS=0

export PATH=$PATH:~/.cabal/bin
export GOPATH=~/.go
export PATH=$PATH:~/.go/bin
export PGROOT=/var/lib/postgres

export BROWSER=chromium

#export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NODE_REPL_HISTORY_FILE="$HOME/.node-repl-history"
export N_PREFIX=$HOME
export VISUAL=nvim
export EDITOR=nvim

export DEBFULLNAME="Brent Lintner"
export DEBEMAIL="brent.lintner@gmail.com"

export PATH="$PATH:$HOME/.composer/vendor/bin"

export PATH="$PATH:$HOME/.fluttersdk/bin"
