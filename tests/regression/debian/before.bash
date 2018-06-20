#!/usr/bin/env bash

apt-get update
apt-get install -y \
	libcurl4-openssl-dev \
	libelf-dev \
	libdw-dev \
	cmake \
	curl \
	git \
	shellcheck \
	software-properties-common \
	tmux \
	vim \
	wget

# Install bats test framework
git clone https://github.com/sstephenson/bats.git
cd bats
./install.sh /usr/local
cd -

# Settings
echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen en_US.UTF-8
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
