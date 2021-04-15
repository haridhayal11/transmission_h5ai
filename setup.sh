#!/bin/bash
sudo apt install transmission-cli transmission-common transmission-daemon apache2 php unzip -y
sudo systemctl stop transmission-daemon
sudo usermod -a -G debian-transmission user
sudo rm /etc/transmission-daemon/settings.json
sudo cp settings.json /etc/transmission-daemon/
sudo chown debian-transmission:debian-transmission /etc/transmission-daemon/settings.json
sudo nano /var/lib/transmission-daemon/info/settings.json


sudo ufw allow 51413
sudo ufw allow 9091
sudo ufw allow 52204
sudo ufw allow 80

sudo rm -rf /var/www/html/*
cd /var/www/html/
sudo wget https://release.larsjung.de/h5ai/h5ai-0.30.0.zip
sudo unzip h5ai-0.30.0.zip
sudo rm -rf *.zip
echo DirectoryIndex  index.html  index.php  /_h5ai/public/index.php > /etc/apache2/apache2.conf
sudo chgrp debian-transmission /var/www/html
sudo chmod -R g+rw /var/www/html

sudo systemctl start transmission-daemon
sudo systemctl enable transmission-daemon
sudo systemctl stop apache2
sudo systemctl start apache2
sudo systemctl enable apache2
 
echo Completed