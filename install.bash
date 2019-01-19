#!/usr/bin/env bash

####################################################################################
# Bashlight 	: 0.2.2
# Copyright		: 2019, MIT
# Author		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

# Load configuration
readonly THIS_FILE=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# shellcheck source=config.bash
. "${THIS_FILE}/config.bash"

# shellcheck source=install/git.bash
. "${BASHLIGHT_PATH}/install/git.bash"

# shellcheck source=install/tmux.bash
. "${BASHLIGHT_PATH}/install/tmux.bash"
