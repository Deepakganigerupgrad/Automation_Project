#!/bin/bash

sudo apt update -y
sudo apt install apache2
sudo ufw app list
sudo ufw allow 'Apache'
sudo ufw status
sudo systemctl status apache2
hostname -I
curl -4 icanhazip.com
curl http://54.226.47.29

timestamp=$(date '+%d%m%Y-%H%M%S')

tar -czvf tmp/deepakg-httpd-${timestamp}.tar.gz var/log/apache2/access.log

aws s3 cp /tmp/deepakg-httpd-${timestamp}.tar.gz s3://upgrad-deepakkumar
