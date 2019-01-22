#!/usr/bin/env bash

#
# Helpers
#
load ../helpers/assertions/all

# Custom helpers
assert_alias() {
  	assert_equal $(alias "${1}" 2>/dev/null >/dev/null && echo "true") true
}
