alias ll='ls -alsh'
alias c='clear'
alias grep='grep --color=auto -n'
alias grpe='grep --color=auto -n'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias notes='vim ~/.notes.txt'

alias python=python3
alias pip=pip3

alias new="echo 'tmux new -s session_name'; tmux new -s "
alias list="echo 'tmux list-sessions'; tmux list-sessions"
alias detach="echo 'tmux detach'; tmux detach"
alias attach="echo 'tmux attach -t session_name'; tmux attach -t "
alias switch="echo 'tmux switch -t session_name'; tmux switch -t "
alias killsess='tmux kill-session'

alias sctl='systemctl --user '
alias jctl='journalctl --user '
