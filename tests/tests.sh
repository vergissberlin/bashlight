#!/bin/bash

####################################################################################
# Bashlight 	: 0.1.1
# Copyright	: 2017, MIT
# Author	: André Lademann <vergissberlin@googlemail.com>
# Repository: https://github.com/vergissberlin/bashlight
####################################################################################


# Variables
PATH_INIT=$(pwd)
PATH_TESTS="${PATH_INIT}/tests"
PATH_FIXTURES="${PATH_TESTS}/fixtures"


#
# Prepare working directory
#
function setup() {
  cd ./tests
  curl -L -O https://raw.githubusercontent.com/lehmannro/assert.sh/master/assert.sh
  mkdir -p ${PATH_FIXTURES}/without-git
  mkdir -p ${PATH_FIXTURES}/with-git
  cd ${PATH_FIXTURES}/with-git && git init
  touch file
}


# Roll back
function teardown() {
  cd ${PATH_INIT}
  rm -Rf ${PATH_FIXTURES}
}


#
# Helpers
#
assert_true() {
    assert_raises "$1" 0
}

assert_false() {
    assert_raises "$1" 1
}


#
# Tests
#

setup
teardown
