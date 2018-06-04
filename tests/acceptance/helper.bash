#!/usr/bin/env bash

#
# Helpers
#

assert_equal() {
    if [ "${1}" != "${2}" ]; then
        echo "${1} != ${2}"
        return 1
    fi
}

assert_true() {
  assert_raises "$1" 0
}

assert_false() {
  assert_raises "$1" 1
}
