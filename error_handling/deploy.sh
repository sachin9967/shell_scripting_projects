#!/bin/bash

####################################################
# Author : Sachin
# Date   : 15-July
# Version: v1.2
#
# Desc   : Deploys Django app using Docker and handles errors
####################################################

code_clone() {
    if [ -d "django-notes-app" ]; then
        echo "Repository already exists. Entering directory..."
        cd django-notes-app || return 1
    else
        echo "Cloning the repo..."
        git clone https://github.com/sachin9967/django-notes-app.git || return 1
        cd django-notes-app || return 1
    fi
}

installing_requirements() {
    echo "Installing Docker, Nginx, and Docker Compose..."
    sudo apt-get update && sudo apt-get install -y docker.io docker-compose nginx || return 1
}

required_restarts() {
    echo "Restarting and enabling necessary services..."
    sudo chown "$USER" /var/run/docker.sock || return 1

    sudo systemctl enable docker
    sudo systemctl enable nginx

    sudo systemctl start docker || return 1
    sudo systemctl start nginx || return 1
}

deploy() {
    echo "Deploying the Django app..."
    
    docker build -t notes-app . || return 1

    docker-compose up -d || return 1
}


if ! code_clone; then
    echo "Cloning repo failed or directory not accessible."
    exit 1
fi

if ! installing_requirements; then
    echo "Package installation failed."
    exit 1
fi

if ! required_restarts; then
    echo "Service restart or permissions failed."
    exit 1
fi

if ! deploy; then
    echo "Deployment failed."
    exit 1
fi

echo "Deployment completed successfully!"
