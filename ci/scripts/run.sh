#!/usr/bin/env bash

export CI=true
export TERM=xterm

figlet "bashlight"
figlet -f digital "Run tests"

echo
echo
echo "$(uname -a)"
echo
[ -e /etc/lsb-release ] && cat /etc/lsb-release
echo

cd ./resource-bashlight/
bash ./test/suite.sh
