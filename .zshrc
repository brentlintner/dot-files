# prevent accidental ctrl+d closing terminal
set -o ignoreeof
export IGNOREEOF=42

# load ohmyzsh (https://github.com/ohmyzsh/ohmyzsh.git)
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="brent"

HEROKU_AC_ZSH_SETUP_PATH=/home/brent/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
plugins=(
  zsh-autosuggestions
  zsh-completions
  git
  heroku
  npm
  asdf
  docker
)

source $ZSH/oh-my-zsh.sh

if [ ! -z $HOME/.dot-files/npm-completion ]; then
  npm completion > $HOME/.dot-files/npm-completion
fi

source $HOME/.dot-files/sh-env.sh
source $HOME/.dot-files/sh-aliases.sh

if [ -x "$(command -v keychain)" ]; then
	eval `keychain --quiet --eval --agents ssh id_rsa`
fi
