alias desktop-apps="grep -niE '^(name|exec)=' {$HOME/.local/share/applications/*,/usr/share/applications/*}"
alias pwsh="TERM=xterm pwsh"
alias t="npm -s t"
alias xo="xdg-open"
alias v="vim"
alias choco="choco.exe"

alias plex-start="sudo systemctl enable --now plexmediaserver.service"
alias plex-stop="sudo systemctl disable --now plexmediaserver.service"
alias ncu="npm-check-updates"

alias truffles="trufflehog --regex --entropy=False"

alias asdf-update="asdf update && asdf plugin-update --all"

alias sc="systemctl"
alias sc-units="systemctl list-unit-files"
alias pacman="pacman --color always"
alias pa="yay --color always"
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
alias errorlog="journalctl -p 3 -xb"
alias systemlog="journalctl -xe"

alias homestead="cd $HOME/.homestead && vagrant ssh && cd -"
alias homestead-up="cd $HOME/.homestead && vagrant up && cd -"
alias homestead-down="cd $HOME/.homestead && vagrant halt && cd -"
alias homestead-status="cd $HOME/.homestead && vagrant status && cd -"
alias artisan="php artisan"
alias phpunit="./vendor/bin/phpunit"
alias pu="./vendor/bin/phpunit"
alias r="rspec"
alias rr="spring rspec"
alias nbuild="npm run compile -s"
alias gitk="tig"
alias gk="tig"
alias git-view-merged='git branch --merged | grep -v "\*"'
alias git-delete-merged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias g="git s"
alias gl="git l"
alias gpr="hub pull-request"

alias static-server="python -m http.server 8000"
alias tlp-mode="sudo tlp stat | grep -iE '^mode'"
alias cron="crontab"
alias ackg="ack --color --nopager"
alias to="touch"
alias mk="mkdir"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias ls='ls --color=auto'

alias for-each="$HOME/.dot-files/bin/for-each"
alias git-for-each="$HOME/.dot-files/bin/git-for-each"
alias backup-user="deja-dup --backup"
alias backup-path="$HOME/.dot-files/bin/backup"
alias backup-music="$HOME/.dot-files/bin/backup $HOME/Music bnixbook-music"
alias android-music-sync="$HOME/.dot-files/bin/android-music-sync"
alias vim="nvim"
alias vim-clean-plugins="vim +PluginClean +qall"
alias vim-update-plugins="vim +PluginUpdate +qall"
alias zsh-update-plugins=". $HOME/.oh-my-zsh/tools/check_for_upgrade.sh"
