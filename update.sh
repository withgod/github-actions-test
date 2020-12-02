#!/bin/sh

sudo apt-fast update

# sudo apt-get purge 'php*'
if [ $release == 'xenial' ]
then
	sudo apt-fast purge 'libssl1.1'
	sudo apt-fast purge 'postgresql*'
fi
sudo apt-fast install -y libcurl4-nss-dev libjpeg-dev re2c libxml2-dev \
	libtidy-dev libxslt-dev libmcrypt-dev libreadline-dev libfreetype6-dev \
	libonig-dev zlib1g-dev libzip-dev mysql-client

sudo ln -s /usr/include/x86_64-linux-gnu/curl /usr/local/include/curl


