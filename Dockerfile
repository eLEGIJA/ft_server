# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msafflow <elegija4mlg@gmail.com>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/13 14:00:16 by msafflow          #+#    #+#              #
#    Updated: 2020/08/13 14:00:16 by msafflow         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y procps && apt-get install vim && apt-get install -y wget
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
RUN apt-get -y install nginx && RUN apt-get -y install mariadb-server

COPY ./srcs/build.sh ./
COPY ./srcs/nginx-conf ./tmp/nginx-conf
COPY ./srcs/wp-config.php ./tmp/wp-config.php
COPY ./srcs/phpmyadmin.inc.php ./tmp/phpmyadmin.inc.php

CMD bash build.sh
