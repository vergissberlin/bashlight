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
@test "${TEST_NAME}: Test set all aliases" {
	run setAliases
	[ $status -eq 0 ]
	[ "$output" = "" ]
}
@test "${TEST_NAME}: Test ll list directory advanced style exists" {
	run alias ll
	[ $status -eq 1 ]
}

# Git shortcuts
@test "${TEST_NAME}: Test \"hard\" is a \"git reset --hard\"" {
	run alias hard
	[ $status -eq 1 ]
}
@test "${TEST_NAME}: Test purge: git purge all unused branches" {
	run alias purge
	[ $status -eq 1 ]
}
@test "${TEST_NAME}: Test master: Switch to master and purge all unused branches" {
	run alias master
	[ $status -eq 1 ]
}
@test "${TEST_NAME}: Test staging: switch to staging branch" {
	run alias staging
	[ $status -eq 1 ]
}
@test "${TEST_NAME}: Test rebase: rebase against origin master" {
	run alias rebase
	[ $status -eq 1 ]
}

# Git micros
@test "${TEST_NAME}: Test gad: git add" {
	run alias gad
	[ $status -eq 1 ]
}
@test "${TEST_NAME}: Test gbr: git branch" {
	run alias gbr
	[ $status -eq 1 ]
}
@test "${TEST_NAME}: Test gco: git commit" {
	run alias gco
	[ $status -eq 1 ]
}
@test "${TEST_NAME}: Test gdi: git diff" {
	run alias gdi
	[ $status -eq 1 ]
}
@test "${TEST_NAME}: Test gch: git checkout" {
	run alias gch
	[ $status -eq 1 ]
}
@test "${TEST_NAME}: Test gpu: git pull" {
	run alias gpu
	[ $status -eq 1 ]
}
@test "${TEST_NAME}: Test gst: git status" {
	run alias gst
	[ $status -eq 1 ]
}
