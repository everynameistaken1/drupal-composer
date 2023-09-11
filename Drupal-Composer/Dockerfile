# If you want to know how "drupal-base" image is built
# https://github.com/everynameistaken1/drupal-base

FROM everynameistaken1/drupal-base:0.1.0 as only-drupal

ARG projectName="UNDEFINED"
ARG gitEmail="Undefined@Undefined.Undefined"
ARG gitName="Undefined"
ARG repository="UNDEFINED"

ENV PROJECT_NAME=$projectName
ENV GIT_EMAIL=$gitEmail
ENV GIT_NAME=$gitName
ENV REPOSITORY=$repository
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apk add git

RUN git config --global user.email "$GIT_EMAIL"
RUN git config --global user.name "$GIT_NAME"

WORKDIR /var/www/html

RUN composer create-project $REPOSITORY $PROJECT_NAME --no-interaction

COPY ./runs-on-build-once.sh runs-on-build-once.sh
RUN chmod 777 runs-on-build-once.sh
RUN . runs-on-build-once.sh
RUN rm runs-on-build-once.sh

RUN export COMPOSER_ALLOW_SUPERUSER=0

FROM only-drupal as drupal-postgres

RUN apk add postgresql-client

COPY ./runs-on-container-start.sh runs-on-container-start.sh
RUN cat runs-on-container-start.sh > /usr/local/bin/docker-php-entrypoint
RUN rm runs-on-container-start.sh

FROM drupal-postgres as drupal-xdebug-base

ARG xDebug="off"

ENV XDEBUG_MODE=$xDebug

RUN install-php-extensions xdebug

COPY ./ini/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN apk add bash

EXPOSE 9003

FROM drupal-xdebug-base as drupal-xdebug-vscode
RUN echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

FROM drupal-xdebug-base as drupal-xdebug-nvim

RUN apk add neovim make gcc unzip wget gzip nodejs npm fd  \
    ripgrep curl python3 py3-pip linux-headers \
    alpine-sdk build-base

RUN npm install -g neovim
RUN pip3 install pynvim

RUN mkdir /root/.config
WORKDIR /root/.config

RUN git clone -b "0.1.0" --single-branch https://github.com/everynameistaken1/nvim.git nvim
RUN git clone https://github.com/xdebug/vscode-php-debug.git vscode-php-debug && \
    cd vscode-php-debug && \
    npm install && npm run build
WORKDIR /var/www/html/${PROJECT_NAME}