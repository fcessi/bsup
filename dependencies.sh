#!/bin/bash
echo "install requirements tools for this project"
sudo apt update ##update repository
sudo apt install php7.1 -y #install php7.1
sudo apt install nginx -y #install nginx web server
sudo apt install -y  php-common php-fpm php-mbstring php-tokenizer php-xml php-curl php-mysql php-zip php-bcmath php-json #install php modules
echo " install composer on ubuntu 20.04"
sudo apt install php-cli unzip -y
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo composer

sudo composer install --optimize-autoloader 


echo " install npm "
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs -y
sudo apt install build-essential -y


echo " install supervisor"
sudo apt-get install supervisor -y
sudo service supervisor restart
cat > script.conf <<EOF
[program:laravel-worker-aws]

process_name=%(program_name)s_%(process_num)02d

command=php /PATH_TO_PROJECT/artisan queue:work --tries=3

autostart=true

autorestart=true

user=root

numprocs=4

redirect_stderr=true

stdout_logfile=/PATH_TO_PROJECT/storage/logs/worker.log 
EOF
sudo service supervisor restart




echo " add job to crontab"

echo  " * * * * * php /var/www/medvoice/artisan schedule:run >> /dev/null 2>&1 " >> /etc/crontab
sudo service crontab restart






echo " install mysql "
sudo apt install mysql-server -y # install mysql server 
sudo mysql_secure_installation #install secure mysql by credentials 
PASS=`pwgen -s 40 1`

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE $1;
CREATE USER '$1'@'localhost' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $1.* TO '$1'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL user created."
echo "Username:   $1"
echo "Password:   $PASS"
mysql -u root -proot < file.sql

sudo php artisan key:generate

sudo php artisan passport:install

sudo php artisan storage:link

sudo php artisan optimize:config

sudo npm install

sudo npm run production 


echo "  Setup appropriate permission using"
sudo chgrp -R www-data storage bootstrap/cache

sudo chmod -R ug+rwx storage bootstrap/cache

