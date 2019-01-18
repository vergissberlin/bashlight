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
[[ ! -z $BASHLIGHT_VERSION ]] || readonly BASHLIGHT_VERSION="0.2.1"

function bashlightLogo() {
	echo -e "\\033[34;5;;172m"
	cat -v "${BASHLIGHT_PATH}/assets/logo.txt" | sed "s/mmm/v${1}/g"
	echo -e "\\033[0m"
}

function bashlightLicense() {
	echo -e "\\033[34;5;;172m"
	cat "${BASHLIGHT_PATH}/LICENSE.md"
	echo -e "\\033[0m"
}

function bashlightHelp() {
	echo -e "${BASHLIGHT_IDENTIFIER} version ${BASHLIGHT_VERSION}"
	echo -e "Usage: ${BASHLIGHT_IDENTIFIER} [OPTIONS]\\n"
	echo -e "OPTIONS include:"
	echo -e "   -h  | --help     - displays this message"
	echo -e "   -l  | --license  - prints out the license of this script"
	echo -e "   -v  | --version  - prints out version information for this script"
	echo ""
}

function bashlight() {
	while [ "$1" != "" ]; 
	do
		case $1 in
		-h | --help ) 
			bashlightLogo ${BASHLIGHT_VERSION}
			bashlightHelp
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
			bashlightHelp
			;;
		esac
		shift
	done
}