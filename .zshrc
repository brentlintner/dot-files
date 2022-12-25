# prevent accidental ctrl+d closing terminal
set -o ignoreeof
export IGNOREEOF=42

# load ohmyzsh (https://github.com/ohmyzsh/ohmyzsh.git)
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="brent"

if [ -d /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

HEROKU_AC_ZSH_SETUP_PATH=/home/brent/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH

plugins=(
  # zsh-completions # https://github.com/zsh-users/zsh-completions
  git
  heroku
  npm
  asdf
  docker
)
#fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

if [ -e $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
fi

if [ -d /opt/asdf-vm ]; then
  . /opt/asdf-vm/asdf.sh
fi

source $HOME/.dot-files/sh-env.sh
source $HOME/.dot-files/sh-aliases.sh

eval `keychain --quiet --eval --agents ssh id_rsa`
