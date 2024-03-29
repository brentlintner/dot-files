alias desktop-apps="grep -niE '^(name|exec)=' {$HOME/.local/share/applications/*,/usr/share/applications/*}"
alias pwsh="TERM=xterm pwsh"
alias t="npm -s t"
alias xo="xdg-open"
alias v="vim"
alias choco="choco.exe"
alias tree="tree -C"
alias mg="mv"

alias plex-start="sudo systemctl enable --now plexmediaserver.service"
alias plex-stop="sudo systemctl disable --now plexmediaserver.service"

alias truffles="trufflehog --regex --entropy=False"

alias asdf-update="asdf update && asdf plugin-update --all"

alias aurvote="ssh aur@aur.archlinux.org vote"
alias sc="systemctl"
alias sc-units="systemctl list-unit-files"
alias pacman="pacman --color always"
alias pa="yay --color always"
alias pa-upgrade="pa -Sc --noconfirm; pa -Syyu --noconfirm"
alias pa-updates='yay -Qu --color always'
alias pa-updates-core='pacman -Qu --color always'
alias pa-updates-aur='yay -Qua --color always'
alias pa-installed='yay -Q --color always'
alias pa-installed-sys='yay -Qn --color always'
alias pa-installed-aur='yay -Qm --color always'
alias pa-autoremove='sudo pacman -R $(pacman -Qdtq)'
alias calc=gcalccmd
alias incognito-ca="sudo openvpn ~/.airvpn/AirVPN_Canada_UDP-443.ovpn"
alias ufw-rejects="sudo iptables -S | grep -P 'REJECT|DENIED|DENY'"
alias ufw-accepts="sudo iptables -S | grep ACCEPT"
alias journal-errors="journalctl -r -p 3 -xb"
alias journal-log="journalctl -rx"

alias pha="php artisan"
alias phas="php artisan serve"
alias laravel-log="true > storage/logs/laravel.log && clear && tail -f storage/logs/laravel.log"
alias phpunit="./vendor/bin/phpunit"
alias phpunit-cov="phpdbg -qrr ./vendor/bin/phpunit --coverage-html coverage"
alias pu="./vendor/bin/phpunit"
alias r="bin/rails"
alias rt="bin/rails test"
alias rta="bin/rails test:all"
alias rbcop="bundle exec rubocop"
alias nbuild="npm run compile -s"
alias gitk="tig"
alias gk="tig"
alias git-config-zs="git config --local user.email brent@zeitspace.com && git config --local commit.gpgsign false"
alias git-view-merged='git branch --merged | grep -v main | grep -v dev | grep -v "\*"'
alias git-delete-merged='git branch --merged | grep -v "main" | grep -v "dev" | grep -v "staging" | grep -v "\*" | xargs git branch -d'
alias git-sync="$HOME/.dot-files/bin/git-sync.sh"
alias git-ignore="git update-index --assume-unchanged"
alias git-unignore="git update-index --no-assume-unchanged"
alias g="git s"
alias gl="git l"
alias gpr="hub pull-request"
alias grp="grep -rni"
alias fl="flutter"
alias flr="flutter run --no-pub --no-enable-dart-profiling"

alias sync-gdm-theme="cd /usr/share/themes/mako/gnome-shell && sudo glib-compile-resources --target=/usr/share/gnome-shell/gnome-shell-theme.gresource gnome-shell-theme.gresource.xml && cd -"

alias dk=docker
alias pd=podman
alias static-server="python -m http.server 8002"
alias tlp-mode="sudo tlp stat | grep -iE '^mode'"
alias cron="crontab"
alias ackg="ack --color --nopager"
alias to="touch"
alias mk="mkdir"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -lh --color=always'
alias la='ls -lah --color=auto'
alias ls='ls --color=auto'
#alias find='fd'
alias mann='/usr/bin/man'
alias man='tldr'

alias confirm="$HOME/.dot-files/bin/confirm"
alias for-i="$HOME/.dot-files/bin/for-x"
alias replace-all="$HOME/.dot-files/bin/replace-all"
alias git-for-each="$HOME/.dot-files/bin/git-for-each"
alias backup-user="deja-dup --backup"
alias backup-path="$HOME/.dot-files/bin/backup"
alias backup-music="$HOME/.dot-files/bin/backup /mnt/games/Music bnixbook-music"
alias android-music-sync="$HOME/.dot-files/bin/android-music-sync"
alias vim="nvim"
alias vim-clean-plugins="vim +PluginClean +qall"
alias vim-update-plugins="vim +PluginUpdate +qall && vim +CocUpdateSync +qall"
alias zsh-update="cd $HOME/.oh-my-zsh && git pull origin master && cd -"
