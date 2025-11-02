FROM wordpress:latest

# 1. Instala dependencias y TODAS las extensiones PHP
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql \
    && rm -rf /var/lib/apt/lists/*

# 2. Copia la carpeta COMPLETA del plugin
COPY postgresql-for-wordpress /var/www/html/wp-content/plugins/postgresql-for-wordpress

# 3. Copia el archivo "drop-in" (db.php)
COPY postgresql-for-wordpress/db.php /var/www/html/wp-content/db.php

EXPOSE 80
