# prevent accidental ctrl+d closing terminal
set -o ignoreeof
export IGNOREEOF=42

# load OMZ (https://github.com/robbyrussell/oh-my-zsh)
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="brent"
plugins=(zsh-autosuggestions zsh-completions zsh-syntax-highlighting git rails heroku npm)
source $ZSH/oh-my-zsh.sh

# load rebenv (https://github.com/rbenv/rbenv)
eval "$(rbenv init -)"

source $HOME/src/dot-files/sh-env.sh
source $HOME/src/dot-files/sh-aliases.sh
