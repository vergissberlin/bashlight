#!/usr/bin/env bats

####################################################################################
# Bashlight   : 0.2.1
# Copyright   : 2019, MIT
# Author      : André Lademann <vergissberlin@googlemail.com>
# Repository  : https://github.com/vergissberlin/bashlight
####################################################################################

# @link https://github.com/tkuchiki/bats-travis-ci

load helper

TEST_NAME="migrate"
BATS_TEST_NAME="${TEST_NAME}"
BATS_TEST_DESCRIPTION="Test migrations after breaking updates"
TEMP_DIRECTORY=tests/tmp

setup() {
    echo "setup ${BATS_TEST_NAME} ..." >> ./bats.log
    mkdir -p ${TEMP_DIRECTORY}
    cp -r tests/fixtures/0.2.0/ ${TEMP_DIRECTORY}
}

teardown() {
    echo "teardown ${BATS_TEST_NAME} ..." >> ./bats.log
    rm -rf ${TEMP_DIRECTORY}
}

@test "${TEST_NAME}: Test migration is needed: returns 1 if migration was successfull" {
  skip "Not implemented yet"
  # run HOME="$(pwd)/${TEMP_DIRECTORY}" migrate.bash
  # $[ ! "$output" = "Migrate installation path from ~/bashlight to ~/.bin/bashlight" ]
}
