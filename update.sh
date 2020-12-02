#!/bin/sh

set -eo pipefail

release=$(lsb_release -cs)
version=$1

echo 1
sudo apt-fast update
echo 2

# sudo apt-get purge 'php*'
if [ $release == 'xenial' ]
then
    apt-cache show ca-certificates-java
    sudo apt-get install ca-certificates-java
    echo 2-0
	sudo apt-fast purge 'openjdk-8-jre-headless'
    echo 2-1
	sudo apt-fast purge 'libssl1.1'
    echo 2-2
	sudo apt-fast purge 'postgresql*'
fi
echo 3
sudo apt-fast install -y libcurl4-nss-dev libjpeg-dev re2c libxml2-dev \
	libtidy-dev libxslt-dev libmcrypt-dev libreadline-dev libfreetype6-dev \
	libonig-dev zlib1g-dev libzip-dev mysql-client

echo 4
sudo ln -s /usr/include/x86_64-linux-gnu/curl /usr/local/include/curl


