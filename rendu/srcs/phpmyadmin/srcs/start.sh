wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
tar -xzvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www

#lance les différents services : php-fpm, nginx, et telegraf
/usr/sbin/php-fpm7 -D
nginx
telegraf