#!/usr/bin/env bats

####################################################################################
# Bashlight  : 0.2.2
# Copyright  : 2019, MIT
# Author     : André Lademann <vergissberlin@googlemail.com>
# Repository : https://github.com/vergissberlin/bashlight
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
    assert_line 5 "                           |___/  v1.4.4"
    assert_success
}

@test "${TEST_NAME}: Test logo output without version number" {
	run bashlightLogo
    assert_failure
    [ "$status" -eq 128 ]
}

@test "${TEST_NAME}: Test license output" {
	run bashlightLicense
    assert_line "Copyright 2019, MIT, André Lademann"
    assert_success
}

@test "${TEST_NAME}: Test help output" {
	run bashlightHelp "1.4.4" "testflight"
    assert_line "testflight version 1.4.4"
    assert_success
}

@test "${TEST_NAME}: Test help output without parameter" {
	run bashlightHelp
    assert_failure
    [ "$status" -eq 128 ]
}

@test "${TEST_NAME}: Test bashlight command without parameter" {
	run bashlight 
    assert_failure
    [ "$status" -eq 128 ]
}

@test "${TEST_NAME}: Test bashlight command with not enough parameter" {
	run bashlight "144"
    assert_failure
    [ "$status" -eq 128 ]
}

@test "${TEST_NAME}: Test bashlight command with --help parameter" {
	run bashlight --help
    assert_line 5 "                           |___/  v1.2.3"
    assert_line 6 "bashlight version 1.2.3"
    assert_line 7 "Usage: bashlight [OPTIONS]"
    assert_success
}

@test "${TEST_NAME}: Test bashlight command with --license parameter" {
	run bashlight --license
    assert_line "Copyright 2019, MIT, André Lademann"
    assert_success
}

@test "${TEST_NAME}: Test bashlight command with --version number" {
	run bashlight --version
    assert_line 5 "                           |___/  v1.2.3"
    assert_line 6 "bashlight version 1.2.3"
    assert_success
}
