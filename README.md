# PHP7 (FPM) + Nginx
Build our PHP7 + Nginx container (It was created for testing our apps)

### How to use this image
It must map the application folder to make it work
```
$ docker run --name php7_testing -v /my/own/app:/www -d dafitidev/nginx-php7fpm
```

### PHP7 [Modules]
bcmath, bz2, calendar, Core, ctype, curl, date, dom, exif, fileinfo, filter, ftp, gd, gettext, gmp, hash, iconv, intl, json, libxml, mbstring, mcrypt, mysqli, openssl, pcntl, pcre, PDO, pdo_mysql, pdo_sqlite, Phar, posix, pspell, recode, Reflection, session, SimpleXML, soap, SPL, sqlite3, standard, sysvmsg, sysvsem, sysvshm, tokenizer, wddx, xml, xmlreader, xmlwriter, zip, zlib

### More Modules
If you need more modules like Memcached and AMQP, we did the dirty work for you, but is experimental (we do not guarantee it will work correctly). Please use the tags bellow:
- [memcached](https://github.com/dafiti/docker-nginx-php7fpm/tree/memcached)
- [amqp](https://github.com/dafiti/docker-nginx-php7fpm/tree/amqp)
- [all-extensions](https://github.com/dafiti/docker-nginx-php7fpm/tree/all-extensions)
