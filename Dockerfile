FROM php:7.4-apache
RUN docker-php-ext-install mysqli
VOLUME /var/www/html
COPY entrypoint.sh /entrypoint.sh 
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
