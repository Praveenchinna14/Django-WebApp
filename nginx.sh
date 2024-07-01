#!/bin/bash

sudo cp -rf nginx.conf /etc/nginx/sites-available/nginx.conf
chmod 710 /var/lib/jenkins/workspace/django

sudo ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled
sudo nginx -t

sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx has been started"

sudo systemctl status nginx
