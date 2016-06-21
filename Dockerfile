# TODO consider alpine
FROM php:5.6-apache

RUN apt-get update && apt-get install -y \
              libcurl4-gnutls-dev \
              php5-curl \
              php5-json \
              php5-mcrypt \
              php5-mysql \
     && docker-php-ext-install -j$(nproc) mysqli
     # && docker-php-ext-install -j$(nproc) mysqli curl json mcrypt

RUN a2enmod rewrite

ADD . /var/www/html

WORKDIR /var/www/html
RUN cp docker.settings.php settings.php

# TODO
# - dio
# - Swiftmailer