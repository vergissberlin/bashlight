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

BATS_TEST_NAME="aliases"
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

@test "test if alias command exists" {
	command -v alias
}

@test "set all aliases" {
	run setAliases
	[ $status -eq 0 ]
	[ "$output" = "" ]
}

@test "ll: list directory advanced style exists" {
	run alias ll
	[ $status -eq 1 ]
}

# Git shortcuts
@test "hard: git reset hard" {
	run alias hard
	[ $status -eq 1 ]
}
@test "purge: git purge all unused branches" {
	run alias purge
	[ $status -eq 1 ]
}
@test "master: Switch to master and purge all unused branches" {
	run alias master
	[ $status -eq 1 ]
}
@test "staging: switch to staging branch" {
	run alias staging
	[ $status -eq 1 ]
}
@test "rebase: rebase against origin master" {
	run alias rebase
	[ $status -eq 1 ]
}

# Git micros
@test "ga: git add" {
	command -v go
	run alias go
	[ $status -eq 1 ]
}
@test "gb: git branch" {
	run alias gb
	[ $status -eq 1 ]
}
@test "gc: git commit" {
	run alias gc
	[ $status -eq 1 ]
}
@test "gd: git diff" {
	run alias gd
	[ $status -eq 1 ]
}
@test "go: git checkout" {
	run alias gp
	[ $status -eq 1 ]
}
@test "gp: git pull" {
	run alias gp
	[ $status -eq 1 ]
}
@test "gs: git status" {
	run alias gs
	[ $status -eq 1 ]
}
