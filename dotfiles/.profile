#!/usr/bin/env sh

alias df='df -lh -x squashfs'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alFh --group-directories-first'
alias lt='ls -lth'
alias tpr='tput reset'
alias dns='dig +noall +answer +search'
alias randstring='cat /dev/urandom | tr -dc "[:alpha:]" | fold -w ${1:-32} | head -n 1'

function seecert () {
    pemfile=$(mktemp)
    textfile=$(mktemp)
    openssl s_client -connect $1:443 -showcerts 2>&1 </dev/null | openssl x509 -outform pem > "${pemfile}"
    openssl x509 -in "${pemfile}" -noout -text > "${textfile}"
    grep -E "Issuer:" "${textfile}"
    grep -E "Subject:" "${textfile}"
    grep -E "Not (Before|After)" "${textfile}"
}

cat /root/.login-message
