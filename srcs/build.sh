service mysql start

chown -R www-data /var/www/*
chmod -R -rwxr-xr-x /var/www/*

mkdir /var/www/ft_server && touch /var/www/ft_server/index.php

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/ft_server.pem -keyout /etc/nginx/ssl/ft_server.key -subj "C=RU/ST=Moscow/L=Moscow/O=21 School/OU=msafflow/CN=msafflow"

mv ./tmp/nginx-conf /etc/nginx/sites-available/ft_server
ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled/ft_server
rm -rf /etc/nginx/sites-enabled/default

mkdir /var/www/ft_server/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/ft_server/phpmyadmin
mv ./tmp/phpmyadmin.inc.php /var/www/ft_server/phpmyadmin/config.inc.php

cd /tmp/
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/ /var/www/ft_server
mv /tmp/wp-config.php /var/www/ft_server/wordpress

service php7.3-fpm start
service nginx start
bash