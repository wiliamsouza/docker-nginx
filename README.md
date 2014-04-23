docker-nginx
------------

Docker nginx container template used to create development environment.

To build run:

```
$ docker.io build -t wiliamsouza/nginx .
```

Change `wiliamsouza` to your Docker
[index](https://index.docker.io/u/wiliamsouza/) username.

Shell access:

```
$ docker.io run -i -t wiliamsouza/nginx /bin/bash
```

Usage:

```
$ docker.io run -p 80:80 -d \
-v /home/wiliam/devel/docker-nginx/data/sites-available:/etc/nginx/sites-available \
-v /home/wiliam/devel/docker-nginx/data/html:/usr/share/nginx/html \
-v /home/wiliam/devel/docker-nginx/data/conf.d:/etc/nginx/conf.d
-v /home/wiliam/devel/docker-nginx/data/log:/var/log/nginx \
-v /home/wiliam/devel/docker-nginx/data/srv:/srv \
-t wiliamsouza/nginx
```
