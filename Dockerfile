# TODO consider alpine
FROM php:5.6-apache

ENV APT_DEPS \
              libcurl4-gnutls-dev \
              php5-curl \
              php5-json \
              php5-mcrypt \
              php5-mysql

RUN apt-get update && apt-get install -y $APT_DEPS
                   && docker-php-ext-install -j$(nproc) mysqli

RUN a2enmod rewrite



 

ADD . /var/www/html

WORKDIR /var/www/html
RUN cp docker.settings.php settings.php

# TODO
# - dio
# - Swiftmailer