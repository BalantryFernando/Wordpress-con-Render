FROM wordpress:latest

# Instala la extensión de PHP para PostgreSQL
RUN docker-php-ext-install pdo pdo_pgsql

# 1. Copia la carpeta INTERNA (pg4wp) al directorio de plugins
COPY postgresql-for-wordpress/pg4wp /var/www/html/wp-content/plugins/pg4wp

# 2. Copia el archivo 'db.php' desde la subcarpeta correcta
COPY postgresql-for-wordpress/pg4wp/db.php /var/www/html/wp-content/db.php

EXPOSE 80
