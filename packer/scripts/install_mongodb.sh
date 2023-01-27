#!/bin/bash

rm /var/lib/apt/lists/lock
rm /var/cache/apt/archives/lock
rm /var/lib/dpkg/lock
rm /var/lib/dpkg/lock-frontend

apt-get -y install gnupg git wget htop

wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list

#wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list


apt-get update; apt-get -y install mongodb-org

systemctl enable --now mongod

systemctl status mongod
