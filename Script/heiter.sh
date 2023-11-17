echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install bind9 -y  

#1

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

#7

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