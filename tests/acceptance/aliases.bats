#!/usr/bin/env bats

####################################################################################
# Bashlight 	: 0.1.8
# Copyright		: 2018, MIT
# Author		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

# @link https://github.com/tkuchiki/bats-travis-ci
# bats tests/acceptance/aliases.bats

load helper
load ../../src/aliases

TEST_NAME="aliases"
BATS_TEST_NAME="${TEST_NAME}"
BATS_TEST_DESCRIPTION="Test aliases"

setup() {
	mkdir -p tmp/directory
	touch tmp/directory/file1.txt tmp/directory/file2.txt
    echo "setup ${BATS_TEST_NAME} ..." >> ./bats.log
}

teardown() {
    echo "teardown ${BATS_TEST_NAME} ..." >> ./bats.log
    rm -Rf tmp
}

@test "${TEST_NAME}: Test if alias command exists" {
	command -v alias
}

@test "${TEST_NAME}: Test ll, ls and l list directory advanced style exists" {
	assert_alias "ll"
	assert_alias "la"
	assert_alias "l"
}

@test "${TEST_NAME}: Test alias for change directory with dots exists" {
	assert_alias ".."
	assert_alias "..."
	assert_alias "...."
	assert_alias "....."
}

# Git shortcuts
@test "${TEST_NAME}: Test \"hard\" is a \"git reset --hard\"" {
	assert_alias "hard"
}
@test "${TEST_NAME}: Test purge: git purge all unused branches" {
	assert_alias "purge"
}
@test "${TEST_NAME}: Test master: Switch to master and purge all unused branches" {
	assert_alias "master"
}
@test "${TEST_NAME}: Test staging: switch to staging branch" {
	assert_alias "staging"
}
@test "${TEST_NAME}: Test rebase: rebase against origin master" {
	assert_alias "rebase"
}

# Git micros
@test "${TEST_NAME}: Test gad: git add" {
	assert_alias "gad"
}
@test "${TEST_NAME}: Test gbr: git branch" {
	assert_alias "gbr"
}
@test "${TEST_NAME}: Test gco: git commit" {
	assert_alias "gco"
}
@test "${TEST_NAME}: Test gdi: git diff" {
	assert_alias "gdi"
}
@test "${TEST_NAME}: Test gch: git checkout" {
	assert_alias "gch"
}
@test "${TEST_NAME}: Test gpu: git pull" {
	assert_alias "gpu"
}
@test "${TEST_NAME}: Test gst: git status" {
	assert_alias "gst"
}
