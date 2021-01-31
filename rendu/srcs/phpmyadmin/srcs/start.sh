wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
tar -xzvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www
# envsubst '${DB_NAME} ${DB_USER} ${DB_PASS} ${DB_HOST}' < config.inc.php > /www/config.inc.php

#lance les différents services : php-fpm, nginx, et telegraf
/usr/sbin/php-fpm7 -D
sh -c nginx -g 'daemon off;'
telegraf