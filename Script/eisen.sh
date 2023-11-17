echo 'nameserver 192.236.1.2' > /etc/resolv.conf
apt-get update
apt-get install apache2-utils -y
apt-get install nginx -y
apt-get install lynx -y

service nginx start

#7

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo ' upstream worker {
    server 192.236.3.1;
    server 192.236.3.2;
    server 192.236.3.3;
}

server {
    listen 80;
    server_name granz.channel.it06.com www.granz.channel.it06.com;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        proxy_pass http://worker;
    }
} ' > /etc/nginx/sites-available/lb_php

#10-2

mkdir /etc/nginx/rahasisakita
htpasswd -c /etc/nginx/rahasisakita/htpasswd netics

#10-3

echo ' upstream worker {
    server 192.168.3.1;
    server 192.168.3.2;
    server 192.168.3.3;
}

server {
    listen 80;
    server_name server_name granz.channel.it06.com www.granz.channel.it06.com;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        proxy_pass http://worker;
        auth_basic "Restricted Content";
        auth_basic_user_file /etc/nginx/rahasisakita/htpasswd;
    }
} ' > /etc/nginx/sites-available/lb_php

#11

echo 'upstream worker {
    server 192.236.3.1;
    server 192.236.3.2;
    server 192.236.3.3;
}

server {
    listen 80;
    server_name granz.channel.it06.com www.granz.channel.it06.com;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    location / {
        proxy_pass http://worker;
        auth_basic "Restricted Content";
        auth_basic_user_file /etc/nginx/rahasisakita/htpasswd;
    }

    location ~ /its {
        proxy_pass https://www.its.ac.id;
        proxy_set_header Host www.its.ac.id;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}' > /etc/nginx/sites-available/lb_php

#12

echo ' upstream worker {
    server 192.236.3.1;
    server 192.236.3.2;
    server 192.236.3.3;
}

server {
    listen 80;
    server_name granz.channel.it06.com www.granz.channel.it06.com;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    location / {
        allow 192.236.3.69;
        allow 192.236.3.70;
        allow 192.236.4.167;
        allow 192.236.4.168;
        deny all;
        proxy_pass http://worker;
        auth_basic "Restricted Content";
        auth_basic_user_file /etc/nginx/rahasisakita/htpasswd;
    }

    location ~ /its {
        proxy_pass https://www.its.ac.id;
        proxy_set_header Host www.its.ac.id;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}' > /etc/nginx/sites-available/lb_php

ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service nginx restart

