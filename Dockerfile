FROM wordpress:latest

# 1. Actualiza, instala las dependencias de C (libpq-dev)
# 2. Instala la extensión de PHP (pdo_pgsql)
# 3. Limpia la caché de apt
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

# Copia el plugin de PG4WP (la carpeta interna)
COPY postgresql-for-wordpress/pg4wp /var/www/html/wp-content/plugins/pg4wp

# Copia el archivo "drop-in" (db.php)
COPY postgresql-for-wordpress/pg4wp/db.php /var/www/html/wp-content/db.php

EXPOSE 80
