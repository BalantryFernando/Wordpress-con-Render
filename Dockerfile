FROM wordpress:latest

# 1. Copia la carpeta completa del plugin
COPY postgresql-for-wordpress /var/www/html/wp-content/plugins/postgresql-for-wordpress

# 2. Copia el archivo 'db.php' para que WordPress lo active
COPY postgresql-for-wordpress/db.php /var/www/html/wp-content/db.php

EXPOSE 80
# FORZANDO BAINA 2.0
