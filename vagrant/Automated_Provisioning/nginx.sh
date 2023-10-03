# adding repository and installing nginx		
apt update
apt install nginx -y
cat <<EOT > txapp
upstream txapp {

 server app01:8080;

}

server {

  listen 80;

location / {

  proxy_pass http://txapp;

}

}

EOT

mv txapp /etc/nginx/sites-available/txapp
rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/txapp /etc/nginx/sites-enabled/txapp

#starting nginx service and firewall
systemctl start nginx
systemctl enable nginx
systemctl restart nginx