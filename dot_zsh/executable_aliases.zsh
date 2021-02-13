alias ls='ls --color=auto'
alias cls='colorls'
alias lsf='ls --group-directories-first --color=auto'
alias mkdir='mkdir -p'
alias cp='cp -r --reflink=auto'
alias gz='tar -xvzf'
alias xz='tar -xJf'
alias bz='tar -xvjf'
alias bz2='tar -jxvf'
alias ping='ping -c 5'
alias kill='sudo pkill'
alias locate='locate -i'
alias grep='grep --color'
alias task='ps aux | grep'

alias ldtor="export LD_PRELOAD=/usr/lib/torsocks/libtorsocks.so"
alias check-tor='curl --socks5 localhost:9050 --socks5-hostname localhost:9050 -s https://check.torproject.org/ | ccat | grep -m 1 Congratulations | xargs'

alias start-dns='sudo systemctl start dnscrypt-proxy'
alias stop-dns='sudo systemctl stop dnscrypt-proxy'
alias restart-dns='sudo systemctl restart dnscrypt-proxy'
alias status-dns='systemctl status dnscrypt-proxy'

alias start-psql='sudo systemctl start postgresql.service'
alias restart-psql='sudo systemctl restart postgresql.service'
alias stop-psql='sudo systemctl stop postgresql.service'
alias status-psql='systemctl status postgresql.service'

alias start-tor='sudo systemctl start tor.service'
alias restart-tor='sudo systemctl restart tor.service'
alias stop-tor='sudo systemctl stop tor.service'
alias status-tor='systemctl status tor.service'

alias start-web='sudo systemctl start httpd.service && sudo systemctl start mariadb.service && sudo systemctl start php-fpm.service'
alias restart-web='sudo systemctl restart httpd.service && sudo systemctl restart mariadb.service && sudo systemctl restart php-fpm.service'
alias stop-web='sudo systemctl stop httpd.service && sudo systemctl stop mariadb.service && sudo systemctl stop php-fpm.service'

alias status-httpd='systemctl status httpd.service'
alias status-mysql='systemctl status mariadb.service'
alias status-php='systemctl status php-fpm.service'

alias uplist='sudo reflector --score 100 --fastest 25 --sort rate --verbose --save /etc/pacman.d/mirrorlist'
alias loginpsql='sudo -u postgres -i psql'
alias getube='youtube-dl --extract-audio --audio-format mp3 --add-metadata -x'

alias upfont='fc-cache -f -v'
alias upres='xrdb ~/.Xresources'
alias delfile='rm ~/.local/share/recently-used.xbel'
alias delhis='cat /dev/null > ~/.zsh_history'
alias delcac='sudo du -sh ~/.cache/ && sudo rm -rf ~/.cache/*'

alias tmux-ns='tmux new-session -s'
alias tmux-re='tmux rename-session -t'
alias tmux-as='tmux attach-session -t'
alias tmux-ks='tmux kill-session -t'
alias tmux-ch='tmux clear-history -t'
alias tmux-ls='tmux list-sessions'
alias tmux-lcs='tmux lock-session -t'
alias tmux-lcc='tmux lock-client -t'
alias tmux-nw='tmux new-window \; split-window -d'