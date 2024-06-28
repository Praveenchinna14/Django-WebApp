#!/bin/bash

# Check if virtualenv is installed
if command -v virtualenv &> /dev/null; then
    echo "virtualenv is already installed."
else
    echo "Installing virtualenv......"
    sudo apt install -y python3-virtualenv
fi


if [ -d "env" ]
then
    echo "Python virtual environment exists."
else
    echo "Creating a virtual environment"
    virtualenv env
fi

echo "The current directory"
echo $PWD
echo -e "\n\n\n"

echo "Activating the virtual environment"
source env/bin/activate
echo -e "\n\n\n"


# Check if pip3 is installed
echo "Checking for pip3 installation"
if command -v pip3 &> /dev/null; then
    echo "pip3 is already installed."
else
    echo "Installing pip3......."
    sudo apt install -y python3-pip
fi

echo -e "\n\n\n"
echo "Installing Requirements...."
pip3 install -r requirements.txt
echo "Requirements Installed."
echo -e "\n\n\n"

echo "Checking for logs"
if [ -d "logs" ]
then
    echo "Log folder exists."
else
    echo "Creating Logs"
    mkdir logs
    touch logs/error.log logs/access.log
fi

echo -e "\n\n\n"
echo "Giving Permission"
sudo chmod -R 777 logs
echo -e "\n\n\n"
echo "*********Script Ended************"
