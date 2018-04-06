#!/usr/bin/env bash

# update and upgrade system
apt update
apt -y upgrade

# locale
echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
locale-gen en_US.UTF-8

# setup timezone
ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# install essentials
apt install -y software-properties-common
apt install -y build-essential
apt install -y vim wget curl zip unzip

# fix the random generator problem
# https://hub-support.jetbrains.com/hc/en-us/articles/206545269-Hub-hangs-up-on-start
# https://www.howtoforge.com/helping-the-random-number-generator-to-gain-enough-entropy-with-rng-tools-debian-lenny
apt install -y rng-tools
echo "HRNGDEVICE=/dev/urandom" >> /etc/default/rng-tools
/etc/init.d/rng-tools start

# install Java
apt install -y default-jre

# install PHP and Composer
apt-add-repository ppa:ondrej/php -y
apt update

apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
php7.1-cli php7.1-dev \
php7.1-pgsql php7.1-sqlite3 php7.1-gd \
php7.1-curl php7.1-memcached \
php7.1-imap php7.1-mysql php7.1-mbstring \
php7.1-xml php7.1-zip php7.1-bcmath php7.1-soap \
php7.1-intl php7.1-readline

apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
php7.0-cli php7.0-dev \
php7.0-pgsql php7.0-sqlite3 php7.0-gd \
php7.0-curl php7.0-memcached \
php7.0-imap php7.0-mysql php7.0-mbstring \
php7.0-xml php7.0-zip php7.0-bcmath php7.0-soap \
php7.0-intl php7.0-readline

apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
php5.6-cli php5.6-dev \
php5.6-pgsql php5.6-sqlite3 php5.6-gd \
php5.6-curl php5.6-memcached \
php5.6-imap php5.6-mysql php5.6-mbstring \
php5.6-xml php5.6-zip php5.6-bcmath php5.6-soap \
php5.6-intl php5.6-readline php5.6-mcrypt

update-alternatives --set php /usr/bin/php7.2

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# install Node and NPM
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt install -y nodejs

# install monitoring
apt install -y htop
npm install -g vtop

# cleanup
apt -y autoremove
