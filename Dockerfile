FROM wordpress:latest

COPY postgresql-for-wordpress /var/www/html/wp-content/plugins/postgresql-for-wordpress

EXPOSE 80
#Forzando baina
