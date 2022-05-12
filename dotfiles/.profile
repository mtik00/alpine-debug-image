#!/usr/bin/env sh

alias df='df -lh -x squashfs'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alFh --group-directories-first'
alias lt='ls -lth'
alias tpr='tput reset'
alias dns='dig +noall +answer +search'
alias randstring='cat /dev/urandom | tr -dc "[:alpha:]" | fold -w ${1:-32} | head -n 1'

cat /root/.login-message
