#!/bin/sh
#on créee le wp-config.php, on instale wp et créé plusieurs utilisateurs ds mysql via wp-cli
su www -c "wp-cli config create --dbname=wordpress --dbuser=mysql --dbpass=pass --dbhost=$MYSQL_SERVICE_HOST:3306 --path=wordpress"
su www -c "wp-cli core install  --title=wordpress --admin_user=wordpress --admin_password=pass --admin_email=test@test.com --path=/wordpress --url=$WORDPRESS_HOST"
su www -c "/usr/bin/wp-cli user create user1 user1@aol.com --role=editor --user_pass=editor --path=/wordpress/"
su www -c "/usr/bin/wp-cli user create user2 user2@aol.com --role=editor --user_pass=editor --path=/wordpress/"
su www -c "/usr/bin/wp-cli user create user3 user3@aol.com --role=editor --user_pass=editor --path=/wordpress/"

#lance nginx, php-fmp7 et télégraf qui empêche le conteneur de se fermer
nginx
php-fpm7
telegraf