#!/bin/bash
####################################################
#Author :sachin
#date 15-july
#version v0
#
#desc:deploying django app and handling the errors
#################################################
code_clone() {
echo "cloning the repo"
git clone https://github.com/sachin9967/django-notes-app.git
}
instaliing_requirements() {
echo "installing the requirements"
sudo apt-get install docker.io nginx -y docker compose
}
required_restarts() {
echo "restarting necessary items"
sudo chown $USER /var/run/docker.sock
#sudo systemctl enable docker
#sudo systemctl enable nginx
#sudo system ctl docker
}
deploy() {
echo "deploying the app"
docker build -t notes-app .
#docker run -d -p 8000:8000 notes-app:latest
docker-compose up -d
}
if !code_clone; then
    echo "already repo exists"
    cd  django-notes-app
fi

if !installing_requirements; then
   echo "installation failed"
   exit 1
fi

if !required_restarts; then
   echo "failed to restart"
   exit 1
fi

if !deploy; then
    echo "deployment failed"
    # sendmail
    exit 1
fi

echo "deployment done"
   
    
