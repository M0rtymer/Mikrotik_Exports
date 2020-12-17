# sep/17/2020 12:00:11 by RouterOS 6.44
# software id = E2FC-NMBT
#
# model = CCR1009-7G-1C-1S+
# serial number = 914F0AA16B3D
/interface bridge
add name=Bridge-All-Local-Ports
/interface ethernet
set [ find default-name=ether1 ] speed=100Mbps
set [ find default-name=ether2 ] speed=100Mbps
set [ find default-name=ether3 ] speed=100Mbps
set [ find default-name=ether4 ] speed=100Mbps
set [ find default-name=ether5 ] speed=100Mbps
set [ find default-name=ether6 ] speed=100Mbps
set [ find default-name=ether7 ] speed=100Mbps
set [ find default-name=sfp-sfpplus1 ] advertise=\
    10M-full,100M-full,1000M-full
/interface l2tp-server
add name=Datacenter user=Datacenter-M7
/interface gre
add allow-fast-path=no ipsec-secret=Opti1 local-address=92.62.112.189 name=\
    to_MSK_Megafon_GRE remote-address=178.176.12.106
add allow-fast-path=no ipsec-secret=Opti1 local-address=92.62.112.189 name=\
    to_MSK_Orange_GRE remote-address=195.151.167.69
/interface vlan
add interface=Bridge-All-Local-Ports name=vlan200 vlan-id=200
/interface list
add name=Internet
add exclude=Internet include=all name=LocalLan
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip ipsec profile
add dh-group=modp1024 enc-algorithm=aes-128 name=MyProfile nat-traversal=no
/ip ipsec peer
add address=37.0.29.146/32 exchange-mode=ike2 local-address=92.62.112.189 \
    name=M7-Rackstore-ToDC profile=MyProfile
/ip ipsec proposal
add enc-algorithms=aes-128-cbc name=MyProp
/ip pool
add name=dhcp_pool0 ranges=192.168.200.150-192.168.200.200
add name=VPN ranges=192.168.201.10-192.168.201.254
add name=ServiceVPN ranges=10.10.200.20-10.10.200.200
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=vlan200 name=dhcp1
/ppp profile
add change-tcp-mss=yes local-address=10.10.200.1 name=SeviceVPN \
    remote-address=ServiceVPN use-encryption=yes
add change-tcp-mss=yes name=encription use-encryption=required
add change-tcp-mss=yes name=encript1 use-encryption=required
set *FFFFFFFE dns-server=192.168.5.8,192.168.4.9 local-address=192.168.201.1 \
    remote-address=VPN
/interface l2tp-client
add allow=mschap2 connect-to=176.221.9.250 disabled=no ipsec-secret=Opti-VPN \
    keepalive-timeout=30 name=Baltika9-R_Telecom password=\
    M7-Baltika9-R_Telecom-7556009 profile=default use-ipsec=yes user=\
    M7-Baltika9-R_Telecom
add allow=mschap2 connect-to=217.76.40.106 ipsec-secret=Opti-VPN name=\
    BumUpack-Origamo password=M7-BumUpack-Origamo-7556009 profile=default \
    use-ipsec=yes user=M7-BumUpack-Origamo
add allow=mschap2 connect-to=95.79.112.147 disabled=no ipsec-secret=Opti-VPN \
    name=HPL-ER-Telecom password=M7-HPL-ER-Telecom-7556009 profile=default \
    use-ipsec=yes user=M7-HPL-ER-Telecom
add allow=mschap2 connect-to=94.230.162.99 disabled=no ipsec-secret=Opti-VPN \
    name=Ligovka-Unis password=M7-Ligovka-Unis-7556009 profile=default \
    use-ipsec=yes user=M7-Ligovka-Unis
add allow=mschap2 connect-to=109.167.193.149 disabled=no ipsec-secret=\
    Opti-VPN name=Ligovka-WestKall password=M7-Ligovka-WestKall-7556009 \
    profile=default use-ipsec=yes user=M7-Ligovka-WestKall
add allow=mschap2 connect-to=178.176.12.105 ipsec-secret=Opti-VPN \
    keepalive-timeout=30 name=Moscow_Diapazon-Megafon password=\
    M7-Moscow_Diapazon-Megafon-7556009 profile=encript1 use-ipsec=yes user=\
    M7-Moscow_Diapazon-Megafon
add allow=mschap2 connect-to=195.151.167.65 ipsec-secret=Opti-VPN \
    keepalive-timeout=30 name=Moscow_Diapazon-Orange password=\
    M7-Moscow_Diapazon-Orange-7556009 profile=default use-ipsec=yes user=\
    M7-Moscow_Diapazon-Orange
add allow=mschap2 connect-to=89.189.1.178 disabled=no ipsec-secret=Opti-VPN \
    name=NN-Beeline password=M7-NN-Beeline-7556009 profile=default use-ipsec=\
    yes user=M7-NN-Beeline
add allow=mschap2 connect-to=95.79.111.166 disabled=no ipsec-secret=Opti-VPN \
    name=NN-DomRu password=M7-NN-DomRu-7556009 profile=default use-ipsec=yes \
    user=M7-NN-DomRu
add allow=mschap2 connect-to=91.210.85.220 disabled=no ipsec-secret=Opti-VPN \
    name=Nahabino-Fortex password=M7-Nahabino-Fortex-7556009 profile=default \
    use-ipsec=yes user=M7-Nahabino-Fortex
add allow=mschap2 connect-to=89.249.249.235 disabled=no ipsec-secret=Opti-VPN \
    name=Nahabino-Mosline password=M7-Nahabino-Mosline-7556009 profile=\
    default use-ipsec=yes user=M7-Nahabino-Mosline
add allow=mschap2 comment=PaperUpack2 connect-to=87.245.175.116 disabled=no \
    ipsec-secret=PUP2-7556009 name=PUP2-Orbita password=PUP2-7556009 profile=\
    default use-ipsec=yes user=M7-PUP2
add allow=mschap2 connect-to=5.101.196.232 disabled=no ipsec-secret=Opti-VPN \
    name=Remzona password=M7-Remzona-7556009 profile=default use-ipsec=yes \
    user=M7-Remzona
add allow=mschap2 connect-to=141.0.176.53 disabled=no ipsec-secret=Opti-VPN \
    keepalive-timeout=30 name=Samara-Avantel password=\
    M7-Samara-Avantel-7556009 profile=default use-ipsec=yes user=\
    M7-Samara-Avantel
add allow=mschap2 connect-to=85.140.63.236 disabled=no ipsec-secret=Opti-VPN \
    keepalive-timeout=30 name=Samara-MTS password=M7-Samara-MTS-7556009 \
    profile=default use-ipsec=yes user=M7-Samara-MTS
add allow=mschap2 connect-to=91.215.90.202 disabled=no ipsec-secret=\
    Sochi-7556009 name=Sochi-DagoTel password=Sochi-7556009 profile=default \
    use-ipsec=yes user=M7-Sochi
add allow=mschap2 connect-to=90.154.127.194 disabled=no ipsec-secret=Opti-VPN \
    name=Sun-City password=M7-Sun-City-7556009 profile=default use-ipsec=yes \
    user=M7-Sun-City
add allow=mschap2 connect-to=185.61.94.233 disabled=no ipsec-secret=Opti-VPN \
    name=Vkusno-Fortex password=M7-Vkusno-Fortex-7556009 profile=default \
    use-ipsec=yes user=M7-Vkusno-Fortex
/routing ospf instance
set [ find default=yes ] distribute-default=if-installed-as-type-2 \
    redistribute-connected=as-type-1 router-id=192.168.200.1
/snmp community
add addresses=192.168.5.106/32 name=pavlik
/system logging action
set 0 memory-lines=10000
set 3 remote=192.168.5.111 remote-port=11514 src-address=192.168.200.1
/user group
add name=Engineers policy="local,read,test,winbox,web,!telnet,!ssh,!ftp,!reboo\
    t,!write,!policy,!password,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=Bridge-All-Local-Ports interface=ether2
add bridge=Bridge-All-Local-Ports interface=ether3
add bridge=Bridge-All-Local-Ports interface=ether4
add bridge=Bridge-All-Local-Ports interface=ether5
add bridge=Bridge-All-Local-Ports interface=ether6
/ip firewall connection tracking
set tcp-established-timeout=10m
/ip neighbor discovery-settings
set discover-interface-list=LocalLan
/interface l2tp-server server
set allow-fast-path=yes authentication=mschap2 enabled=yes ipsec-secret=\
    Opti-VPN max-mru=1400 max-mtu=1400 use-ipsec=yes
/interface list member
add interface=ether1 list=Internet
/ip address
add address=192.168.200.1/24 interface=vlan200 network=192.168.200.0
add address=10.10.10.1/29 comment=Master interface=ether7 network=10.10.10.0
add address=92.62.112.189/25 interface=ether1 network=92.62.112.128
add address=92.62.112.190/25 interface=ether1 network=92.62.112.128
add address=92.62.112.191/25 disabled=yes interface=ether1 network=\
    92.62.112.128
add address=92.62.112.192/25 disabled=yes interface=ether1 network=\
    92.62.112.128
add address=10.10.10.2/29 comment=Slave disabled=yes interface=ether7 \
    network=10.10.10.0
add address=10.254.0.214/30 comment=GRE interface=to_MSK_Megafon_GRE network=\
    10.254.0.212
add address=10.254.0.218/30 comment=GRE interface=to_MSK_Orange_GRE network=\
    10.254.0.216
/ip dhcp-client
add dhcp-options=hostname,clientid disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.200.0/24 dns-server=192.168.5.8,192.168.4.9 gateway=\
    192.168.200.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8
/ip firewall address-list
add address=5.8.79.186 list="All My IP"
add address=5.8.79.189 list="All My IP"
add address=5.189.230.50 list="All My IP"
add address=5.189.230.54 list="All My IP"
add address=37.0.29.146 list="All My IP"
add address=37.0.29.147 list="All My IP"
add address=37.0.29.148 list="All My IP"
add address=37.0.29.149 list="All My IP"
add address=37.0.29.150 list="All My IP"
add address=37.0.29.151 list="All My IP"
add address=37.0.29.152 list="All My IP"
add address=37.0.29.153 list="All My IP"
add address=37.0.29.154 list="All My IP"
add address=37.0.29.155 list="All My IP"
add address=37.0.29.156 list="All My IP"
add address=37.0.29.157 list="All My IP"
add address=37.0.29.158 list="All My IP"
add address=109.234.159.74 list="All My IP"
add address=109.234.159.75 list="All My IP"
add address=109.234.159.76 list="All My IP"
add address=109.234.159.77 list="All My IP"
add address=109.234.159.78 list="All My IP"
add address=141.0.176.53 list="All My IP"
add address=85.140.63.236 list="All My IP"
add address=95.79.45.88 list="All My IP"
add address=89.189.1.178 list="All My IP"
add address=185.61.94.233 list="All My IP"
add address=95.79.112.147 list="All My IP"
add address=109.167.203.211 list="All My IP"
add address=95.79.121.4 list="All My IP"
add address=217.76.40.106 list="All My IP"
add address=95.79.111.166 list="All My IP"
add address=176.221.9.250 list="All My IP"
add address=94.230.162.99 list="All My IP"
add address=31.173.94.73 list="All My IP"
add address=90.154.127.194 list="All My IP"
add address=5.101.196.232 list="All My IP"
add address=81.222.228.20 list="All My IP"
add address=84.52.111.218 list="All My IP"
add address=82.202.192.197 list="All My IP"
add address=91.210.85.221 list="All My IP"
add address=89.249.249.234 list="All My IP"
add address=89.22.17.21 list="All My IP"
add address=185.47.154.104 list="All My IP"
add address=92.242.44.56 list="All My IP"
add address=185.47.154.105 list="All My IP"
add address=92.242.46.63 list="All My IP"
add address=185.47.154.103 list="All My IP"
add address=92.242.44.177 list="All My IP"
add address=92.242.44.176 list="All My IP"
add address=185.148.83.4 list="All My IP"
add address=80.75.130.0/24 list="SIP Provider"
add address=92.60.87.0/28 list="SIP Provider"
add address=46.183.164.0/28 list="SIP Provider"
add address=188.234.136.49 list="SIP Provider"
add address=185.26.194.156 list="SIP Provider"
add address=80.75.132.66 list="SIP Provider"
add address=185.26.194.154 list="SIP Provider"
add address=192.168.200.2 list=ToInternet
add address=192.168.200.6 list=ToInternet
add address=109.234.159.246 list="All My IP"
add address=192.168.4.0/23 list=ForVPN_Users
add address=192.168.200.0/24 list=ForVPN_Users
add address=192.168.200.7 list=ToInternet
add address=195.151.167.64/29 list="All My IP"
add address=178.176.12.104/29 list="All My IP"
add address=81.95.134.26 list="SIP Provider"
add address=91.210.85.220 list="All My IP"
add address=95.165.6.179 comment="Manage from AM" list=allow-mng-src
/ip firewall filter
add action=accept chain=input connection-state=established,related
add action=accept chain=forward connection-state=established,related
add action=accept chain=input comment="Accept All My IP" src-address-list=\
    "All My IP"
add action=accept chain=forward comment="Accept All My IP" src-address-list=\
    "All My IP"
add action=accept chain=input protocol=icmp
add action=drop chain=forward comment=Drop-SIP_bruteforcers connection-state=\
    new src-address-list=3cxBlackList
add action=drop chain=input comment="dropping port scanners" in-interface=\
    ether1 src-address-list=port_scanners
add action=drop chain=forward comment="dropping port scanners" in-interface=\
    ether1 src-address-list=port_scanners
add action=drop chain=input comment="Drop DNS" dst-port=53 in-interface=\
    ether1 protocol=udp
add action=drop chain=input comment="Drop DNS" dst-port=53 in-interface=\
    ether1 protocol=tcp
add action=accept chain=forward comment="Accept 3CX" dst-port=\
    5060,5061,9000-20000 in-interface=ether1 protocol=tcp src-address-list=\
    "SIP Provider"
add action=accept chain=forward comment="Accept 3CX" dst-port=\
    5060,5061,9000-20000 in-interface=ether1 protocol=udp src-address-list=\
    "SIP Provider"
add action=jump chain=input connection-state=new dst-port=8291,23,22 \
    in-interface=ether1 jump-target=check-bruteforce_Winbox protocol=tcp
add action=add-src-to-address-list address-list=bruteforce_Winbox \
    address-list-timeout=1d chain=check-bruteforce_Winbox src-address-list=\
    bruteforce_Winbox-stage-3
add action=add-src-to-address-list address-list=bruteforce_Winbox-stage-2 \
    address-list-timeout=2m chain=check-bruteforce_Winbox src-address-list=\
    bruteforce_Winbox-stage-1
add action=add-src-to-address-list address-list=bruteforce_Winbox-stage-3 \
    address-list-timeout=2m chain=check-bruteforce_Winbox src-address-list=\
    bruteforce_Winbox-stage-2
add action=add-src-to-address-list address-list=bruteforce_Winbox-stage-1 \
    address-list-timeout=2m chain=check-bruteforce_Winbox
add action=drop chain=input comment=Drop-bruteforce_Winbox connection-state=\
    new in-interface=ether1 src-address-list=bruteforce_Winbox
add action=accept chain=input comment=Accept_Winbox_Ssh dst-port=8291 \
    in-interface=ether1 protocol=tcp
add action=jump chain=forward comment=check-Kerio_bruteforce \
    connection-state=new dst-port=4090 in-interface=ether1 jump-target=\
    check-Kerio_bruteforce protocol=tcp
add action=jump chain=check-Kerio_bruteforce jump-target=\
    Block-Kerio_bruteforce src-address-list=Kerio_bruteforce-stage-4
add action=log chain=Block-Kerio_bruteforce log=yes log-prefix=\
    "Block eKerio IP" src-address-list=!Kerio_bruteforcer
add action=add-src-to-address-list address-list=Kerio_bruteforcer \
    address-list-timeout=1h30m chain=Block-Kerio_bruteforce src-address-list=\
    Kerio_bruteforce-stage-4
add action=add-src-to-address-list address-list=Kerio_bruteforce-stage-4 \
    address-list-timeout=20s chain=check-Kerio_bruteforce src-address-list=\
    Kerio_bruteforce-stage-3
add action=add-src-to-address-list address-list=Kerio_bruteforce-stage-3 \
    address-list-timeout=20s chain=check-Kerio_bruteforce src-address-list=\
    Kerio_bruteforce-stage-2
add action=add-src-to-address-list address-list=Kerio_bruteforce-stage-2 \
    address-list-timeout=20s chain=check-Kerio_bruteforce src-address-list=\
    Kerio_bruteforce-stage-1
add action=add-src-to-address-list address-list=Kerio_bruteforce-stage-1 \
    address-list-timeout=20s chain=check-Kerio_bruteforce
add action=drop chain=forward comment=Drop-Kerio_bruteforcers \
    connection-state=new src-address-list=Kerio_bruteforcer
add action=accept chain=forward comment=Kerio_Accept dst-port=4090 \
    in-interface=ether1 protocol=tcp
add action=accept chain=forward comment=Kerio_Accept dst-port=4090 \
    in-interface=ether1 protocol=udp
add action=jump chain=input comment=check-VPN_bruteforce connection-state=new \
    disabled=yes dst-port=1701,500,4500 in-interface=ether1 jump-target=\
    check-VPN_bruteforce protocol=udp
add action=jump chain=check-VPN_bruteforce disabled=yes jump-target=\
    Block-VPN_bruteforce src-address-list=MAIL_bruteforce-stage-4
add action=log chain=Block-VPN_bruteforce disabled=yes log=yes log-prefix=\
    "Block eVPN IP" src-address-list=!VPN_bruteforcer
add action=add-src-to-address-list address-list=VPN_bruteforcer \
    address-list-timeout=1d chain=check-VPN_bruteforce connection-state=new \
    disabled=yes src-address-list=VPN_bruteforce-stage-4
add action=add-src-to-address-list address-list=VPN_bruteforce-stage-4 \
    address-list-timeout=10s chain=check-VPN_bruteforce connection-state=new \
    disabled=yes src-address-list=VPN_bruteforce-stage-3
add action=add-src-to-address-list address-list=VPN_bruteforce-stage-3 \
    address-list-timeout=10s chain=check-VPN_bruteforce connection-state=new \
    disabled=yes src-address-list=VPN_bruteforce-stage-2
add action=add-src-to-address-list address-list=VPN_bruteforce-stage-2 \
    address-list-timeout=10s chain=check-VPN_bruteforce connection-state=new \
    disabled=yes src-address-list=VPN_bruteforce-stage-1
add action=add-src-to-address-list address-list=VPN_bruteforce-stage-1 \
    address-list-timeout=10s chain=check-VPN_bruteforce connection-state=new \
    disabled=yes
add action=drop chain=input comment=Drop-VPN_bruteforcers connection-state=\
    new disabled=yes src-address-list=VPN_bruteforcer
add action=accept chain=input comment=VPN_Accept dst-port=1701,500,4500 \
    in-interface=ether1 protocol=udp
add action=accept chain=input comment="accept GRE" in-interface-list=Internet \
    protocol=gre
add action=jump chain=forward comment=check-RDP_bruteforce connection-state=\
    new dst-port=4443,443 in-interface=ether1 jump-target=\
    check-RDP_bruteforce protocol=tcp
add action=jump chain=forward comment=check-RDP_bruteforce connection-state=\
    new dst-port=3391 in-interface=ether1 jump-target=check-RDP_bruteforce \
    protocol=udp
add action=jump chain=check-RDP_bruteforce jump-target=Block-RDP_bruteforce \
    src-address-list=RDP_bruteforce-stage-13
add action=log chain=Block-RDP_bruteforce log=yes log-prefix="Block eRDP IP" \
    src-address-list=!RDP_bruteforcer
add action=add-src-to-address-list address-list=RDP_bruteforcer \
    address-list-timeout=12h chain=Block-RDP_bruteforce log=yes log-prefix=\
    "Block eRDP IP" src-address-list=!RDP_bruteforcer
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-13 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-12
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-12 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-11
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-11 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-10
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-10 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-9
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-9 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-8
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-8 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-7
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-7 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-6
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-6 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-5
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-5 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-4
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-4 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-3
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-3 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-2
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-2 \
    address-list-timeout=20s chain=check-RDP_bruteforce src-address-list=\
    RDP_bruteforce-stage-1
add action=add-src-to-address-list address-list=RDP_bruteforce-stage-1 \
    address-list-timeout=20s chain=check-RDP_bruteforce
add action=drop chain=forward comment=Drop-RDP_bruteforcers connection-state=\
    new disabled=yes src-address-list=RDP_bruteforcer
add action=accept chain=forward comment=RDP_Accept dst-port=4443,443 \
    in-interface=ether1 protocol=tcp
add action=accept chain=forward comment=RDP_Accept dst-port=3391 \
    in-interface=ether1 protocol=udp
add action=accept chain=forward comment="Accept 3CX HTTPS" dst-port=5001 \
    in-interface=ether1 protocol=tcp
add action=accept chain=forward comment="Accept 3CX HTTPS" dst-port=5090 \
    in-interface=ether1 protocol=tcp
add action=accept chain=forward comment="Accept 3CX HTTPS" dst-port=5090 \
    in-interface=ether1 protocol=udp
add action=jump chain=forward comment=check-MAIL_bruteforce connection-state=\
    new disabled=yes dst-port=25,465,587,993,443 in-interface=ether1 \
    jump-target=check-MAIL_bruteforce protocol=tcp
add action=jump chain=check-MAIL_bruteforce disabled=yes jump-target=\
    Block-MAIL_bruteforce src-address-list=MAIL_bruteforce-stage-8
add action=log chain=Block-MAIL_bruteforce disabled=yes log=yes log-prefix=\
    "Block email IP" src-address-list=!MAIL_bruteforcer
add action=add-src-to-address-list address-list=MAIL_bruteforcer \
    address-list-timeout=30m chain=Block-MAIL_bruteforce disabled=yes \
    src-address-list=MAIL_bruteforce-stage-8
add action=add-src-to-address-list address-list=MAIL_bruteforce-stage-7 \
    address-list-timeout=20s chain=check-MAIL_bruteforce disabled=yes \
    src-address-list=MAIL_bruteforce-stage-6
add action=add-src-to-address-list address-list=MAIL_bruteforce-stage-8 \
    address-list-timeout=20s chain=check-MAIL_bruteforce disabled=yes \
    src-address-list=MAIL_bruteforce-stage-7
add action=add-src-to-address-list address-list=MAIL_bruteforce-stage-6 \
    address-list-timeout=20s chain=check-MAIL_bruteforce disabled=yes \
    src-address-list=MAIL_bruteforce-stage-5
add action=add-src-to-address-list address-list=MAIL_bruteforce-stage-5 \
    address-list-timeout=20s chain=check-MAIL_bruteforce disabled=yes \
    src-address-list=MAIL_bruteforce-stage-4
add action=add-src-to-address-list address-list=MAIL_bruteforce-stage-4 \
    address-list-timeout=20s chain=check-MAIL_bruteforce disabled=yes \
    src-address-list=MAIL_bruteforce-stage-3
add action=add-src-to-address-list address-list=MAIL_bruteforce-stage-3 \
    address-list-timeout=20s chain=check-MAIL_bruteforce disabled=yes \
    src-address-list=MAIL_bruteforce-stage-2
add action=add-src-to-address-list address-list=MAIL_bruteforce-stage-2 \
    address-list-timeout=20s chain=check-MAIL_bruteforce disabled=yes \
    src-address-list=MAIL_bruteforce-stage-1
add action=add-src-to-address-list address-list=MAIL_bruteforce-stage-1 \
    address-list-timeout=20s chain=check-MAIL_bruteforce disabled=yes
add action=drop chain=forward comment=Drop-MAIL_bruteforcers \
    connection-state=new disabled=yes src-address-list=MAIL_bruteforcer
add action=accept chain=forward comment=Mail_Accept disabled=yes dst-port=\
    25,465,587,993,443 in-interface=ether1 protocol=tcp
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="Port scanners to list" \
    protocol=tcp psd=21,3s,3,1
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="NMAP FIN Stealth scan" \
    protocol=tcp tcp-flags=fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="SYN/FIN scan" protocol=tcp \
    tcp-flags=fin,syn
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="SYN/RST scan" protocol=tcp \
    tcp-flags=syn,rst
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="FIN/PSH/URG scan" protocol=\
    tcp tcp-flags=fin,psh,urg,!syn,!rst,!ack
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="ALL/ALL scan" protocol=tcp \
    tcp-flags=fin,syn,rst,psh,ack,urg
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="NMAP NULL scan" protocol=tcp \
    tcp-flags=!fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=input comment=Drop_ALL in-interface=ether1
add action=drop chain=forward comment=Drop_ALL connection-state=new \
    in-interface=ether1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1 src-address=\
    192.168.200.0/24
add action=dst-nat chain=dstnat dst-port=5001,5060,5061,5090,9000-20000 \
    in-interface=ether1 protocol=tcp to-addresses=192.168.200.6
add action=dst-nat chain=dstnat dst-port=5001,5060,5061,5090,9000-20000 \
    in-interface=ether1 protocol=udp to-addresses=192.168.200.6
add action=dst-nat chain=dstnat dst-port=4090 in-interface=ether1 protocol=\
    tcp to-addresses=192.168.200.2
add action=dst-nat chain=dstnat dst-port=4090 in-interface=ether1 protocol=\
    udp to-addresses=192.168.200.2
add action=dst-nat chain=dstnat dst-address=92.62.112.190 dst-port=443 \
    in-interface=ether1 protocol=tcp to-addresses=192.168.200.115 to-ports=\
    443
add action=dst-nat chain=dstnat dst-address=92.62.112.189 dst-port=443 \
    in-interface=ether1 protocol=tcp to-addresses=192.168.200.200 to-ports=\
    443
add action=dst-nat chain=dstnat dst-address=92.62.112.190 dst-port=3391 \
    in-interface=ether1 protocol=udp to-addresses=192.168.200.115
add action=dst-nat chain=dstnat dst-address=92.62.112.189 dst-port=3391 \
    in-interface=ether1 protocol=udp to-addresses=192.168.200.200
/ip firewall raw
add action=drop chain=prerouting log=yes src-address-list=port_scanners
/ip firewall service-port
set tftp disabled=yes
set irc disabled=yes
set h323 disabled=yes
set sip disabled=yes
set pptp disabled=yes
set udplite disabled=yes
set dccp disabled=yes
set sctp disabled=yes
/ip ipsec identity
add peer=M7-Rackstore-ToDC secret=Opti-VPN7556009
/ip ipsec policy
add dst-address=37.0.29.146/32 proposal=MyProp src-address=92.62.112.189/32
/ip route
add distance=1 gateway=92.62.112.129
add distance=2 dst-address=192.168.6.0/24 gateway=Remzona scope=20
add check-gateway=ping distance=2 dst-address=192.168.7.0/24 gateway=\
    Vkusno-Fortex scope=20
add check-gateway=ping distance=2 dst-address=192.168.8.0/24 gateway=Sun-City \
    scope=20
add check-gateway=ping distance=2 dst-address=192.168.20.0/22 gateway=\
    to_MSK_Orange_GRE scope=20
add check-gateway=ping distance=3 dst-address=192.168.20.0/22 gateway=\
    to_MSK_Megafon_GRE scope=20
add check-gateway=ping distance=3 dst-address=192.168.62.0/23 gateway=\
    Samara-Avantel scope=10
add check-gateway=ping distance=4 dst-address=192.168.62.0/23 gateway=\
    Samara-MTS scope=10
add check-gateway=ping distance=2 dst-address=192.168.110.0/24 gateway=\
    PUP2-Orbita scope=20
add distance=2 dst-address=192.168.120.0/23 gateway=Sochi-DagoTel
add check-gateway=ping distance=2 dst-address=192.168.151.0/24 gateway=\
    HPL-ER-Telecom scope=20
add check-gateway=ping distance=2 dst-address=192.168.152.0/23 gateway=\
    NN-DomRu
add check-gateway=ping distance=3 dst-address=192.168.152.0/23 gateway=\
    NN-Beeline
add distance=10 dst-address=192.168.178.0/24 gateway=Ligovka-WestKall scope=\
    20
add distance=11 dst-address=192.168.178.0/24 gateway=Ligovka-Unis scope=20
add check-gateway=ping distance=2 dst-address=192.168.180.0/23 gateway=\
    Baltika9-R_Telecom scope=20
add distance=1 dst-address=192.168.204.0/22 gateway=Nahabino-Fortex scope=20
add check-gateway=ping distance=2 dst-address=192.168.204.0/22 gateway=\
    Nahabino-Mosline scope=20
/ip service
set telnet address=192.168.4.18/32
set ftp address=10.10.10.0/29
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/ip ssh
set allow-none-crypto=yes
/lcd
set backlight-timeout=never default-screen=informative-slideshow \
    read-only-mode=yes touch-screen=disabled
/lcd interface
set sfp-sfpplus1 disabled=yes
set combo1 disabled=yes
set ether2 disabled=yes
set ether3 disabled=yes
set ether4 disabled=yes
set ether5 disabled=yes
set ether6 disabled=yes
set ether7 disabled=yes
/lcd screen
set 0 disabled=yes
set 1 disabled=yes
set 2 disabled=yes
set 3 disabled=yes
set 5 disabled=yes
/ppp aaa
set use-radius=yes
/ppp secret
add name=lubaev password=6Qi3sfPK4xXV@ profile=default-encryption service=\
    l2tp
add name=dc password=dc-7556009 profile=SeviceVPN service=l2tp
add local-address=10.254.0.253 name=Datacenter-M7 password=\
    Datacenter-M7-7556009 profile=encription remote-address=10.254.0.254 \
    service=l2tp
/radius
add address=192.168.5.20 secret=2013Gbnth09 service=ppp src-address=\
    192.168.200.1 timeout=3s
/routing filter
add action=accept chain=ospf-out prefix=192.168.200.0/24
add action=accept chain=ospf-out prefix=192.168.201.0/24
add action=discard chain=ospf-out
add action=discard chain=ospf-in prefix=192.168.20.0/22
/routing ospf interface
add interface=Datacenter network-type=point-to-point
/routing ospf network
add area=backbone network=10.0.10.123/32
add area=backbone network=192.168.201.0/24
add area=backbone network=10.0.10.122/32
add area=backbone network=10.0.10.0/24
add area=backbone network=10.254.0.252/30
/snmp
set enabled=yes location=Moscow trap-community=pavlik trap-interfaces=vlan200 \
    trap-version=2
/system clock
set time-zone-autodetect=no time-zone-name=Europe/Moscow
/system identity
set name=M7_MikroTik_Master
/system logging
add topics=script
add disabled=yes topics=ospf
add action=remote topics=info,system,ipsec
/system ntp client
set enabled=yes primary-ntp=192.168.4.9
/system scheduler
add disabled=yes interval=10m name=Reset on-event=\
    Reset_to_def_and_load_config policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=1d1m1s name=BackupConfig on-event=ConfigToBackup policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=20m name=Add3cxBlackList on-event=Add3cxBlackList policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=oct/11/2019 start-time=12:05:00
add interval=1w name=Weekly_Backup_Scheduler on-event=Weekly_Backup_Script \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/03/2019 start-time=12:00:00
/system script
add dont-require-permissions=no name=ConfigToBackup owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    ip address\r\
    \ndisable [find comment=\"Master\"]\r\
    \nenable [find comment=\"Slave\"]\r\
    \n\r\
    \n/system scheduler \r\
    \n     enable [find name=Reset]\r\
    \n/system scheduler \r\
    \n    disable [find name=BackupConfig]\r\
    \n\r\
    \n/system identity set name=M7_MikroTik_Slave\r\
    \n\r\
    \n/export compact file=\"config_full.rsc\";\r\
    \n:delay 1s;\r\
    \n\r\
    \n/ip address\r\
    \ndisable [find comment=\"Slave\"]\r\
    \nenable [find comment=\"Master\"]\r\
    \n\r\
    \n/system scheduler \r\
    \n   disable [find name=Reset]\r\
    \n/system scheduler \r\
    \n   enable [find name=BackupConfig]\r\
    \n\r\
    \n/system identity set name=M7_MikroTik_Master\r\
    \n\r\
    \n:delay 1s;\r\
    \n\r\
    \n:local ts \"/user set admin password=Cfyrn-Gtnth,ehu-9914sexsex \\n/impo\
    rt config_full.rsc\"\r\
    \n\r\
    \n/file print file=start.txt\r\
    \n:delay 1s;\r\
    \n/file set start.txt contents=\$ts\r\
    \n\r\
    \n# upload the config export\r\
    \n:log info message=\"Uploading config export\"\r\
    \n/tool fetch address=\"10.10.10.2\" src-path=\"config_full.rsc\" user=\"a\
    dmin\" mode=ftp password=\"Cfyrn-Gtnth,ehu-9914sexsex\" dst-path=\"config_\
    full.rsc\" upload=yes\r\
    \n/tool fetch address=\"10.10.10.2\" src-path=\"start.txt\" user=\"admin\"\
    \_mode=ftp password=\"Cfyrn-Gtnth,ehu-9914sexsex\" dst-path=\"start.rsc\" \
    upload=yes\r\
    \n\r\
    \n/file remove config_full.rsc;\r\
    \n/file remove start.txt;\r\
    \n"
add dont-require-permissions=no name=Reset_to_def_and_load_config owner=admin \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=":foreach i in=[/file find] do={ :if ([:typeof [:find [/file get \$\
    i name] \"start_new.rsc\"]]!=\"nil\") do={\r\
    \n/file remove start_new\r\
    \n/file remove config_full.rsc\r\
    \n}\r\
    \n}\r\
    \n:foreach i in=[/file find] do={ :if ([:typeof [:find [/file get \$i name\
    ] \"start.rsc\"]]!=\"nil\") do={\r\
    \n/tool fetch address=\"10.10.10.2\" src-path=\"start.rsc\" user=\"admin\"\
    \_mode=ftp password=\"Cfyrn-Gtnth,ehu-9914sexsex\" dst-path=\"start_new.rs\
    c\" upload=yes\r\
    \n/file remove start.rsc;\r\
    \n:delay 1s;\r\
    \n:foreach i in=[/file find] do={ :if ([:typeof [:find [/file get \$i name\
    ] \"start_new.rsc\"]]!=\"nil\") do={/system reset-configuration no-default\
    s=yes skip-backup=yes run-after-reset=\"\$i\"}; }\r\
    \n} \r\
    \n}\r\
    \n\r\
    \n"
add dont-require-permissions=no name=Add3cxBlackList owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch url=\"ftp://192.168.4.21/3cx/3cx_bl.txt\" user=uftp  password=Q\
    q000000Qq dst-path=3cx_bl.txt\r\
    \n:delay 2s;\r\
    \nif ( [/file get [/file find name=3cx_bl.txt] size] > 0 ) do={\r\
    \n\r\
    \n\r\
    \n/file print file=rezult.txt\r\
    \n\r\
    \n\r\
    \n:global content [/file get [/file find name=\"3cx_bl.txt\"] contents] ;\
    \r\
    \n:global contentLen [ :len \$content ] ;\r\
    \n:global lineEnd 0;\r\
    \n:global line \"\";\r\
    \n:global lastEnd 0;\r\
    \n:global lineoffile \"\";\r\
    \n\r\
    \n\r\
    \n:do {\r\
    \n:set lineEnd [:find \$content \"\\n\" \$lastEnd ] ;\r\
    \n:set line [:pick \$content \$lastEnd \$lineEnd] ;\r\
    \n:set lastEnd ( \$lineEnd + 1 ) ;\r\
    \n\r\
    \n:local entry [:pick \$line 0 (\$lineEnd) ]\r\
    \n:if ( [:len \$entry ] > 0 ) do={\r\
    \n/log info \$entry;\r\
    \n:set \$lineoffile (\$lineoffile . \"/ip firewall address-list add list=3\
    cxBlackList \" . \"address=\" . \$line);\r\
    \n:delay 300ms;\r\
    \n}\r\
    \n} while (\$lineEnd < \$contentLen - 1) \r\
    \n\r\
    \n/file set rezult.txt contents=\$lineoffile\r\
    \n:delay 2s;\r\
    \n/tool fetch address=\"10.10.10.1\" src-path=\"rezult.txt\" user=\"admin\
    \" mode=ftp password=\"Cfyrn-Gtnth,ehu-9914sexsex\" dst-path=\"rezult.rsc\
    \" upload=yes\r\
    \n:delay 2s;\r\
    \n\r\
    \n/file remove rezult.txt;\r\
    \n/file remove \"3cx_bl.txt\";\r\
    \n/import rezult.rsc\r\
    \n:delay 2s;\r\
    \n/file remove rezult.rsc;\r\
    \n\r\
    \n/file print file=blank.txt\r\
    \n:delay 1s;\r\
    \n:local zero \"\"\r\
    \n/file set blank.txt contents=\$zero\r\
    \n:delay 1s;\r\
    \n/tool fetch address=\"192.168.4.21\" src-path=\"blank.txt\" user=uftp mo\
    de=ftp password=Qq000000Qq dst-path=\"3cx/3cx_bl.txt\" upload=yes\r\
    \n:delay 1s;\r\
    \n/file remove blank.txt;\r\
    \n\r\
    \n}"
add dont-require-permissions=no name=Weekly_Backup_Script owner=Smegol \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=":local MailServer [:resolve \"smtp.gmail.com\"];\r\
    \n:local MailUser \"hd555.it@gmail.com\";\r\
    \n:local MailPass \"Slonopotam@!2017\";\r\
    \n:local MailSender \"hd555.it@gmail.com\";\r\
    \n:local MailTo \"compuage@gmail.com\";\r\
    \n:log info \"Starting Backup Script...\";\r\
    \n:local sysname [/system identity get name];\r\
    \n:local sysver [/system package get system version];\r\
    \n:log info \"Flushing DNS cache...\";\r\
    \n/ip dns cache flush;\r\
    \n:delay 2;\r\
    \n:log info \"Deleting last Backups...\";\r\
    \n:foreach i in=[/file find] do={:if ([:typeof [:find [/file get \$i name]\
    \_\"\$sysname-backup-\"]]!=\"nil\") do={/file remove \$i}};\r\
    \n:delay 2;\r\
    \n:local backupfile (\"\$sysname-backup-\" . [:pick [/system clock get dat\
    e] 7 11] . [:pick [/system clock get date] 0 3] . [:pick [/system clock ge\
    t date] 4 6] . \".backup\");\r\
    \n:log info \"Creating new Full Backup file...\";\r\
    \n/system backup save name=\$backupfile;\r\
    \n:delay 2;\r\
    \n:log info \"Sending Full Backup file via E-mail...\";\r\
    \n/tool e-mail send from=\$MailSender to=\$MailTo server=\$MailServer port\
    =587 user=\$MailUser password=\$MailPass start-tls=yes \\\r\
    \n file=\$backupfile subject=(\"\$sysname Full Backup (\" . [/system clock\
    \_get date] . \")\") \\\r\
    \n body=(\"\$sysname full Backup file see in attachment. \
    \nRouterOS version:\$sysver.\");\r\
    \n:delay 5;\r\
    \n:local exportfile (\"\$sysname-backup-\" . [:pick [/system clock get dat\
    e] 7 11] . [:pick [/system clock get date] 0 3] . [:pick [/system clock ge\
    t date] 4 6] . \".rsc\");\r\
    \n:log info \"Creating new Setup Script file...\";\r\
    \n/export file=\$exportfile;\r\
    \n:delay 2;\r\
    \n:log info \"Sending Setup Script file via E-mail...\";\r\
    \n/tool e-mail send from=\$MailSender to=\$MailTo server=\$MailServer port\
    =587 user=\$MailUser password=\$MailPass start-tls=yes \\\r\
    \n file=\$exportfile subject=(\"\$sysname Setup Script Backup (\" . [/syst\
    em clock get date] . \")\") \\\r\
    \n body=(\"\$sysname Setup Script file see in attachment. \
    \nRouterOS version:\$sysver.\");\r\
    \n:delay 5;\r\
    \n:log info \"All System Backups emailed successfully.\
    \nBackuping completed.\""
/tool e-mail
set address=mail.opti-com.ru from=mikrotik@opti-com.ru password=5e76a8Ts55 \
    start-tls=yes user=mikrotik
/tool mac-server
set allowed-interface-list=LocalLan
/tool mac-server mac-winbox
set allowed-interface-list=LocalLan
