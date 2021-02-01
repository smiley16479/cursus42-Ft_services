telegraf&
#https://wiki.alpinelinux.org/wiki/Mysql
mysql_install_db --user=mysql --ldata=/var/lib/mysql
/usr/bin/mysqld --console --init_file=/tmp/sql_db_gen
