docker-nginx
------------

Docker nginx server generic image source. This is based on `ubuntu:12.04` image.

Image
-----

Build this repository:

```
$ git clone https://github.com/osantana/docker-nginx.git
$ cd docker-nginx/
$ docker.io build -t osantana/nginx .
```

Change `osantana/nginx` to your Docker index username.

Container
---------

This image uses volumes and environment variables to control the nginx server
configuration.

Volumes:

* `/etc/nginx/site-available`: Change sites configurations using it.
* `/usr/share/nginx/html`: HTML files goes here.
* `/etc/nginx/conf.d`: Change sites configurations using it.
* `/var/log/nginx`: Access log from the container using it.
* `/srv`: Add your app source code here.

You pass with `-v` docker option. Don't forget to use absolute path here.

Shell access:

```
$ docker.io run -p 80:80 -i \
-v `pwd`/volumes/sites-available:/etc/nginx/sites-available \
-v `pwd`/volumes/html:/usr/share/nginx/html \
-v `pwd`/volumes/conf.d:/etc/nginx/conf.d \
-v `pwd`/volumes/log:/var/log/nginx \
-v `pwd`/volumes/srv:/srv \
-t osantana/nginx /bin/bash
```

The command above will start a container give you a shell. Don't
forget to start the service running the `startup &` script.

Usage:

```
$ docker.io run --name nginx -p 80:80 -d \
-v `pwd`/volumes/sites-available:/etc/nginx/sites-available \
-v `pwd`/volumes/html:/usr/share/nginx/html \
-v `pwd`/volumes/conf.d:/etc/nginx/conf.d \
-v `pwd`/volumes/log:/var/log/nginx \
-v `pwd`/volumes/srv:/srv \
-t osantana/nginx
```

The command above will start a container and return its ID.
