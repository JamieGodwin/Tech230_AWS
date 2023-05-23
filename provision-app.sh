#!/bin/bash

 # Update and upgrade nginx
 sudo apt-get update -y
 sudo apt-get upgrade -y

 # Install the web server nginx
 sudo apt-get install nginx -y

 # We replace the line "try_files $uri $suri/ =404;" in the default nginx configeration file.
 sudo sed -i "s/try_files \$uri \$uri\/ =404;/proxy_pass http:\/\/localhost:3000\/;/" /etc/nginx/sites-available/default

# Replace the line "# pass PHP scripts to FastCGI server" in the default nginx configuration file with "proxy_pass http://localhost:3000/posts;"
sudo sed -i "s/# pass PHP scripts to FastCGI server/location \/posts {\n\t\tproxy_pass http:\/\/localhost:3000\/posts;\n\t}/" /etc/nginx/sites-available/default

sudo systemctl restart nginx
sudo systemctl enable nginx

# Install usual app dependencies
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Install nodejs and pm2
sudo apt-get install nodejs -y
sudo npm install pm2 -g

# Get repo with the app folder
git clone https://github.com/JamieGodwin/app.git /home/ubuntu/repo

# Install the app
cd /home/ubuntu/repo/app


sudo npm install

# The database then needs to be seeded
node seeds/seed.js

# Restart or start the app
pm2 start app.js --update-env
pm2 restart app.js --update-env

# Re-start and enable the nginx web server
