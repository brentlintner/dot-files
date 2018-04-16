alias desktop-apps="grep -niE '^(name|exec)=' {$HOME/.local/share/applications/*,/usr/share/applications/*}"
alias pwsh="TERM=xterm pwsh"
alias t="npm -s t"
alias xo="xdg-open"
alias v="vim"

alias plex-start="sudo systemctl enable --now plexmediaserver.service"
alias plex-stop="sudo systemctl disable --now plexmediaserver.service"
alias ncu="npm-check-updates"

alias pacman="pacman --color always"
alias pa="trizen"
alias pa-updates='pa -Qu --color always'
alias pa-installed='pa -Qn --color always'
alias pa-installed-aur='pa -Qm --color always'
alias pa-autoremove='sudo pacman -R $(pacman -Qdtq)'
alias calc=gcalccmd
alias incognito-ca="sudo openvpn ~/.airvpn/AirVPN_Canada_UDP-443.ovpn"
alias ufw-rejects="sudo iptables -S | grep -P 'REJECT|DENIED|DENY'"
alias ufw-accepts="sudo iptables -S | grep ACCEPT"
alias errorlog="journalctl -p 3 -xb"
alias systemlog="journalctl -xe"

alias r="rspec"
alias rr="spring rspec"
alias nbuild="npm run compile -s"
alias gitk="tig"
alias git="hub"
alias git-view-merged='git branch --merged | grep -v "\*"'
alias git-delete-merged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias g="git s"
alias gl="git l"
alias gpr="git pull-request"

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
alias vim-update-plugins="vim +PluginUpdate +qall"
alias zsh-update-plugins=". $HOME/.oh-my-zsh/tools/check_for_upgrade.sh"
