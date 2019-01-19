#!/usr/bin/env bash

####################################################################################
# Bashlight   : 0.2.2
# Copyright   : 2019, MIT
# Author      : André Lademann <vergissberlin@googlemail.com>
# Repository  : https://github.com/vergissberlin/bashlight
####################################################################################

# Load configuration
readonly THIS_FILE="$(dirname "$0")"
# shellcheck source=config.bash
. "${THIS_FILE}/config.bash"

# Migrate installation directory
# @version 0.2.0
# shellcheck disable=SC1090
function bashlight_migrate_020() {
  echo "Migration 0.2.0"
  echo "Your home directory is ${HOME}"
  echo "Migrate installation path from ~/bashlight to ~/.bin/bashlight"

  mkdir -p "${HOME}/.bin"
  mv "${HOME}/bashlight/" "${HOME}/.bin/"
  # shellcheck disable=SC1117
  [[ ! -f "${HOME}/.bashrc" ]] || sed -i -e "s/bashlight\/bashlight/\.bin\/bashlight\/bashlight/g" "${HOME}/.bashrc"
  # shellcheck disable=SC1117
  [[ ! -f "${HOME}/.bash_profile" ]] || sed -i -e "s/bashlight\/bashlight/\.bin\/bashlight\/bashlight/g" "${HOME}/.bash_profile"
  # shellcheck disable=SC1117
  [[ ! -f "${HOME}/.profile" ]] || sed -i -e "s/bashlight\/bashlight/\.bin\/bashlight\/bashlight/g" "${HOME}/.bashrc"
}


[[ ! -d "${HOME}/bashlight" ]] || bashlight_migrate_020
