## Create an initial instance.
- The user data needed is:
`#!/bin/bash`

`sudo apt-get update -y`

`sudo apt-get upgrade -y`

`sudo apt-get install nginx -y`

`sudo sed -i "s/try_files \$uri \$uri\/ =404;/proxy_pass http:\/\/localhost:3000\/;/" /etc/nginx/sites-available/default`

`sudo systemctl restart nginx`

`sudo systemctl enable nginx`

`curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -`

`sudo apt-get install nodejs -y`

`sudo npm install pm2 -g`

`git clone https://github.com/JamieGodwin/app.git /home/ubuntu/repo`

`cd /home/ubuntu/repo/app`

`sudo npm install`

`pm2 start app.js --update-env`

`pm2 restart app.js --update-env`
- This code should work, however if not, then get an AMI with the app working.
- Note: The user data doesn't like blank space between lines.

## Create a launch template
- We create a new launch template, with the following code in the user data:
`#!/bin/bash`
`cd /home/ubuntu/repo/app`
`sudo npm install`
`pm2 start app.js`
- Remeber that we need to set the instance type to "t2.micro"
## Auto scaling
- We can then set up auto scaling with the previous steps. 
- The launch template name I have used is "tech230-jamie-app-LT2"
