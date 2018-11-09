#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# update and upgrade system
apt-get update
apt-get -y upgrade

# locale
echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
locale-gen en_US.UTF-8

# setup timezone
ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# create user
user_password="JetBrains.2018"
# https://blog.sleeplessbeastie.eu/2015/09/28/how-to-programmatically-create-system-user-with-defined-password/
useradd worker --create-home --password "$user_password" --shell /bin/bash --uid 1001 --user-group
# https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart
usermod -aG sudo worker

# install essentials
apt-get install -y python-software-properties software-properties-common build-essential
apt-get install -y vim wget curl git zip unzip

# fix the random generator problem
# https://hub-support.jetbrains.com/hc/en-us/articles/206545269-Hub-hangs-up-on-start
# https://www.howtoforge.com/helping-the-random-number-generator-to-gain-enough-entropy-with-rng-tools-debian-lenny
apt-get install -y rng-tools
echo "HRNGDEVICE=/dev/urandom" >> /etc/default/rng-tools
/etc/init.d/rng-tools start

# install Java
apt-get install -y openjdk-8-jdk

# install PHP
apt-add-repository ppa:ondrej/php -y
apt-get update

apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages --allow-unauthenticated \
php7.2-cli php7.2-dev \
php7.2-pgsql php7.2-sqlite3 php7.2-gd \
php7.2-curl php7.2-memcached \
php7.2-imap php7.2-mysql php7.2-mbstring \
php7.2-xml php7.2-zip php7.2-bcmath php7.2-soap \
php7.2-intl php7.2-readline \
php-xdebug php-pear

apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages --allow-unauthenticated \
php7.1-cli php7.1-dev \
php7.1-pgsql php7.1-sqlite3 php7.1-gd \
php7.1-curl php7.1-memcached \
php7.1-imap php7.1-mysql php7.1-mbstring \
php7.1-xml php7.1-zip php7.1-bcmath php7.1-soap \
php7.1-intl php7.1-readline

apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages --allow-unauthenticated \
php7.0-cli php7.0-dev \
php7.0-pgsql php7.0-sqlite3 php7.0-gd \
php7.0-curl php7.0-memcached \
php7.0-imap php7.0-mysql php7.0-mbstring \
php7.0-xml php7.0-zip php7.0-bcmath php7.0-soap \
php7.0-intl php7.0-readline

apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages --allow-unauthenticated \
php5.6-cli php5.6-dev \
php5.6-pgsql php5.6-sqlite3 php5.6-gd \
php5.6-curl php5.6-memcached \
php5.6-imap php5.6-mysql php5.6-mbstring \
php5.6-xml php5.6-zip php5.6-bcmath php5.6-soap \
php5.6-intl php5.6-readline php5.6-mcrypt

update-alternatives --set php /usr/bin/php7.2

wget https://getcomposer.org/download/1.7.2/composer.phar
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer

# install Node and NPM
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs

# install monitoring
apt-get install -y htop
npm install -g vtop

# cleanup
apt-get -y autoremove

# prepare worker space
# https://unix.stackexchange.com/questions/118317/run-script-as-a-different-user-from-root
#su -c 'mkdir -p /home/worker/.ssh' - worker
#su -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCsCDlqhjtgsWdmSAOpn6amdPpfQtdSyZwusdeQ7yOQvK6Yck/0i8ORnPTNk8JUDeLygPzqJ91OkxUsXPGKKB5tWLNjPGusEQ5h8m+1wvBa3ZFWsDG4X166ZW2KVmzGJskJbXKXfuiaNa6qGi/yTCVV0ZRSPRG3DKS2h67P+w3OkK7T7w19zvQhLJZN2e625KvANPtMsXEPPsb6eDQ80P8K8NF16w3hTU69Z2SCKpRLeKe36WD+ItYrlB9bV/f4uGe2LYIzBxjiaUKv4ZJFm0DXvdps+ckGR0Oh0uRLkM5aRrvkC/4ISdasWcOyTCB29sD8nX8DUT9LPVba1+nOEGGZGsFkTO+QND7Ji6egWeqVayn6ujP/LF3oOPVWD3QWptbFiWsZnjuDaghqb1vwNvYgAqVeX8cOJTh54qNP7BT+t3mj0u/khjhgxTiliWSaZ+fcc7d41ympnNvkA27Ex2kUY/4msr982kxPKHMJA1FcdMR2KRyQoCUp3Mwd4bxc4I7VhGlfS+qDlY38cYbWY5nnY6FY5BdZrrz+vR129dPs3Tn9/6Vj67dgCKNtwL1jlUu1WrdX7s949qrFMuHKf4piQDb7Bseke82SsKgm5l/K+wgfDpQyZ3r+FA/INCt7q+4kaMN3KuvSyWZ4xZNss8iVdaH+B1JvfZUfQC2y/PI14w== shengyoufan@gmail.com" >> /home/worker/.ssh/authorized_keys' - worker
#su -c 'git clone https://github.com/shengyou/dotfile.git /home/worker/bin' - worker
#su -c 'bash /home/worker/bin/install.sh' - worker
