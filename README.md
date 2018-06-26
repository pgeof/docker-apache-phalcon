# apache-phalcon

Docker image based on [pgeof/apache-php](https://hub.docker.com/r/pgeof/apache-php/) that embeds [Phalcon PHP framework](https://phalconphp.com/)

## Supported tags (corresponds to phalcon and php version)

* v3.3.2-php7.2
* v3.3.2-php7.1
* v3.3.2-php7.0, latest
* v3.3.2-php5.6
* v3.2.4-php7.1
* v3.2.4-php7.0
* v3.2.4-php5.6
* v3.2.1-php7.1
* v3.2.1-php7.0
* v3.2.1-php5.6
* v2.0.13-php5.6

## Phalcon rendering issue with php 7.0

Be aware of an issue with Phalcon and `php 7.0 & 7.1 & 7.2`.
See [Diffrent volt partial() in php 5.6/7.0](https://github.com/phalcon/cphalcon/issues/12176)

## Usages

```sh
    docker run -d --rm -v $(pwd):/var/www -p 80:80 pgeof/apache-phalcon
```

Start an apache webserver available on TCP port 80 on your machine. The document root folder is the one you specify after the `-v` parameter.

```sh
    docker run -d --rm -v $(pwd):/var/www -v /your_apache_site_config:/etc/apache2/sites-enabled -p 80:80 pgeof/apache-phalcon
```

Same command as previous, but this time apache sites configuration must be defined in the folder you specify after the second `-v` parameter.