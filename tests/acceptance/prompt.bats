#!/usr/bin/env bats

####################################################################################
# Bashlight 	: 0.1.8
# Copyright		: 2018, MIT
# Author		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

# @link https://github.com/tkuchiki/bats-travis-ci

load helper

TEST_NAME="prompt"
BATS_TEST_NAME="${TEST_NAME}"
BATS_TEST_DESCRIPTION="Testing prompt outputs"

setup() {
    echo "setup ${BATS_TEST_NAME} ..." >> ./bats.log
}

teardown() {
    echo "teardown ${BATS_TEST_NAME} ..." >> ./bats.log
}

@test "${TEST_NAME}: Test addition using bc" {
    skip "Not implemented yet"
    result="$(echo 2 + 2 | bc)"

    [ "${result}" -eq 4 ]
}
