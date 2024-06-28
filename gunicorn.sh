#!/bin/bash

source env/bin/activate

cd /var/lib/jenkins/Django-WebApp

pip install django
pip install gunicorn
pip install mysqlclient
pip install pkg_config
pip install maridb
pip install libmariadb
pip install requests
pip install pillow
pip install wheel

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic 

echo "Migrations done"

cd /var/lib/workspace/Django-WebApp

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
