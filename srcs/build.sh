service mysql start

chown -R www-data /var/www/*
chmod -R -rwxr-xr-x /var/www/*

mkdir /var/www/monsupersite && touch /var/www/monsupersite/index.php

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/monsupersite.pem -keyout /etc/nginx/ssl/monsupersite.key -subj "C=RU/ST=Moscow/L=Moscow/O=21 School/OU=msafflow/CN=msafflow"

mv ./tmp/nginx-conf /etc/nginx/sites-available/monsupersite
ln -s /etc/nginx/sites-available/monsupersite /etc/nginx/sites-enabled/monsupersite
rm -rf /etc/nginx/sites-enabled/default

mkdir /var/www/monsupersite/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/monsupersite/phpmyadmin
mv ./tmp/phpmyadmin.inc.php /var/www/monsupersite/phpmyadmin/config.inc.php

cd /tmp/
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/ /var/www/monsupersite
mv /tmp/wp-config.php /var/www/monsupersite/wordpress

service php7.3-fpm start
service nginx start
bash