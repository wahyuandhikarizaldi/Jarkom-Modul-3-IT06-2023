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
}
 
host Lawine {
    hardware ethernet 92:7f:26:b6:37:a2;
    fixed-address 192.236.3.3;
}

host Linie {
    hardware ethernet da:43:71:45:9a:d4;
    fixed-address 192.236.3.2;
}

host Lugner {
    hardware ethernet 46:9f:6b:52:43:37;
    fixed-address 192.236.3.1;
}

host Frieren {
    hardware ethernet a2:53:7b:3e:ff:68;
    fixed-address 192.236.4.3;
}

host Flamme {
    hardware ethernet 4e:b0:ee:3d:60:cd;
    fixed-address 192.236.4.2;
}

host Fern {
    hardware ethernet 1e:6d:bd:68:78:76;
    fixed-address 192.236.4.1;
}

host Revolte {
    hardware ethernet 72:6b:28:1d:7f:63;
    fixed-address 192.236.3.69;
} ' > /etc/dhcp/dhcpd.conf

echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

service isc-dhcp-server restart