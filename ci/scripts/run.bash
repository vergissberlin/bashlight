#!/usr/bin/env bash

####################################################################################
# Bashlight 	: 0.1.5
# Copyright		: 2018, MIT
# Author		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

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

cd ./resource-bashlight/ || exit 1;
bash ./test/suite.bash
