# Nginx container used for local development environment
#
# Version 0.0.1

FROM ubuntu:12.04

MAINTAINER Wiliam Souza <wiliamsouza83@gmail.com>

# Set language
ENV LANG en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://br.archive.ubuntu.com/ubuntu precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://br.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu precise-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y python-software-properties

RUN dpkg-divert --local --rename --add /sbin/initctl

# nginx repository
RUN add-apt-repository ppa:nginx/stable -y

# update
RUN apt-get update

# nginx
RUN apt-get install nginx nginx-extras -y

ADD nginx.conf /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available/default

RUN update-rc.d -f nginx disable

RUN mkdir -p /srv/nginx/html
RUN chown 755 /srv/nginx/html

# supervisord
RUN apt-get install supervisor -y

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/srv/nginx/html", "/var/log/nginx"]

EXPOSE 80

CMD ["/usr/bin/supervisord"]
