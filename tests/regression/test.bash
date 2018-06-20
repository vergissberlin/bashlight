#!/usr/bin/env bash

cd /home/vagrant/bashlight/

bats ./tests/acceptance/

shellcheck bashlight
shellcheck *.bash
shellcheck **/*.bash

cd -
