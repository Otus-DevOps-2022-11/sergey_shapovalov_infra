#!/bin/bash

echo "You need root rights for thus script."

echo "Update your OS."
sudo apt update && sudo apt -y full-upgrade

echo "Adding repo and keys"
echo "deb http://repo.pritunl.com/stable/apt $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/pritunl.list
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

curl -fsSL https://www.mongodb.org/static/pgp/server-5.0.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-5.gpg
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7AE645C0CF8E292A
apt update

echo "Install Pritunl nad MongoDB"

apt --assume-yes install pritunl mongodb-org

echo "Enable and start Pritunl and MongoDB"
systemctl enable --now pritunl mongod
systemctl status pritunl mongod

echo "Visit https://<your_server_ip> to continue installation."

