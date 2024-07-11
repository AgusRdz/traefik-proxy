FROM php:8.2-fpm
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install zip pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN mkdir -p /var/www/html/storage /var/www/html/bootstrap/cache
WORKDIR /var/www/html
COPY . .
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
EXPOSE 9000
CMD ["php-fpm"]
