# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msafflow <elegija4mlg@gmail.com>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/17 17:23:59 by msafflow          #+#    #+#              #
#    Updated: 2020/08/17 17:24:26 by msafflow         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

EXPOSE 80 443

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y vim curl nginx mariadb-server php php-fpm php-mysql php-mbstring

RUN mkdir -p ../var/www/html/phpmyadmin && \
	curl -O https://wordpress.org/latest.tar.gz && \
	tar zxvf latest.tar.gz -C ../var/www/html && \
	rm latest.tar.gz && \
	curl -O https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz && \
	tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz -C ../var/www/html/phpmyadmin --strip-components 1 && \
	rm phpMyAdmin-5.0.2-all-languages.tar.gz

COPY srcs srcs

CMD bash srcs/start.sh
