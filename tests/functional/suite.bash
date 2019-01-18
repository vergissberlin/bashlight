#!/bin/bash

####################################################################################
# Bashlight 	: 0.1.8
# Copyright		: 2018, MIT
# Author		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################


# Variables
BASHLIGHT_PATH=$(pwd)
PROMPT_DEFAULT=${PS1}
readonly PATH_TESTS="${BASHLIGHT_PATH}/tests"
readonly PATH_HELPER="${PATH_TESTS}/helper"
readonly PATH_FIXTURES="${PATH_TESTS}/fixtures"

#
# Prepare working directory
#
function setup() {
  mkdir -p "${PATH_HELPER}"
  mkdir -p "${PATH_FIXTURES}"

  # Download helper
  curl -L -o "${PATH_HELPER}/assert.sh" -O https://raw.githubusercontent.com/lehmannro/assert.sh/master/assert.sh
  curl -L -o "${PATH_HELPER}/is.sh" -O https://raw.githubusercontent.com/qzb/is.sh/master/is.sh

  # Include helpe
  # shellcheck disable=SC1090
  . "${PATH_HELPER}/assert.sh"
  # shellcheck disable=SC1090
  . "${PATH_HELPER}/is.sh"

  # Create fixtures
  mkdir -p "${PATH_FIXTURES}/without-git"
  mkdir -p "${PATH_FIXTURES}/with-git"
  cd "${PATH_FIXTURES}/with-git" && git init
  touch file
}

#
# Tests
#
function test_prompt() {
  echo "${PROMPT_DEFAULT}"
  # shellcheck source=bashlight
  . "${BASHLIGHT_PATH}/bashlight" || exit 1;

  PROMPT_CUSTOM="${PS1}"
  echo "${PROMPT_CUSTOM}"

  if is not equal "${PROMPT_DEFAULT}" "${PROMPT_CUSTOM}"; then
    echo "Prompt is not equal"
    exit 1;
  else
    echo "Prompt is equal"
  fi
  PS1="${PROMPT_DEFAULT}"
}


#
# Tests
#
function test_update() {
  echo "${PROMPT_DEFAULT}"

  # shellcheck source=bashlight
  . "${BASHLIGHT_PATH}/bashlight"

  PROMPT_CUSTOM="${PS1}"
  echo "${PROMPT_CUSTOM}"

  if is not equal "${PROMPT_DEFAULT}" "${PROMPT_CUSTOM}"; then
    echo "Prompt is not equal"
    exit 1;
  else
    echo "Prompt is equal"
  fi
  PS1=${PROMPT_DEFAULT}
}


# Roll back
function teardown() {
  cd "${BASHLIGHT_PATH}" || exit 1;
  rm -Rf "${PATH_FIXTURES}" "${PATH_HELPER}"
  assert_end bashlight
}


#
# Helpers
#
assert_true() {
  assert_raises "${1}" 0
}

assert_false() {
  assert_raises "${1}" 1
}


#
# Tests
#
setup
test_prompt "$@"
teardown
