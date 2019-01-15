#!/usr/bin/env bash

####################################################################################
# Bashlight 	: 0.2.1
# Copyright		: 2019, MIT
# Author		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

bats ./tests/acceptance/
shellcheck -x ./bashlight
shellcheck -x ./*.bash
shellcheck -x ./**/*.bash
yamllint .
