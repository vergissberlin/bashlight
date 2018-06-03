#!/usr/bin/env bash

####################################################################################
# Bashlight 	: 0.1.5
# Copyright		: 2018, MIT
# Author		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/src/aliases, instead of adding them here directly.

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then

	if ! [[ $(test -r ~/.dircolors) && $(eval "$(dircolors -b ~/.dircolors)") ]];
	then
		eval "$(dircolors -b)"
	fi

	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gp='git pull'
alias gk='gitk --all&'
alias gx='gitx --all'

alias hard="git reset --hard && git clean -fd"
alias purge='git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d'
alias master='git checkout master && git pull && git remote prune origin'
alias staging='git checkout agp-staging && git pull && git remote prune origin'
alias rebase='git pull && git rebase -i origin/master'
alias flush='git push -f'

# git typos
alias got='git '
alias get='git '

# File system
alias shared="find . -type d -exec chmod 2770 {};find . -type f -exec chmod 0660 {};"
