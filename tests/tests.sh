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
PATH_HELPER="${PATH_TESTS}/helper"
PATH_FIXTURES="${PATH_TESTS}/fixtures"
PROMPT_DEFAULT=$PS1


#
# Prepare working directory
#
function setup() {
  mkdir -p ${PATH_HELPER}
  mkdir -p ${PATH_FIXTURES}

  # Download helper
  curl -L -o ${PATH_HELPER}/assert.sh -O https://raw.githubusercontent.com/lehmannro/assert.sh/master/assert.sh
  curl -L -o ${PATH_HELPER}/is.sh -O https://raw.githubusercontent.com/qzb/is.sh/master/is.sh

  # Include helper
  . ${PATH_HELPER}/assert.sh
  . ${PATH_HELPER}/is.sh

  cd ./tests
  mkdir -p ${PATH_FIXTURES}/without-git
  mkdir -p ${PATH_FIXTURES}/with-git
  cd ${PATH_FIXTURES}/with-git && git init
  touch file
}

# tests

function test_prompt() {
  echo ${PROMPT_DEFAULT}
  . ${PATH_INIT}/bashlight

  PROMPT_CUSTOM=$PS1
  echo ${PROMPT_CUSTOM}

  if is not equal $PROMPT_DEFAULT $PROMPT_CUSTOM; then
    echo "Prompt is not equal"
  else
    echo "Prompt is equal"
  fi
  PS1=$PROMPT_DEFAULT
}

# Roll back
function teardown() {
  cd ${PATH_INIT}
  rm -Rf ${PATH_FIXTURES} ${PATH_HELPER}
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
test_prompt
teardown
