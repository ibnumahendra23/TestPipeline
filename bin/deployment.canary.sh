#!/bin/bash

# Canary Deployment
# Maintainer: Ibnu Mahendra

sudo rm -rf /etc/nginx/sites-enabled/canary.percepatanweb.site 
sudo service nginx reload

cd /var/www/canary.percepatanweb.site 
git fetch
git reset --hard origin/canary
git pull origin canary
yarn --production --frozen-lockfile
# rm -rf build && yarn build

sudo ln -s /etc/nginx/sites-available/canary.percepatanweb.site  /etc/nginx/sites-enabled/canary.percepatanweb.site 
sudo rm -rf /var/cache/ngx_pagespeed/*
sudo service nginx reload
