echo 'nameserver 192.236.1.2' > /etc/resolv.conf
apt-get update
apt install isc-dhcp-server -y

#2

echo 'subnet 192.236.1.0 netmask 255.255.255.0 {
}

subnet 192.236.2.0 netmask 255.255.255.0 {
}

subnet 192.236.3.0 netmask 255.255.255.0 {
    range 192.236.3.16 192.236.3.32;
    range 192.236.3.64 192.236.3.80;
    option routers 192.236.3.0;
}' > /etc/dhcp/dhcpd.conf

#3

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

#4

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

#5

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