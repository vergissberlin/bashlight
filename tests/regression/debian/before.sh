#!/usr/bin/env bash

apt-get update
apt-get install -y \
	curl \
	git \
	tmux \
	vim \
	wget

update-alternatives --set editor /usr/bin/vim.basic

if [ ! -d "/home/vagrant/bashlight" ]; then
	cd /home/vagrant
	git clone https://github.com/vergissberlin/bashlight.git
else
	cd /home/vagrant/bashlight
	git checkout master
	git pull origin master
fi

chown -R vagrant:vagrant /home/vagrant/
