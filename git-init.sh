#!/bin/sh

####################################################################################
# Bashly 	: 0.1.0
# Copyright	: 2014, MIT
# Author	: André Lademann <vergissberlin@googlemail.com>
# Repository: https://github.com/vergissberlin/bashlight
####################################################################################


## aliases
git config --global alias.br 'branch'
git config --global alias.ci 'commit -a'
git config --global alias.co 'checkout'
git config --global alias.di 'diff'
git config --global alias.dump 'cat-file -p'
git config --global alias.hist 'log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'
git config --global alias.sl 'log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
git config --global alias.st 'status --ignore-submodules=all'
git config --global alias.type 'cat-file -t'

## branch setting
git config --global branch.autosetuprebase always


## colours
git config --global color.branch.current yellow
git config --global color.branch.local yellow
git config --global color.branch.remote green

git config --global color.diff.meta yellow bold
git config --global color.diff.frag magenta bold
git config --global color.diff.old red bold
git config --global color.diff.new green bold

git config --global color.grep auto

git config --global color.interactive auto

git config --global color.push.default current

git config --global color.status.added green bold
git config --global color.status.changed yellow
