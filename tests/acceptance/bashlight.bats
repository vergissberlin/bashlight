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
    BASHLIGHT_VERSION=1.2.3
}

teardown() {
    echo "teardown ${BATS_TEST_NAME} ..." >> ./bats.log
}

@test "${TEST_NAME}: Test if command exists" {
    command -v bashlight
}

@test "${TEST_NAME}: Test logo output with version number" {
	run bashlightLogo "1.4.4"
    [ "${lines[5]}" = '                           |___/  v1.4.4' ]
}

@test "${TEST_NAME}: Test license output" {
	run bashlightLicense
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = 'Copyright 2019, MIT, André Lademann' ]
}

@test "${TEST_NAME}: Test help output" {
	run bashlightHelp "1.4.4" "testflight"
    #[ "$status" -eq 0 ]
    [ "${lines[0]}" = "testflight version 1.4.4" ]
}

@test "${TEST_NAME}: Test bashlight command with logo output with version number" {
	run bashlight -v
    [ "${lines[5]}" = '                           |___/  v1.2.3' ]
    [ "${lines[6]}" = 'bashlight version 1.2.3' ]
}