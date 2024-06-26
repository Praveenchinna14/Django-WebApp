#!/bin/bash

source env/bin/activate

cd /var/lib/jenkins/workspace/Django-WebApp

pip install django==5.0.6
pip install gunicorn
pip install mysqlclient
pip install requests
pip install pillow
pip install wheel==0.43.0

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic 

echo "Migrations done"

cd /var/lib/jenkins/workspace/Django-WebApp

sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/

echo "$USER"
echo "$PWD"



sudo systemctl daemon-reload
sudo systemctl start gunicorn

echo "Gunicorn has started."

sudo systemctl enable gunicorn

echo "Gunicorn has been enabled."

sudo systemctl restart gunicorn


sudo systemctl status gunicorn
