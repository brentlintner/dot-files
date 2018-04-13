# prevent accidental ctrl+d closing terminal
set -o ignoreeof
export IGNOREEOF=42

# load rebenv (https://github.com/rbenv/rbenv)
if [ -x rbenv ]; then
  eval "$(rbenv init -)"
fi

# load asdf (https://github.com/asdf-vm/asdf)
if [ -d $HOME/.asdf ]; then
  autoload -Uz compinit && compinit
  source $HOME/.asdf/asdf.sh
  source $HOME/.asdf/completions/asdf.bash
fi

# load ohmyzsh (https://github.com/robbyrussell/oh-my-zsh)
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="brent"
plugins=(zsh-autosuggestions zsh-completions zsh-syntax-highlighting git rails heroku npm)
source $ZSH/oh-my-zsh.sh

source $HOME/src/dot-files/sh-env.sh
source $HOME/src/dot-files/sh-aliases.sh
