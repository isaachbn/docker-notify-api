################################################################################
# BASE IMAGE
################################################################################
FROM ubuntu:16.04

################################################################################
# Set Locale
################################################################################
RUN sed -i "s/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/" /etc/locale.gen
ENV LANG       pt_BR.UTF-8
ENV LC_ALL     pt_BR
RUN locale-gen

################################################################################
# ADD Key PHP-7
################################################################################
RUN echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list
COPY dotdeb.gpg /tmp/
RUN apt-key add /tmp/dotdeb.gpg

################################################################################
# Install packages
################################################################################
RUN apt-get update \
    && apt-get install -my \
        lsb-release \
        nginx \
        locales \
        openssh-server \
        supervisor \
        curl \
        nano \
        wget \
        redis-server \
        php7.0 \
        php7.0-fpm \
        php7.0-curl \
        php7.0-json \
        php7.0-pgsql \
        php7.0-phpdbg \
        php7.0-redis \
        php7.0-mysql \
        php7.0-cli \
        php7.0-redis

###############################################################################
# SSH - CONFIG
###############################################################################
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd


################################################################################
# Link Simbolic Confs
################################################################################
ADD conf/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
ADD conf/www.conf /etc/php/7.0/fpm/pool.d/www.conf
ADD ./conf/supervisord.conf /etc/supervisor/supervisord.conf
ADD ./conf/nginx.conf /etc/nginx/sites-available/default

################################################################################
# Install Composer
################################################################################
ADD https://getcomposer.org/composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer

################################################################################
# Set Off Daemon Nginx
################################################################################
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

################################################################################
# Clear Build
################################################################################
RUN rm -fr /tmp/* /var/lib/apt/lists/* /var/tmp/* \
    && apt-get autoremove -y \
    && apt-get autoclean \
    && apt-get clean

WORKDIR /

EXPOSE 80 22

CMD ["/usr/bin/supervisord"]
