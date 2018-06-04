#!/usr/bin/env bash

####################################################################################
# Bashlight 	: 0.1.8
# Copyright		: 2018, MIT
# Author		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

SESSION="bashlight"
TMUX="TMUX -2 -f TMUX.conf"

# If the session is already running, just attach to it.
${TMUX} has-session -t ${SESSION}

# shellcheck disable=SC2181
if [ $? -eq 0 ]; then
	echo "Session ${SESSION} already exists. Attaching."
	sleep 1
	${TMUX} attach -t ${SESSION}
	exit 0;
fi

# create a new session, named ${SESSION}, and detach from it
${TMUX} new-session -d -s ${SESSION}
${TMUX} new-window    -t ${SESSION}:0
${TMUX} split-window  -h -t ${SESSION}:0
${TMUX} new-window    -t ${SESSION}:1
${TMUX} new-window    -t ${SESSION}:2
${TMUX} new-window    -t ${SESSION}:3
${TMUX} split-window  -h -t ${SESSION}:3
${TMUX} new-window    -t ${SESSION}:4
${TMUX} select-window -t ${SESSION}:0
${TMUX} attach -t ${SESSION}
