#!/bin/sh

####################################################################################
# Bashlight 	: 0.1.2
# Copyright		: 2018, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

if [ -z "${1}" ]; then
	PATH_BASHLIGHT="${HOME}/bashlight"
else
  PATH_BASHLIGHT="${1}"
fi

GIT_DIR=${PATH_BASHLIGHT}/.git

VERSION_LOCAL=$(GIT_DIR=~/bashlight/.git git describe --tags --abbrev=0)
DAY_UPDATE=~/bashlight/DAY_UPDATE
DAY_TODAY=$(date +%j)

function version_gt() {
  test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "${1}";
}


# Update check only once a day
if [ ! -f ${DAY_UPDATE} ]; then
  echo ${DAY_TODAY} > ${DAY_UPDATE}
fi

if [ ${DAY_TODAY} -le $(cat ${DAY_UPDATE}) ]; then
  echo -e "\033[34;5;;172mBashlight ${VERSION_LOCAL}\033[0m"
else
  # Update check
  VERSION_REMOTE=$(git ls-remote --tags git@github.com:vergissberlin/bashlight.git | sort -t '/' -k 3 -V | awk -F/ '{ print $3 }' | tail -1)

  if version_gt ${VERSION_REMOTE} ${VERSION_LOCAL}; then
    echo -e "\a";
    echo -e "\033[34;5;;172m"\
     "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n"\
     "┃ Bashlight update notice                        ┃\n"\
     "┠────────────────────────────────────────────────┨\n"\
     "┃ Your version:    ${VERSION_LOCAL}                         ┃\n"\
     "┃ Current version: ${VERSION_REMOTE}                         ┃\n"\
     "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n"\
     "\033[0m"

     while true; do
       read -p "Do you wish to install this program (yes/no)? " yn
       case ${yn} in
         [Yy]* ) GIT_DIR=~/bashlight/.git git pull --tags; echo ${DAY_TODAY} > ${DAY_UPDATE}; break;;
         [Nn]* ) break;;
         * ) echo "Please answer yes or no.";;
       esac
     done

  else
    echo -e "\033[34;5;;172mBashlight ${VERSION_LOCAL}\033[0m"
  fi
fi
