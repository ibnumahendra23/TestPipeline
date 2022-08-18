#!/bin/bash

# Production Deployment
# Maintainer: Ezra Lazuardy <ezralucio@gmail.com>

sudo rm -rf /etc/nginx/sites-enabled/master.percepatanweb.site 
sudo service nginx reload

cd /var/www/master.percepatanweb.site 
git fetch
git reset --hard origin/master
git pull origin master
yarn --production --frozen-lockfile
# rm -rf build && yarn build

sudo ln -s /etc/nginx/sites-available/master.percepatanweb.site  /etc/nginx/sites-enabled/master.percepatanweb.site 
sudo rm -rf /var/cache/ngx_pagespeed/*
sudo service nginx reload
