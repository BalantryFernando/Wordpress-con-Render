FROM wordpress:latest

# 1. Copia la carpeta completa del plugin
COPY postgresql-for-wordpress /var/www/html/wp-content/plugins/postgresql-for-wordpress

# 2. Copia el archivo 'db.php' desde la subcarpeta correcta
COPY postgresql-for-wordpress/pg4wp/db.php /var/www/html/wp-content/db.php

EXPOSE 80

