sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000/;|g'>
pm2 stop app.js

pm2 start app.js --update-env

git clone https://"app repo"

