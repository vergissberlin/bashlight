#!/usr/bin/env bash

#
# Helpers
#
load ../helpers/assertions/all

# Custom helpers
assert_alias() {
    # shellcheck disable=SC2046
  	assert_equal $(alias "${1}" 2>/dev/null >/dev/null && echo "true") true
}
