#!/bin/bash

service mysql start

chown -R www-data /var/www/*
chmod -R 755 /var/www/*

openssl req -x509 -days 365 -newkey rsa:2048 -keyout ca.key -nodes -out ca.crt -subj '/C=RU/ST=Moscow/L=Moscow/O=21school/OU=21/CN=msafflow' \
		-out /etc/ssl/certs/myserver.crt -keyout /etc/ssl/certs/myserver.key

echo "create database wordpress; 
	alter user 'root'@'localhost' IDENTIFIED BY 'root'; 
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION; 
	flush privileges;" | mysql

mv srcs/nginx.conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
rm -rf /etc/nginx/sites-enabled/default
rm -rf /etc/nginx/sites-available/default

mv srcs/config.inc.php /var/www/html/phpmyadmin/
mv srcs/wp-config.php /var/www/html/wordpress/

service php7.3-fpm start
service nginx start

bash
