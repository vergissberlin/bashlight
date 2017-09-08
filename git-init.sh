#!/bin/sh

####################################################################################
# Bashlight 	: 0.1.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

# Preparing
mkdir -p ~/.git

# User settings
if [ -z "$(git config --global --get user.name)" ]; then
  read -p "What's your name? " name
  if [ "${name}" !== "" ]; then
    git config --global user.name "${name}"
  fi
fi

if [ -z "$(git config --global --get user.email)" ]; then
  read -p "What is your git email address? " email
  if [ "${email}" != "" ]; then
    git config --global user.email ${email}
  fi
fi

## Aliases
git config --global alias.br 'branch -av'
git config --global alias.ci 'commit -a'
git config --global alias.co 'checkout'
git config --global alias.di 'diff'
git config --global alias.dump 'cat-file -p'
git config --global alias.fush 'push -f'
git config --global alias.hist 'log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'
git config --global alias.prune 'fetch origin --prune'
git config --global alias.sl 'log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
git config --global alias.st 'status --ignore-submodules=all'
git config --global alias.tush 'push --tags'
git config --global alias.type 'cat-file -t'

## Branch setting
git config --global branch.autosetuprebase always

## Tag setting
git config --global remote.origin.tagopt --tags

## Colours
git config --global color.branch.current yellow
git config --global color.branch.local cyan
git config --global color.branch.remote green

git config --global color.diff.meta yellow bold
git config --global color.diff.frag magenta bold
git config --global color.diff.old cyan bold
git config --global color.diff.new green bold

git config --global color.grep auto
git config --global color.interactive auto
git config --global color.push.default current

git config --global color.status.added green bold
git config --global color.status.changed yellow

echo "    ✓  All git configuration setted."
