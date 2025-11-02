FROM wordpress:latest

# 1. Instala dependencias C (libpq-dev)
# 2. Compila e INSTALA la extensión (pdo_pgsql)
# 3. HABILITA la extensión
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-enable pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

# Copia el plugin de PG4WP (la carpeta interna)
COPY postgresql-for-wordpress/pg4wp /var/www/html/wp-content/plugins/pg4wp

# Copia el archivo "drop-in" (db.php)
COPY postgresql-for-wordpress/pg4wp/db.php /var/www/html/wp-content/db.php

EXPOSE 80
