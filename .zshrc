# prevent accidental ctrl+d closing terminal
set -o ignoreeof
export IGNOREEOF=42

# load ohmyzsh (https://github.com/ohmyzsh/ohmyzsh.git)
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="brent"
plugins=(
  zsh-completions
  zsh-autosuggestions
  git
  heroku
  npm
  asdf
  docker
)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# load asdf (https://github.com/asdf-vm/asdf)
if [ -d $HOME/.asdf ]; then
  . $HOME/.asdf/asdf.sh
fi

if [ ! -z $HOME/.dot-files/npm-completion ]; then
  npm completion > $HOME/.dot-files/npm-completion
fi
source $HOME/.dot-files/npm-completion

source $HOME/.dot-files/sh-env.sh
source $HOME/.dot-files/sh-aliases.sh

eval `keychain --quiet --eval --agents ssh id_rsa`
