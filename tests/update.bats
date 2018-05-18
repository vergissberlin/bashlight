#!/usr/bin/env bats

####################################################################################
# Bashlight 	: 0.1.2
# Copyright		: 2018, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

# @link https://github.com/tkuchiki/bats-travis-ci

load helper

BATS_TEST_NAME="Update test"
BATS_TEST_DESCRIPTION="Update test"

setup() {
    echo "setup ${BATS_TEST_NAME} ..." >> ./bats.log
}

teardown() {
    echo "teardown ${BATS_TEST_NAME} ..." >> ./bats.log
}

@test "udate needed" {
  [ 4 -eq 4 ]
}

@test "udate not needed" {
    [ 4 -eq 4 ]
}
