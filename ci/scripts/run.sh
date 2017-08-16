#!/usr/bin/env bash

export CI=true
export TERM=xterm

figlet "bashlib"
figlet -f digital "Run tests"

echo
echo
echo "$(uname -a)"
echo
[ -e /etc/lsb-release ] && cat /etc/lsb-release
echo

cd ./resource-bashlib/
sh ./test/suite.sh
