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
$ docker.io run -p 80:80 -d -v data/html:/srv/nginx/html -v data/log:/var/log/nginx -t wiliamsouza/nginx
```
