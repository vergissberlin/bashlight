#!/usr/bin/env bats

####################################################################################
# Bashlight 	: 0.2.0
# Copyright		: 2019, MIT
# Author		: TheDevMinerTV <tobigames200@gmail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

# @link https://github.com/tkuchiki/bats-travis-ci
# bats tests/acceptance/github.bats

load ../../src/github

TEST_NAME="github"
BATS_TEST_NAME="${TEST_NAME}"
BATS_TEST_DESCRIPTION="Test github-releases"

setup() {
    echo "setup ${BATS_TEST_NAME} ..." >> ./bats.log
}

teardown() {
    echo "teardown ${BATS_TEST_NAME} ..." >> ./bats.log
}

# GitHub releases
@test "${TEST_NAME}: Test github releases" {
	run ghr 0.2.0 "GitHub-releases" "This is a bats test." --simulate
	[ "${lines[1]}" = "T35T-R4N-5Ucc355Fu11y on version \"0.2.0\" \"GitHub-releases\" with description \"This is a bats test.\"" ]
}
