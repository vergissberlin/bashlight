#!/usr/bin/env bash

####################################################################################
# Bashlight 	: 0.2.2
# Copyright		: 2019, MIT
# Author		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

####################################################################################
# Commandline
####################################################################################

[[ ! -z $BASHLIGHT_IDENTIFIER ]] || readonly BASHLIGHT_IDENTIFIER="bashlight"
[[ ! -z $BASHLIGHT_VERSION ]] || BASHLIGHT_VERSION="0.2.2"

function bashlightLogo() {
	if [ "$1" == "" ]; then
		return 128
	fi
	cat -v "${BASHLIGHT_PATH}/assets/logo.txt" | sed "s/mmm/v${1}/g"
}

function bashlightLicense() {
	cat "${BASHLIGHT_PATH}/LICENSE.md"
}

function bashlightHelp() {
	if [ "$1" == "" ] || [ "$2" == "" ]; then
		return 128
	fi
	echo -e "${2} version ${1}"
	echo -e "Usage: ${2} [OPTIONS]\\n"
	echo -e "OPTIONS include:"
	echo -e "   -h  | --help     - displays this message"
	echo -e "   -l  | --license  - prints out the license of this script"
	echo -e "   -v  | --version  - prints out version information for this script"
	echo ""
}

function bashlight() {
	if [ "$1" == "" ]; then
		bashlightLogo ${BASHLIGHT_VERSION}
		bashlightHelp ${BASHLIGHT_VERSION} ${BASHLIGHT_IDENTIFIER}
		return 128
	fi
	while [ "$1" != "" ]; 
	do
		case $1 in
		-h | --help ) 
			bashlightLogo ${BASHLIGHT_VERSION}
			bashlightHelp ${BASHLIGHT_VERSION} ${BASHLIGHT_IDENTIFIER}
			;;
		-l | --license ) 
			bashlightLicense
			;;
		-v | --version )
			bashlightLogo ${BASHLIGHT_VERSION}
			echo -e "${BASHLIGHT_IDENTIFIER} version ${BASHLIGHT_VERSION}"
			;;
		* ) 
			echo -e "Invalid option: ${1}\\n"
			bashlightHelp ${BASHLIGHT_VERSION} ${BASHLIGHT_IDENTIFIER}
			return 128
			;;
		esac
		shift
	done
}