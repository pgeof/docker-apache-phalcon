FROM pgeof/apache-php:7.1

ENV DEBIAN_FRONTEND noninteractive

ARG PHALCON_VERSION
ENV PHALCON_VERSION ${PHALCON_VERSION:-v3.2.1}

# Comment
RUN echo "Embedded phalcon version : ${PHALCON_VERSION}"

RUN apt-get update && apt-get install -y php7.1-dev gcc libpcre3-dev git && \
    cd /tmp && \
    git clone --branch $PHALCON_VERSION --depth=1 https://github.com/phalcon/cphalcon.git && \
    cd cphalcon/build/php7/64bits || cd cphalcon/build/64bits && phpize && ./configure  CFLAGS="-O2 -g" && make -B && make install && \
    cd /tmp && \
    /bin/rm -rf /tmp/cphalcon/ && \
    /usr/bin/apt-get -y purge git php-dev libpcre3-dev gcc make && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "extension=phalcon.so" > /etc/php/7.1/mods-available/phalcon.ini  && \
    phpenmod phalcon && a2enmod proxy proxy_http

ENV DEBIAN_FRONTEND dialog