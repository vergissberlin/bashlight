#!/bin/sh

####################################################################################
# Bashly 	: 0.1.0
# Copyright	: 2014, MIT
# Author	: André Lademann <vergissberlin@googlemail.com>
# Repository: https://github.com/vergissberlin/bashlight
####################################################################################

# ~/.bash_logout: executed by bash(1) when login shell exits.
# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
	[ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
