#!/usr/bin/env bash

####################################################################################
# Bashlight 	: 0.2.2
# Copyright		: 2019, MIT
# Author  		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

# Load configuration
readonly THIS_FILE="$(dirname "$0")"
# shellcheck source=config.bash
. "${THIS_FILE}/config.bash"

GIT_DIR="${BASHLIGHT_PATH}/.git"
GIT_REPOSITORY="https://github.com/vergissberlin/bashlight.git"

VERSION_LOCAL="$(GIT_DIR=${GIT_DIR} git describe --tags --abbrev=0)"
DAY_UPDATE=${BASHLIGHT_PATH}/DAY_UPDATE
DAY_TODAY="$(date +%j)"

function version_gt() {
  test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "${1}";
}

# Update check only once a day
if [ ! -f "${DAY_UPDATE}" ]; then
  echo "${DAY_TODAY}" > "${DAY_UPDATE}"
fi

if [ "${DAY_TODAY}" -le "$(cat "${DAY_UPDATE}")" ]; then
  echo -e "\\033[34;5;;172mBashlight ${VERSION_LOCAL}\\033[0m"
else
  # Update check
  VERSION_REMOTE=$(git ls-remote --tags ${GIT_REPOSITORY} | sort -t '/' -k 3 -V | awk -F/ '{ print $3 }' | tail -1)

  if version_gt "${VERSION_REMOTE}" "${VERSION_LOCAL}"; then
    echo -e "\\a";
    echo -e "\\033[34;5;;172m"\
     "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\\n"\
     "┃ Bashlight update notice                        ┃\\n"\
     "┠────────────────────────────────────────────────┨\\n"\
     "┃ Your version:    ${VERSION_LOCAL}                         ┃\\n"\
     "┃ Current version: ${VERSION_REMOTE}                         ┃\\n"\
     "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\\n"\
     "\\033[0m"

     while true; do
       read -rp "Do you wish to install this program (Y/n)? " yn
       case ${yn} in
         [Nn]* ) break;;
         * ) GIT_DIR=${BASHLIGHT_PATH}/.git git pull;GIT_DIR=${BASHLIGHT_PATH}/.git git pull --tags; echo "${DAY_TODAY}" > "${DAY_UPDATE}"; break;;
       esac
     done
  else
    echo -e "\\033[34;5;;172mBashlight ${VERSION_LOCAL}\\033[0m"
  fi
fi
