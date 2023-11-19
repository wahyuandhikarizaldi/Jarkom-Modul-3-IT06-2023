# Jarkom-Modul-3-IT06-2023
**Modul 3 Jaringan Komputer 2023**

## Kelompok IT06
| Nama | NRP |
|---------------------------|------------|
|Wahyu Andhika Rizaldi | 5027211003 |
|Sedtia Prakoso Budi Tirto Arto | 5027211014 |

## Topologi
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/861468ab-2fdd-4aa9-9749-f0dccf2d3822)


## Configuration
- **Aura**
```
auto eth0
iface eth0 inet dhcp
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.236.0.0/16

auto eth1
iface eth1 inet static
	address 192.236.1.0
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 192.236.2.0
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 192.236.3.0
	netmask 255.255.255.0

auto eth4
iface eth4 inet static
	address 192.236.4.0
	netmask 255.255.255.0

```
- **Himmel**
```
auto eth0
iface eth0 inet static
	address 192.236.1.1
	netmask 255.255.255.0
	gateway 192.236.1.0

```
- **Heiter**
```
auto eth0
iface eth0 inet static
	address 192.236.1.2
	netmask 255.255.255.0
	gateway 192.236.1.0
```
- **Denken**
```
auto eth0
iface eth0 inet static
	address 192.236.2.1
	netmask 255.255.255.0
	gateway 192.236.2.0
```
- **Eisen**
```
auto eth0
iface eth0 inet static
	address 192.236.2.2
	netmask 255.255.255.0
	gateway 192.236.2.0
```
- **Frieren**
```
auto eth0
iface eth0 inet static
	address 192.236.4.3
	netmask 255.255.255.0
	gateway 192.236.4.0

```
- **Flamme**
```
auto eth0
iface eth0 inet static
	address 192.236.4.2
	netmask 255.255.255.0
	gateway 192.236.4.0

```
- **Fern**
```
auto eth0
iface eth0 inet static
	address 192.236.4.1
	netmask 255.255.255.0
	gateway 192.236.4.0

```
- **Lawine**
```
auto eth0
iface eth0 inet static
	address 192.236.3.3
	netmask 255.255.255.0
	gateway 192.236.3.0

```
- **Linie**
```
auto eth0
iface eth0 inet static
	address 192.236.3.2
	netmask 255.255.255.0
	gateway 192.236.3.0

```
- **Lugner**
```
auto eth0
iface eth0 inet static
	address 192.236.3.1
	netmask 255.255.255.0
	gateway 192.236.3.0

```
- **Stark, Sein, Revolte, Richter**
```
auto eth0
iface eth0 inet dhcp
```

### Setup dan instalasi

- DHCP Relay
  ```sh
  apt-get update
  apt install isc-dhcp-relay -y
  ```
- **DNS Server**
  ```sh
  echo 'nameserver 192.168.122.1' > /etc/resolv.conf
  apt-get update
  apt-get install bind9 -y  
  ```
- **DHCP Server**
  ```sh
  echo 'nameserver 192.236.1.2' > /etc/resolv.conf
  apt-get update
  apt install isc-dhcp-server -y
  ```
- **Database Server**
  ```sh
  echo 'nameserver 192.236.1.2' > /etc/resolv.conf
  apt-get update
  apt-get install mariadb-server -y
  service mysql start
  ```
- **Load Balancer**
  ```sh
  echo 'nameserver 192.236.1.2' > /etc/resolv.conf
  apt-get update
  apt-get install apache2-utils -y
  apt-get install nginx -y
  apt-get install lynx -y

  service nginx start
  ```
- **Worker PHP**
  ```sh
  echo 'nameserver 192.236.1.2' > /etc/resolv.conf
  apt-get update
  apt-get install nginx -y
  apt-get install wget -y
  apt-get install unzip -y
  apt-get install lynx -y
  apt-get install htop -y
  apt-get install apache2-utils -y
  apt-get install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip -y

  service nginx start
  service php7.3-fpm start
  ```
- **Worker Laravel**
  ```sh
  echo 'nameserver 192.236.1.2' > /etc/resolv.conf
  apt-get update
  apt-get install lynx -y
  apt-get install nginx -y
  apt-get install wget -y
  apt-get install unzip -y
  apt-get install mariadb-client -y
  apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
  curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
  sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
  apt-get update
  apt-get install php8.0-mbstring php8.0-xml php8.0-cli   php8.0-common php8.0-intl php8.0-opcache php8.0-readline php8.0-mysql php8.0-fpm php8.0-curl unzip wget -y
  apt-get install nginx -y

  service nginx start
  service php8.0-fpm start
  ```
- **Client**
  ```sh
  apt update
  apt install lynx -y
  apt install htop -y
  apt install apache2-utils -y
  apt-get install jq -y
  ```

## Soal 1 
>Lakukan konfigurasi sesuai dengan peta yang sudah diberikan.

Konfigurasi domain riegel dan granz di DNS Server.

**Heiter**
```sh
echo 'zone "riegel.canyon.it06.com" {
    type master;
    file "/etc/bind/sites/riegel.canyon.it06.com";
};

zone "granz.channel.it06.com" {
    type master;
    file "/etc/bind/sites/granz.channel.it06.com";
};

zone "1.236.192.in-addr.arpa" {
    type master;
    file "/etc/bind/sites/1.236.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

mkdir -p /etc/bind/sites
cp /etc/bind/db.local /etc/bind/sites/riegel.canyon.it06.com
cp /etc/bind/db.local /etc/bind/sites/granz.channel.it06.com
cp /etc/bind/db.local /etc/bind/sites/1.236.192.in-addr.arpa

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.it06.com. root.riegel.canyon.it06.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.it06.com.
@       IN      A       192.236.4.1     ; IP Fern
www     IN      CNAME   riegel.canyon.it06.com.' > /etc/bind/sites/riegel.canyon.it06.com

echo '
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.it06.com. root.granz.channel.it06.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.it06.com.
@       IN      A       192.236.3.1     ; IP Lugner
www     IN      CNAME   granz.channel.it06.com.' > /etc/bind/sites/granz.channel.it06.com

echo 'options {
      directory "/var/cache/bind";

      forwarders {
              192.168.122.1;
      };

      // dnssec-validation auto;
      allow-query{any;};
      auth-nxdomain no;    # conform to RFC1035
      listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options

service bind9 start
```
**Client**
```
ping riegel.canyon.it06.com -c 5
ping granz.channel.it06.com -c 5
```
### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/f0323de0-fc0a-4bf9-8fb5-515583b01398)


## Soal 2
>Semua CLIENT harus menggunakan konfigurasi dari DHCP Server. Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.16 - [prefix IP].3.32 dan [prefix IP].3.64 - [prefix IP].3.80

Konfigurasi range IP Switch3 di DHCP Server.

**Himmel**
```sh
echo 'subnet 192.236.1.0 netmask 255.255.255.0 {
}

subnet 192.236.2.0 netmask 255.255.255.0 {
}

subnet 192.236.3.0 netmask 255.255.255.0 {
    range 192.236.3.16 192.236.3.32;
    range 192.236.3.64 192.236.3.80;
    option routers 192.236.3.0;
}' > /etc/dhcp/dhcpd.conf
```

## Soal 3 
>Client yang melalui Switch4 mendapatkan range IP dari [prefix IP].4.12 - [prefix IP].4.20 dan [prefix IP].4.160 - [prefix IP].4.168

Konfigurasi range IP Switch4 di DHCP Server.

**Himmel**
```sh
echo 'subnet 192.236.1.0 netmask 255.255.255.0 {
}

subnet 192.236.2.0 netmask 255.255.255.0 {
}

subnet 192.236.3.0 netmask 255.255.255.0 {
    range 192.236.3.16 192.236.3.32;
    range 192.236.3.64 192.236.3.80;
    option routers 192.236.3.0;
}

subnet 192.236.4.0 netmask 255.255.255.0 {
    range 192.236.4.12 192.236.4.20;
    range 192.236.4.160 192.236.4.168;
    option routers 192.236.4.0;
} ' > /etc/dhcp/dhcpd.conf
```

## Soal 4 
>Client mendapatkan DNS dari Heiter dan dapat terhubung dengan internet melalui DNS tersebut

Konfigurasi option broadcast-address dan option domain-name-server di DHCP Server, dan konfigurasi DHCP Relay.

**Himmel**
```sh
echo 'subnet 192.236.1.0 netmask 255.255.255.0 {
}

subnet 192.236.2.0 netmask 255.255.255.0 {
}

subnet 192.236.3.0 netmask 255.255.255.0 {
    range 192.236.3.16 192.236.3.32;
    range 192.236.3.64 192.236.3.80;
    option routers 192.236.3.0;
    option broadcast-address 192.236.3.255;
    option domain-name-servers 192.236.1.2;
}

subnet 192.236.4.0 netmask 255.255.255.0 {
    range 192.236.4.12 192.236.4.20;
    range 192.236.4.160 192.236.4.168;
    option routers 192.236.4.0;
    option broadcast-address 192.236.4.255;
    option domain-name-servers 192.236.1.2;
} ' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server start
```
**Aura**
```sh
echo '# Defaults for isc-dhcp-relay initscript
# sourced by /etc/init.d/isc-dhcp-relay
# installed at /etc/default/isc-dhcp-relay by the maintainer scripts

#
# This is a POSIX shell fragment
#

# What servers should the DHCP relay forward requests to?
SERVERS="192.236.1.1"

# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
INTERFACES="eth1 eth2 eth3 eth4"

# Additional options that are passed to the DHCP relay daemon?
OPTIONS=""' > /etc/default/isc-dhcp-relay

service isc-dhcp-relay start 
```

Uncomment line berikut di /etc/sysctl.conf 
```
net.ipv4.ip_forward=1
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/f0323de0-fc0a-4bf9-8fb5-515583b01398)

## Soal 5
>Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch3 selama 3 menit sedangkan pada client yang melalui Switch4 selama 12 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 96 menit

Konfigurasi default-lease-time dan max-lease-team di DHCP Server.

**Himmel**
```sh
echo 'subnet 192.236.1.0 netmask 255.255.255.0 {
}

subnet 192.236.2.0 netmask 255.255.255.0 {
}

subnet 192.236.3.0 netmask 255.255.255.0 {
    range 192.236.3.16 192.236.3.32;
    range 192.236.3.64 192.236.3.80;
    option routers 192.236.3.0;
    option broadcast-address 192.236.3.255;
    option domain-name-servers 192.236.1.2;
    default-lease-time 180;
    max-lease-time 5760;
}

subnet 192.236.4.0 netmask 255.255.255.0 {
    range 192.236.4.12 192.236.4.20;
    range 192.236.4.160 192.236.4.168;
    option routers 192.236.4.0;
    option broadcast-address 192.236.4.255;
    option domain-name-servers 192.236.1.2;
    default-lease-time 720;
    max-lease-time 5760;
} ' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
```
### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/bf3cd7a4-f6cd-416e-a75d-4011ae530a1b)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/8d21e2df-7ede-474a-9ec9-dfe771b8b3a2)

## Soal 6
> Pada masing-masing worker PHP, lakukan konfigurasi virtual host untuk website berikut dengan menggunakan php 7.3. (6)

Konfigurasi website di PHP Worker.

**PHP Worker**
```sh 
wget -O '/var/www/granz.channel.it06.com' 'https://drive.google.com/u/0/uc?id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1&export=download'
unzip -o /var/www/granz.channel.it06.com -d /var/www/
rm /var/www/granz.channel.it06.com
mv /var/www/modul-3 /var/www/granz.channel.it06.com

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/granz.channel.it06.com
ln -s /etc/nginx/sites-available/granz.channel.it06.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

echo 'server {
    listen 80;
    server_name _;

    root /var/www/granz.channel.it06.com;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.3-fpm.sock;  # Sesuaikan versi PHP dan socket
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}' > /etc/nginx/sites-available/granz.channel.it06.com

service nginx restart
```

**Client**
```
lynx localhost
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/9cc5e1de-0d84-4a71-af4d-7a7ba47750a1)


## Soal 7
> Kepala suku dari Bredt Region memberikan resource server sebagai berikut: Lawine, 4GB, 2vCPU, dan 80 GB SSD. Linie, 2GB, 2vCPU, dan 50 GB SSD. Lugner 1GB, 1vCPU, dan 25 GB SSD. Aturlah agar Eisen dapat bekerja dengan maksimal, lalu lakukan testing dengan 1000 request dan 100 request/second. (7)

Konfigurasi Load Balancing di Load Balancer.

**Heiter**
```sh
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.it06.com. root.riegel.canyon.it06.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.it06.com.
@       IN      A       192.236.2.2     ; IP LB Eiken
www     IN      CNAME   riegel.canyon.it06.com.' > /etc/bind/sites/riegel.canyon.it06.com

echo '
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.it06.com. root.granz.channel.it06.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.it06.com.
@       IN      A       192.236.2.2     ; IP LB Eiken
www     IN      CNAME   granz.channel.it06.com.' > /etc/bind/sites/granz.channel.it06.com
```

**Eisen**
```sh 
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

ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service nginx restart
```

**Client**
```sh
ab -n 1000 -c 100 http://www.granz.channel.it06.com/ 
```
### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/097acc43-4eab-4a93-9048-d238f75b15cf)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/2a7e4583-b4cc-470c-8220-e84f584a0550)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/0d0de9ea-4442-4896-833f-5b18bdb3acff)


## Soal 8
> Karena diminta untuk menuliskan grimoire, buatlah analisis hasil testing dengan 200 request dan 10 request/second masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut: 1. Nama Algoritma Load Balancer; 2. Report hasil testing pada Apache Benchmark; 3.Grafik request per second untuk masing masing algoritma; 4. Analisis

Analisis algoritma Load Balancer (Generic Hash, IP Hash, Least-connection)

**Client**
```sh
ab -n 200 -c 10 http://www.granz.channel.it06.com/ 
```

### Result 

**Generic Hash**
(image)

**IP Hash**
(image)

**Least-connection**
(image)

**Grafik**
(image)

## Soal 9
> Dengan menggunakan algoritma Round Robin, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 100 request dengan 10 request/second, kemudian tambahkan grafiknya pada grimoire. (9)

Analisis algoritma Round Robin.

**Client**
```sh
ab -n 100 -c 10 http://www.granz.channel.it06.com/ 
```

### Result

**3 Worker**
(image)

**2 Worker**
(image)

**1 Worker**
(image)

**Grafik**
(image)

## Soal 10
> Selanjutnya coba tambahkan konfigurasi autentikasi di LB dengan dengan kombinasi username: “netics” dan password: “ajkyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/rahasisakita/ 

Konfigurasi autentikasi di Load Balancer.

**Eisen**
```sh 
mkdir /etc/nginx/rahasisakita
htpasswd -c /etc/nginx/rahasisakita/htpasswd netics
```
```sh
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
        auth_basic_user_file /etc/nginx/rahasiakita/htpasswd;
    }
} ' > /etc/nginx/sites-available/lb_php

ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service nginx restart
```

**client**
```sh
lynx http://www.granz.channel.it06.com/
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/677b2837-41ec-41b5-b334-82683379cea3)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/5119dd33-4011-4995-b853-153fae65a4d8)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/7288b9c7-6ded-40bc-b528-1a924b5bacdd)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/9853c247-0905-4a0c-be63-5641edc501f6)

## Soal 11
> Lalu buat untuk setiap request yang mengandung /its akan di proxy passing menuju halaman https://www.its.ac.id. (11) hint: (proxy_pass)

Konfigurasi request untuk /its.

**Eisen**
```sh
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
        auth_basic_user_file /etc/nginx/rahasiakita/htpasswd;
    }

    location ~ /its {
        proxy_pass https://www.its.ac.id;
        proxy_set_header Host www.its.ac.id;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}' > /etc/nginx/sites-available/lb_php
```

**client**
```sh
lynx www.granz.channel.it06.com/its
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/7197193a-fe60-41dd-9600-22605071144c)

## Soal 12
> Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP].3.69, [Prefix IP].3.70, [Prefix IP].4.167, dan [Prefix IP].4.168. 

Konfigurasi IP yang boleh mengakss Load Balancer.

**Eisen**
```sh
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
        allow 192.236.3.69;
        allow 192.236.3.70;
        allow 192.236.4.167;
        allow 192.236.4.168;
        deny all;
        proxy_pass http://worker;
        auth_basic "Restricted Content";
        auth_basic_user_file /etc/nginx/rahasiakita/htpasswd;
    }

    location /its {
        proxy_pass https://www.its.ac.id;
        proxy_set_header Host www.its.ac.id;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}' > /etc/nginx/sites-available/lb_php

service nginx restart
```

**client**
```sh
lynx www.granz.channel.it06.com/
```

### Result 

**Denied IP**
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/760c1d9e-f603-4bcb-a1df-bc240acd8ca0)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/beeec260-55d2-4eed-a62f-105ae1100282)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/c518510f-3d34-4bab-915a-143da385d527)

**Allowed IP**
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/f5d407eb-f040-4817-a441-7c088d0ba7e5)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/2ad28596-9325-4a0c-a9ef-96c843a9e1c0)

## Soal 13
> Semua data yang diperlukan, diatur pada Denken dan harus dapat diakses oleh Frieren, Flamme, dan Fern. (13)

Konfigurasi Database di Database Server.

**Denken**
```sh
echo '# This group is read both by the client and the server
# use it for options that affect everything
[client-server]

# Import all .cnf files from configuration directory
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

# Options affecting the MySQL server (mysqld)
[mysqld]
skip-networking=0
skip-bind-address
' > /etc/mysql/my.cnf
```

Ganti bind-address pada file /etc/mysql/mariadb.conf.d/50-server.cnf jadi 0.0.0.0
```
bind-address            = 0.0.0.0
```

Restart mysql
```
service mysql restart
```

**Denken (mysql)**
```sh
mysql -u root -p
Enter password: 

CREATE USER 'it06'@'%' IDENTIFIED BY 'passit06';
CREATE USER 'it06'@'localhost' IDENTIFIED BY 'passit06';
CREATE DATABASE dbit06;
GRANT ALL PRIVILEGES ON *.* TO 'it06'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'it06'@'localhost';
FLUSH PRIVILEGES;
```

### Result

```sh
mariadb --host=192.236.2.1 --port=3306 --user=it06 --password=passit06 dbit06 -e "SHOW DATABASES;"
```
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-3-IT06-2023/assets/113814423/96815ba3-a5c2-4d0a-bcec-2f8687e91574)
