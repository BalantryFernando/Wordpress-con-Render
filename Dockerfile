FROM wordpress:latest

# 1. Instala dependencias C (libpq-dev)
# 2. Instala AMBOS drivers: pdo_pgsql (para PDO) y pgsql (nativo)
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql \
    && rm -rf /var/lib/apt/lists/*

# Copia el plugin de PG4WP (la carpeta interna)
COPY postgresql-for-wordpress/pg4wp /var/www/html/wp-content/plugins/pg4wp

# Copia el archivo "drop-in" (db.php)
COPY postgresql-for-wordpress/pg4wp/db.php /var/www/html/wp-content/db.php

EXPOSE 80
