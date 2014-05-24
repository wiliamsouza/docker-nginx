#!/bin/bash

git remote add github git@github.com:wiliamsouza/docker-nginx.git
git remote add bitbucket git@bitbucket.org:wiliamsouza/docker-nginx.git
git remote add gitlab git@gitlab.com:wiliamsouza/docker-nginx.git
git remote set-url --push --add origin git@bitbucket.org:wiliamsouza/docker-nginx.git
git remote set-url --push --add origin git@gitlab.com:wiliamsouza/docker-nginx.git
git remote set-url --push --add origin git@github.com:wiliamsouza/docker-nginx.git
