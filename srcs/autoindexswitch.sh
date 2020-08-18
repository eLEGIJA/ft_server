#!/bin/bash

if grep -q "autoindex on" ~/../etc/nginx/sites-available/localhost
then
	sed -i "s/autoindex on/autoindex off/" ~/../etc/nginx/sites-available/localhost
	service nginx restart
	echo -e "[\033[31m off \033[0m] autoindex"
elif grep -q "autoindex off" ~/../etc/nginx/sites-available/localhost
then
	sed -i "s/autoindex off/autoindex on/" ~/../etc/nginx/sites-available/localhost
	service nginx restart
	echo -e "[\033[32m on \033[0m] autoindex"
fi