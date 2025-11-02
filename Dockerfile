FROM wordpress:latest

# 1. Instala dependencias y TODAS las extensiones PHP
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql \
    && rm -rf /var/lib/apt/lists/*

# 2. Copia la carpeta INTERNA (pg4wp) al directorio de plugins
COPY postgresql-for-wordpress/pg4wp /var/www/html/wp-content/plugins/pg4wp

# 3. Copia el "drop-in" (db.php) desde la subcarpeta correcta
COPY postgresql-for-wordpress/pg4wp/db.php /var/www/html/wp-content/db.php

EXPOSE 80

