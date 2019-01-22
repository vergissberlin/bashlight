#!/usr/bin/env bats

####################################################################################
# Bashlight 	: 0.1.8
# Copyright		: 2018, MIT
# Author		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

# @link https://github.com/tkuchiki/bats-travis-ci
# bats tests/acceptance/bashlight.bats

load helper
load ../../src/bashlight

TEST_NAME="bashlight"
BATS_TEST_NAME="${TEST_NAME}"
BATS_TEST_DESCRIPTION="Test bashlight"

setup() {
    echo "setup ${BATS_TEST_NAME} ..." >> ./bats.log
    echo "path: ${BASHLIGHT_PATH}"
	BASHLIGHT_PATH="${HOME}/.bin/bashlight"
}

teardown() {
    echo "teardown ${BATS_TEST_NAME} ..." >> ./bats.log
}

@test "${TEST_NAME}: Test if command exists" {
    command -v bashlight
}

@test "${TEST_NAME}: Test if command exists" {
  run bashlight
  [ "$status" -eq 0 ]
}

@test "${TEST_NAME}: Test logo output with version number" {
	run bashlightLogo "1.2.3"
    pwd
    ls -lisah .
    ls -lsiah ${BASHLIGHT_PATH}
    [ "${lines[6]}" == '                           |___/  v1.2.3' ]
}
