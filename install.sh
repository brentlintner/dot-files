#!/usr/bin/env sh

set -e

OS=$(uname -s)

APT_PKGS="vim zsh most bash neovim python-pip python-neovim optipng python3 curl conky parallel nodejs ruby ruby-dev redis-server postgresql terminator build-essential gnome-shell-extensions gnome-tweak-tool git fonts-dejavu fonts-inconsolata automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev"
PAC_PKGS="vim zsh most zsh-autosuggestions zsh-completions nvme-cli bash neovim python-neovim python2-neovim optipng python3 curl conky parallel nodejs npm ruby redis postgresql terminator base-devel gnome-shell-extensions git ttf-hack ttf-inconsolata ttf-dejavu gnome-tweaks" DNF_PKGS="vim zsh most bash neovim python-neovim optipng python3 curl conky parallel nodejs ruby ruby-dev redis postgresql terminator gnome-tweak-tool gnome-shell-extension-user-theme git dejavu-sans-fonts levien-inconsolata-fonts automake autoconf readline-devel ncurses-devel openssl-devel libyaml-devel libxslt-devel libffi-devel libtool unixODBC-devel"
BRW_PKGS="vim zsh most bash neovim nodejs parallel ruby git redis postgresql coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc"
ZYP_PKGS="vim zsh most bash neovim python-neovim python3 curl conky gnu_parallel nodejs ruby redis postgresql terminator gnome-tweak-tool git dejavu-fonts google-inconsolata-fonts automake autoconf readline-devel ncurses-devel openssl-devel libyaml-devel libxslt-devel libffi-devel libtool unixODBC-devel"
# TODO: yum
YUM_PKGS="vim zsh bash neovim python-neovim python3 curl conky parallel nodejs ruby redis postgresql terminator gnome-tweak-tool gnome-shell-extension-user-theme git dejavu-sans-fonts levien-inconsolata-fonts automake autoconf readline-devel ncurses-devel openssl-devel libyaml-devel libxslt-devel libffi-devel libtool unixODBC-devel"

as_root() {
  echo "root: $*"
  if [ "$(id -u)" -eq 0 ]; then
    "$@"
  else
    if [ ! -z "$(command -v sudo)" ]; then
      sudo "$@"
    elif [ ! -z "$(command -v su)" ]; then
      su root -c "$*"
    else
      echo "Can't continue without sudo/su installed." && exit 1
    fi
  fi
}

check_packager() {
  if [ ! -z "$(command -v pacman)" ]; then
    PACKAGER="pacman"
  elif [ "$OS" = "Darwin" ] && [ ! -z "$(command -v brew)" ]; then
    PACKAGER="brew"
  elif [ ! -z "$(command -v zypper)" ]; then
    PACKAGER="zypper"
  elif [ ! -z "$(command -v dnf)" ]; then
    PACKAGER="dnf"
  elif [ ! -z "$(command -v yum)" ]; then
    PACKAGER="yum"
  elif [ ! -z "$(command -v apt)" ]; then
    PACKAGER="apt"
  fi
}

install_asdf() {
  if [ ! -d "$HOME/.asdf" ]; then
    ln -sf "$HOME/.dot-files/.asdfrc" "$HOME/.asdfrc"
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
    cd $HOME/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"
    cd -
  fi
}

install_pkgs() {
  case $PACKAGER in
    pacman)
      as_root pacman --noconfirm -S yay
      yay --noconfirm -S $PAC_PKGS
      ;;
    brew)
      brew tap homebrew/cask-fonts
      brew cask install font-inconsolata font-dejavu-sans
      brew install $BRW_PKGS
      ;;
    dnf)
      as_root dnf -y install $DNF_PKGS
      ;;
    zypper)
      as_root zypper in -y $ZYP_PKGS
      ;;
    yum)
      as_root yum -y install $YUM_PKGS
      ;;
    apt)
      as_root apt -y install $APT_PKGS
      ;;
    *)
      echo "WARNING: Unknown pkg manager."
      ;;
  esac

  if [ -z "$(command -v node)" ]; then
    as_root ln -fs $(which node) /usr/bin/node
  fi
}

install() {
  install_pkgs
  install_asdf

  cd "$HOME"

  # install ohmyzsh
  rm -rf "$HOME/.oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's/^\s*.*zsh -l$//g')"

  # zsh theme
  ln -sf "$HOME/.dot-files/brent.zsh-theme" "$HOME/.oh-my-zsh/themes/brent.zsh-theme"

  # premake some dirs
  mkdir -p "$HOME/.config"
  mkdir -p "$HOME/.config/terminator"
  mkdir -p "$HOME/.config/albert"
  mkdir -p "$HOME/.vscode"
  mkdir -p "$HOME/.config/Code/User"
  mkdir -p "$HOME/.local/share/applications"
  mkdir -p "$HOME/.config/Typora/conf"

  # mimelist
  ln -sf "$HOME/.dot-files/mimeapps.list" "$HOME/.config/mimeapps.list"
  ln -sf "$HOME/.config/mimeapps.list" "$HOME/.local/share/applications/mimeapps.list"

  # shell config
  ln -sf "$HOME/.dot-files/.zshrc"
  ln -sf "$HOME/.dot-files/.bashrc"

  # misc config
  ln -sf "$HOME/.dot-files/.ackrc"
  ln -sf "$HOME/.dot-files/.conkyrc"
  ln -sf "$HOME/.dot-files/.ctags"
  ln -sf "$HOME/.dot-files/.editorconfig"
  ln -sf "$HOME/.dot-files/.gitignore"
  ln -sf "$HOME/.dot-files/.gitmessage"
  ln -sf "$HOME/.dot-files/.gitconfig"

  # albert
  ln -sf "$HOME/.dot-files/albert.conf" "$HOME/.config/albert/albert.conf"

  # terminator
  ln -sf "$HOME/.dot-files/.terminator" "$HOME/.config/terminator/config"

  # vscode
  ln -sf "$HOME/.dot-files/vscode.settings.json" "$HOME/.config/Code/User/settings.json"
  ln -sf "$HOME/.dot-files/vscode.keybindings.json" "$HOME/.config/Code/User/keybindings.json"

  if [ ! -z "$(command -v code)" ]; then
    code --install-extension vscodevim.vim
  fi

  # typora
  ln -sf "$HOME/.dot-files/typora.user.conf.json" "$HOME/.config/Typora/conf/conf.user.json"

  # vim config
  rm -rf "$HOME/.vim-settings"
  git clone https://github.com/brentlintner/vim-settings.git "$HOME/.vim-settings"
  cd "$HOME/.vim-settings"
  git submodule update --init
  git submodule foreach git checkout master
  cd - > /dev/null

  ln -sf "$HOME/.vim-settings/.vimrc"
  ln -sf "$HOME/.vim-settings/.vim"
  ln -sf "$HOME/.vim-settings/.vim" "$HOME/.config/nvim"

  vim +PluginInstall +qall
  vim +UpdateRemotePlugins +qall
}

main() {
  check_packager
  install
  echo ""
  echo "If you see this then it worked!"
}

main
