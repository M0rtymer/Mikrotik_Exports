# oct/15/2020 12:08:05 by RouterOS 6.47.4
# software id = WFUC-UZZF
#
# model = CCR1009-7G-1C-1S+
# serial number = 914F0A408EF1
/interface bridge
add name=Local
/interface ethernet
set [ find default-name=combo1 ] loop-protect=on
set [ find default-name=ether3 ] loop-protect=on
set [ find default-name=ether4 ] loop-protect=on
set [ find default-name=ether5 ] loop-protect=on
set [ find default-name=sfp-sfpplus1 ] loop-protect=on
/interface l2tp-server
add name=mikrotik4-5 user=mikrotik
/interface gre
add allow-fast-path=no disabled=yes ipsec-secret=Opti_OSPF-7556009 \
    local-address=94.230.162.99 mtu=1350 name=to_M8_Unis remote-address=\
    37.0.29.153
add allow-fast-path=no disabled=yes ipsec-secret=Opti_OSPF-7556009 \
    local-address=109.167.193.149 mtu=1350 name=to_M8_WestCall \
    remote-address=37.0.29.153
add allow-fast-path=no disabled=yes ipsec-secret=Opti_SIP-7556009 \
    local-address=94.230.162.99 mtu=1350 name=to_M9_ATS_Unis remote-address=\
    109.234.159.244
add allow-fast-path=no disabled=yes ipsec-secret=Opti_SIP-7556009 \
    local-address=109.167.193.149 mtu=1350 name=to_M9_ATS_Westcall \
    remote-address=109.234.159.244
/interface list
add name=wan
add exclude=wan include=all name=LocalLan
add name=lan
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=l2tp ranges=172.20.3.2-172.20.3.100
add name=Local178 ranges=192.168.178.30-192.168.178.200
/ip dhcp-server
add add-arp=yes address-pool=Local178 interface=Local lease-time=2h name=\
    Local
/ppp profile
add change-tcp-mss=yes local-address=172.20.3.1 name=VPN-Internet \
    remote-address=l2tp use-encryption=yes
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-1 router-id=\
    192.168.178.1
/snmp community
add addresses=192.168.5.106/32 name=pavlik
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=Engineers policy="local,read,test,winbox,web,!telnet,!ssh,!ftp,!reboo\
    t,!write,!policy,!password,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=Local interface=sfp-sfpplus1
add bridge=Local interface=combo1
add bridge=Local interface=ether3
add bridge=Local interface=ether4
add bridge=Local interface=ether5
/ip neighbor discovery-settings
set discover-interface-list=LocalLan
/interface l2tp-server server
set authentication=mschap2 enabled=yes ipsec-secret=Opti-VPN use-ipsec=yes
/interface list member
add interface=ether1 list=wan
add interface=ether2 list=wan
add interface=Local list=lan
/ip address
add address=10.10.10.1/29 comment=Master interface=ether6 network=10.10.10.0
add address=94.230.162.99/26 interface=ether2 network=94.230.162.64
add address=109.167.193.149/25 interface=ether1 network=109.167.193.128
add address=10.10.10.2/29 comment=Slave disabled=yes interface=ether6 \
    network=10.10.10.0
add address=192.168.178.1/24 interface=Local network=192.168.178.0
add address=10.254.2.26/30 disabled=yes interface=to_M9_ATS_Unis network=\
    10.254.2.24
add address=10.254.2.30/30 disabled=yes interface=to_M9_ATS_Westcall network=\
    10.254.2.28
add address=10.254.1.26/30 disabled=yes interface=to_M8_WestCall network=\
    10.254.1.24
add address=10.254.1.30/30 disabled=yes interface=to_M8_Unis network=\
    10.254.1.28
/ip dhcp-server lease
add address=Local178 client-id=1:0:15:65:40:af:31 mac-address=\
    00:15:65:40:AF:31 server=Local
add address=Local178 client-id=1:0:15:65:89:c6:58 mac-address=\
    00:15:65:89:C6:58 server=Local
add address=Local178 client-id=1:0:15:65:89:9d:79 mac-address=\
    00:15:65:89:9D:79 server=Local
add address=Local178 client-id=1:0:15:65:a0:6e:3a mac-address=\
    00:15:65:A0:6E:3A server=Local
add address=Local178 client-id=1:0:15:65:89:c5:ca mac-address=\
    00:15:65:89:C5:CA server=Local
add address=Local178 client-id=1:80:5e:c0:5:84:65 mac-address=\
    80:5E:C0:05:84:65 server=Local
add address=Local178 client-id=1:0:15:65:f1:8:5e mac-address=\
    00:15:65:F1:08:5E server=Local
add address=Local178 client-id=1:0:15:65:be:ee:3b mac-address=\
    00:15:65:BE:EE:3B server=Local
add address=Local178 client-id=1:80:5e:c0:5:83:61 mac-address=\
    80:5E:C0:05:83:61 server=Local
add address=Local178 client-id=1:0:15:65:f1:7:fe mac-address=\
    00:15:65:F1:07:FE server=Local
add address=Local178 client-id=1:0:15:65:89:99:1d mac-address=\
    00:15:65:89:99:1D server=Local
add address=Local178 client-id=1:0:15:65:f6:2:11 mac-address=\
    00:15:65:F6:02:11 server=Local
add address=Local178 client-id=1:0:15:65:a0:69:24 mac-address=\
    00:15:65:A0:69:24 server=Local
add address=Local178 client-id=1:0:15:65:89:9e:10 mac-address=\
    00:15:65:89:9E:10 server=Local
add address=Local178 client-id=1:0:15:65:be:f0:8e mac-address=\
    00:15:65:BE:F0:8E server=Local
add address=Local178 client-id=1:0:15:65:be:e4:fb mac-address=\
    00:15:65:BE:E4:FB server=Local
add address=Local178 client-id=1:80:5e:c0:2c:3b:13 mac-address=\
    80:5E:C0:2C:3B:13 server=Local
add address=Local178 client-id=1:80:5e:c0:5:7d:fe mac-address=\
    80:5E:C0:05:7D:FE server=Local
add address=Local178 client-id=1:0:15:65:be:ed:61 mac-address=\
    00:15:65:BE:ED:61 server=Local
add address=Local178 client-id=1:80:5e:c0:2c:3b:2d mac-address=\
    80:5E:C0:2C:3B:2D server=Local
add address=Local178 client-id=1:80:5e:c0:5:82:94 mac-address=\
    80:5E:C0:05:82:94 server=Local
add address=192.168.178.22 client-id=1:4:18:d6:e0:75:ff mac-address=\
    04:18:D6:E0:75:FF server=Local
add address=192.168.178.23 client-id=1:4:18:d6:e0:75:fd mac-address=\
    04:18:D6:E0:75:FD server=Local
add address=192.168.178.11 client-id=1:cc:2d:e0:8c:d8:30 mac-address=\
    CC:2D:E0:8C:D8:30 server=Local
add address=Local178 client-id=1:0:15:65:93:fe:a6 mac-address=\
    00:15:65:93:FE:A6 server=Local
add address=Local178 client-id=1:0:15:65:94:0:f6 mac-address=\
    00:15:65:94:00:F6 server=Local
add address=Local178 client-id=1:0:15:65:a0:69:7 mac-address=\
    00:15:65:A0:69:07 server=Local
add address=Local178 client-id=1:0:15:65:f1:8:f mac-address=00:15:65:F1:08:0F \
    server=Local
add address=Local178 client-id=1:0:15:65:b6:62:b5 mac-address=\
    00:15:65:B6:62:B5 server=Local
add address=Local178 client-id=1:0:15:65:be:f0:c1 mac-address=\
    00:15:65:BE:F0:C1 server=Local
add address=Local178 client-id=1:0:15:65:e3:6d:86 mac-address=\
    00:15:65:E3:6D:86 server=Local
add address=Local178 client-id=1:0:15:65:94:c:c8 mac-address=\
    00:15:65:94:0C:C8 server=Local
add address=Local178 client-id=1:0:15:65:ca:d:52 mac-address=\
    00:15:65:CA:0D:52 server=Local
add address=Local178 client-id=1:0:15:65:94:c:bc mac-address=\
    00:15:65:94:0C:BC server=Local
add address=Local178 client-id=1:80:5e:c0:12:23:74 mac-address=\
    80:5E:C0:12:23:74 server=Local
add address=Local178 client-id=1:0:15:65:89:c6:82 mac-address=\
    00:15:65:89:C6:82 server=Local
add address=Local178 client-id=1:0:15:65:be:ee:4d mac-address=\
    00:15:65:BE:EE:4D server=Local
add address=Local178 client-id=1:80:5e:c0:6:87:1e mac-address=\
    80:5E:C0:06:87:1E server=Local
add address=Local178 client-id=1:0:15:65:94:13:95 mac-address=\
    00:15:65:94:13:95 server=Local
add address=Local178 client-id=1:0:15:65:a0:69:29 mac-address=\
    00:15:65:A0:69:29 server=Local
add address=Local178 client-id=1:0:15:65:be:b1:fa mac-address=\
    00:15:65:BE:B1:FA server=Local
add address=Local178 client-id=1:0:15:65:40:b1:75 mac-address=\
    00:15:65:40:B1:75 server=Local
add address=192.168.178.21 client-id=1:4:18:d6:e0:77:70 mac-address=\
    04:18:D6:E0:77:70 server=Local
add address=Local178 client-id=1:0:15:65:be:b1:ed mac-address=\
    00:15:65:BE:B1:ED server=Local
add address=Local178 client-id=1:0:15:65:89:9e:11 mac-address=\
    00:15:65:89:9E:11 server=Local
add address=Local178 client-id=1:0:15:65:b6:63:56 mac-address=\
    00:15:65:B6:63:56 server=Local
add address=Local178 client-id=1:0:15:65:a0:67:b9 mac-address=\
    00:15:65:A0:67:B9 server=Local
add address=Local178 client-id=1:0:15:65:b6:63:60 mac-address=\
    00:15:65:B6:63:60 server=Local
add address=Local178 client-id=1:0:15:65:be:ee:e mac-address=\
    00:15:65:BE:EE:0E server=Local
add address=Local178 client-id=1:0:15:65:94:1:18 mac-address=\
    00:15:65:94:01:18 server=Local
add address=Local178 client-id=1:0:15:65:ca:d:9a mac-address=\
    00:15:65:CA:0D:9A server=Local
add address=Local178 client-id=1:0:15:65:94:1:7e mac-address=\
    00:15:65:94:01:7E server=Local
add address=Local178 client-id=1:80:5e:c0:5:84:c9 mac-address=\
    80:5E:C0:05:84:C9 server=Local
add address=Local178 client-id=1:0:15:65:ca:b:f8 mac-address=\
    00:15:65:CA:0B:F8 server=Local
add address=Local178 client-id=1:0:15:65:94:1:e mac-address=00:15:65:94:01:0E \
    server=Local
add address=Local178 client-id=1:80:5e:c0:6:84:2a mac-address=\
    80:5E:C0:06:84:2A server=Local
add address=Local178 client-id=1:0:15:65:f1:9:11 mac-address=\
    00:15:65:F1:09:11 server=Local
add address=Local178 client-id=1:0:15:65:be:ed:45 mac-address=\
    00:15:65:BE:ED:45 server=Local
add address=Local178 client-id=1:80:5e:c0:6:85:68 mac-address=\
    80:5E:C0:06:85:68 server=Local
add address=Local178 client-id=1:80:5e:c0:6:87:1c mac-address=\
    80:5E:C0:06:87:1C server=Local
add address=Local178 client-id=1:0:15:65:94:16:64 mac-address=\
    00:15:65:94:16:64 server=Local
add address=Local178 client-id=1:0:15:65:89:9a:d5 mac-address=\
    00:15:65:89:9A:D5 server=Local
add address=Local178 client-id=1:0:15:65:a0:68:ee mac-address=\
    00:15:65:A0:68:EE server=Local
add address=Local178 client-id=1:0:15:65:ca:a:b mac-address=00:15:65:CA:0A:0B \
    server=Local
add address=Local178 client-id=1:0:15:65:ca:a:ed mac-address=\
    00:15:65:CA:0A:ED server=Local
add address=Local178 client-id=1:80:5e:c0:7:fb:e1 mac-address=\
    80:5E:C0:07:FB:E1 server=Local
add address=192.168.178.240 client-id=1:18:c:ac:dd:94:74 mac-address=\
    18:0C:AC:DD:94:74 server=Local
add address=Local178 mac-address=94:C6:91:19:D9:5D server=Local
add address=Local178 client-id=1:80:5e:c0:6:85:94 mac-address=\
    80:5E:C0:06:85:94 server=Local
add address=Local178 mac-address=C0:3F:D5:6F:B3:43 server=Local
add address=Local178 mac-address=94:C6:91:19:D0:8D server=Local
add address=Local178 mac-address=B8:AE:ED:78:23:A3 server=Local
add address=Local178 client-id=1:0:1f:b5:29:2e:3d mac-address=\
    00:1F:B5:29:2E:3D server=Local
add address=Local178 mac-address=B8:AE:ED:79:6F:F8 server=Local
add address=Local178 mac-address=94:C6:91:1A:46:5D server=Local
add address=Local178 mac-address=94:C6:91:1B:CA:F5 server=Local
add address=Local178 mac-address=94:C6:91:1A:D1:A8 server=Local
add address=Local178 mac-address=B8:AE:ED:78:24:52 server=Local
add address=Local178 mac-address=94:C6:91:A1:73:D8 server=Local
add address=Local178 mac-address=F4:4D:30:64:C3:3F server=Local
add address=Local178 mac-address=B8:AE:ED:EB:EA:82 server=Local
add address=Local178 mac-address=94:C6:91:1A:47:C2 server=Local
add address=Local178 mac-address=F4:4D:30:6D:20:21 server=Local
add address=Local178 mac-address=94:C6:91:1A:D4:27 server=Local
add address=Local178 mac-address=B8:AE:ED:77:BE:AA server=Local
add address=Local178 mac-address=B8:AE:ED:7A:A6:8E server=Local
add address=Local178 mac-address=F4:4D:30:64:C3:C5 server=Local
add address=Local178 client-id=1:54:b2:3:14:f2:da mac-address=\
    54:B2:03:14:F2:DA server=Local
add address=Local178 mac-address=94:C6:91:A1:80:B2 server=Local
add address=Local178 mac-address=94:C6:91:1B:CA:E4 server=Local
add address=Local178 client-id=1:f4:4d:30:67:1b:58 mac-address=\
    F4:4D:30:67:1B:58 server=Local
add address=Local178 mac-address=94:C6:91:1B:CB:D6 server=Local
add address=Local178 mac-address=C0:3F:D5:6F:B2:63 server=Local
add address=Local178 client-id=1:f4:4d:30:67:58:eb mac-address=\
    F4:4D:30:67:58:EB server=Local
add address=Local178 mac-address=F4:4D:30:6D:27:46 server=Local
add address=Local178 mac-address=F4:4D:30:6D:3D:AE server=Local
add address=Local178 mac-address=F4:4D:30:64:C3:45 server=Local
add address=Local178 mac-address=F4:4D:30:6D:30:93 server=Local
add address=Local178 mac-address=B8:AE:ED:EB:E4:20 server=Local
add address=Local178 mac-address=94:C6:91:11:90:B6 server=Local
add address=Local178 mac-address=B8:AE:ED:EB:BB:B2 server=Local
add address=Local178 mac-address=94:C6:91:11:91:28 server=Local
add address=Local178 mac-address=B8:AE:ED:EB:E8:D4 server=Local
add address=Local178 mac-address=B8:AE:ED:77:F2:D5 server=Local
add address=Local178 mac-address=B8:AE:ED:7A:A6:CD server=Local
add address=Local178 mac-address=B8:AE:ED:EB:EA:90 server=Local
add address=Local178 mac-address=94:C6:91:1A:46:BE server=Local
add address=Local178 mac-address=F4:4D:30:6D:30:21 server=Local
add address=Local178 mac-address=B8:AE:ED:7A:A4:F5 server=Local
add address=Local178 mac-address=F4:4D:30:6D:20:68 server=Local
add address=Local178 mac-address=F4:4D:30:6C:E6:AD server=Local
add address=192.168.178.19 mac-address=FC:EC:DA:7B:ED:04 server=Local
add address=Local178 client-id=1:0:1f:b5:29:d3:e4 mac-address=\
    00:1F:B5:29:D3:E4 server=Local
add address=192.168.178.20 mac-address=00:50:56:80:AE:A2 server=Local
add address=192.168.178.101 client-id=1:dc:4a:3e:26:6a:bc mac-address=\
    DC:4A:3E:26:6A:BC server=Local
add address=192.168.178.234 client-id=1:0:17:c8:6a:fe:c3 mac-address=\
    00:17:C8:6A:FE:C3 server=Local
add address=192.168.178.24 client-id=1:4:18:d6:20:fd:87 mac-address=\
    04:18:D6:20:FD:87 server=Local
/ip dhcp-server network
add address=192.168.178.0/24 boot-file-name="boot\\pxeboot.n12" dns-server=\
    192.168.5.8,192.168.4.9 domain=office.opticom.local gateway=192.168.178.1 \
    next-server=192.168.178.6 ntp-server=192.168.4.9
/ip dns
set allow-remote-requests=yes query-server-timeout=10s query-total-timeout=\
    20s servers=8.8.8.8
/ip dns static
add comment="DNS Split >>> FWD" forward-to=192.168.4.9 regexp=\
    ^.*dit|lab|office|office.opticom.local type=FWD
add forward-to=192.168.5.8 regexp=^.*dit|lab|office|office.opticom.local \
    type=FWD
/ip firewall address-list
add address=37.0.29.144/28 comment=DC list=allow-mng-src
add address=109.234.159.72/29 comment=Selectel list=allow-mng-src
add address=178.176.12.104/29 comment="Moscow Megafon" list=allow-mng-src
add address=195.151.167.64/29 comment="Moscow Orange" list=allow-mng-src
add address=85.140.63.236 comment="Samara MTS" list=allow-mng-src
add address=141.0.176.53 comment="Samara Avantel" list=allow-mng-src
add address=89.189.1.176/30 comment="NN Beeline" list=allow-mng-src
add address=95.79.111.166 comment="NN DomRU" list=allow-mng-src
add address=89.249.249.224/27 comment="Nahabino Mosline" list=allow-mng-src
add address=91.210.85.216/29 comment="Nahabino Fortex" list=allow-mng-src
add address=109.167.193.149 comment="Ligovka WestKall" list=allow-mng-src
add address=94.230.162.99 comment="Ligovka Unis" list=allow-mng-src
add address=176.221.9.248/29 comment="SPB Kuz WestCall" list=allow-mng-src
add address=188.43.245.112/29 comment="SPB Kuz TTK" list=allow-mng-src
add address=91.215.90.192/26 comment=Sochi-DagoTel list=allow-mng-src
add address=158.58.132.0/24 comment=Sochi-BiSv list=allow-mng-src
add address=109.167.203.211 comment="IP Socolceva" list=allow-mng-src
add address=77.244.22.224/29 comment="IP Socolceva 2" list=allow-mng-src
add address=95.79.112.147 comment=HPL list=allow-mng-src
add address=185.61.94.233 comment=Vkusno list=allow-mng-src
add address=87.245.175.116 comment=PaperUpack list=allow-mng-src
add address=217.76.40.104/29 comment="PaperUpack Proizvodstvo" list=\
    allow-mng-src
add address=89.22.17.0/24 comment=Ezhivika list=allow-mng-src
add address=136.243.22.158 comment="Fast VPS" list=allow-mng-src
add address=46.36.216.112 comment="Fast VPS" list=allow-mng-src
add address=5.101.196.232 comment=Remzona list=allow-mng-src
add address=90.154.127.194 comment=Uniroll list=allow-mng-src
add address=5.8.79.189 comment=Unipacking list=allow-mng-src
add address=5.189.230.53 comment=Optiform list=allow-mng-src
add address=158.58.132.129 comment="IP Shelistov" list=allow-mng-src
add address=192.168.0.0/16 comment="mange from LAN" list=allow-mng-src
add address=192.168.87.0/24 comment="mange from PY" list=allow-mng-src
add address=185.13.112.239 comment="mange from PY" list=allow-mng-src
add address=95.165.6.179 comment="manage from AM" list=allow-mng-src
/ip firewall filter
add action=accept chain=input comment="accept established,related" \
    connection-state=established,related
add action=drop chain=input comment="drop invalid input" connection-state=\
    invalid
add action=accept chain=input comment="accept allow-mng-src" dst-port=8291,22 \
    protocol=tcp src-address-list=allow-mng-src
add action=drop chain=input comment="drop blacklisted" connection-state=new \
    in-interface-list=wan src-address-list=BlackList
add action=jump chain=input comment="jump quarantine" connection-state=new \
    dst-port=8291,22 in-interface-list=wan jump-target=quarantine protocol=\
    tcp
add action=add-src-to-address-list address-list=BlackList \
    address-list-timeout=1d chain=quarantine comment=blaklisting \
    src-address-list=quarantine-stage-3
add action=add-src-to-address-list address-list=quarantine-stage-3 \
    address-list-timeout=2m chain=quarantine comment=quarantine-stage-3 \
    src-address-list=quarantine-stage-2
add action=add-src-to-address-list address-list=quarantine-stage-2 \
    address-list-timeout=1m chain=quarantine comment=quarantine-stage-2 \
    src-address-list=quarantine-stage-1
add action=add-src-to-address-list address-list=quarantine-stage-1 \
    address-list-timeout=30s chain=quarantine comment=quarantine-stage-1
add action=accept chain=input comment="accept ssh/winbox" dst-port=8291,22 \
    protocol=tcp
add action=accept chain=input comment="accept l2tp" dst-port=1701 protocol=\
    udp
add action=accept chain=input comment="accept GRE" protocol=gre
add action=accept chain=input comment="accept ospf" protocol=ospf
add action=accept chain=input comment="accept ipsec udp" dst-port=500,4500 \
    protocol=udp
add action=accept chain=input comment="accept ipsec-esp" protocol=ipsec-esp
add action=accept chain=input comment="accept ICMP" protocol=icmp
add action=accept chain=input comment="Allow SNMP port 161" dst-port=161 \
    protocol=udp
add action=drop chain=input comment="drop all from NOT !Lan interface list" \
    in-interface-list=!lan
add action=drop chain=forward comment="drop invalid forward" \
    connection-state=invalid
/ip firewall mangle
add action=mark-connection chain=input in-interface=ether1 \
    new-connection-mark=WestKall passthrough=yes
add action=mark-connection chain=input in-interface=ether2 \
    new-connection-mark=Unis passthrough=yes
add action=mark-routing chain=output connection-mark=WestKall \
    new-routing-mark=WestKall passthrough=no
add action=mark-routing chain=output connection-mark=Unis new-routing-mark=\
    Unis passthrough=no
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1 src-address=\
    192.168.178.0/24
add action=masquerade chain=srcnat out-interface=ether1 src-address=\
    172.20.3.0/24
add action=masquerade chain=srcnat out-interface=ether2 src-address=\
    192.168.178.0/24
add action=masquerade chain=srcnat out-interface=ether2 src-address=\
    172.20.3.0/24
/ip firewall service-port
set tftp disabled=yes
set irc disabled=yes
set h323 disabled=yes
set sip disabled=yes
set udplite disabled=yes
set dccp disabled=yes
/ip route
add check-gateway=ping distance=3 gateway=109.167.193.129 routing-mark=\
    WestKall
add check-gateway=ping distance=3 gateway=94.230.162.65 routing-mark=Unis
add check-gateway=ping distance=3 gateway=109.167.193.129
add check-gateway=ping distance=4 gateway=94.230.162.65
add check-gateway=ping distance=1 dst-address=192.168.200.0/24 gateway=\
    to_M9_ATS_Westcall
add check-gateway=ping distance=2 dst-address=192.168.200.0/24 gateway=\
    to_M9_ATS_Unis
/ip service
set telnet address=192.168.4.18/32
set ftp address=10.10.10.0/29
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
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
/ppp secret
add local-address=10.254.0.157 name=DC-Ligovka-WestKall password=\
    DC-Ligovka-WestKall-7556009 profile=default-encryption remote-address=\
    10.254.0.158 service=l2tp
add local-address=10.254.0.153 name=DC-Ligovka-Unis password=\
    DC-Ligovka-Unis-7556009 profile=default-encryption remote-address=\
    10.254.0.154 service=l2tp
add local-address=10.254.0.161 name=M7-Ligovka-Unis password=\
    M7-Ligovka-Unis-7556009 profile=default-encryption remote-address=\
    10.254.0.162 service=l2tp
add local-address=10.254.0.165 name=M7-Ligovka-WestKall password=\
    M7-Ligovka-WestKall-7556009 profile=default-encryption remote-address=\
    10.254.0.166 service=l2tp
add name=mikrotik password=mikrotik profile=VPN-Internet service=l2tp
/routing filter
add action=accept chain=ospf-out prefix=192.168.178.0/24
add action=discard chain=ospf-out
/routing ospf interface
add cost=15 disabled=yes interface=to_M8_Unis network-type=point-to-point
add cost=5 disabled=yes interface=to_M8_WestCall network-type=point-to-point
/routing ospf network
add area=backbone disabled=yes network=10.254.1.24/30
add area=backbone disabled=yes network=10.254.1.28/30
/snmp
set enabled=yes location=SPB trap-community=pavlik
/system clock
set time-zone-autodetect=no time-zone-name=Europe/Moscow
/system identity
set name=Ligovka_MikroTik_Master
/system logging
add disabled=yes topics=l2tp
/system ntp client
set enabled=yes primary-ntp=192.168.4.9 secondary-ntp=212.7.1.132
/system scheduler
add disabled=yes interval=10m name=Reset on-event=\
    Reset_to_def_and_load_config policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=1d1m1s name=BackupConfig on-event=ConfigToBackup policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
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
    \n/system identity set name=Ligovka_MikroTik_Slave\r\
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
    \n/system identity set name=Ligovka_MikroTik_Master\r\
    \n\r\
    \n\r\
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
add dont-require-permissions=no name=Weekly_Backup_Script owner=Chewbacca \
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
/tool netwatch
add down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"Ligovka Unis in ASS\
    \" body=\"Ligovka Unis in ASS at \$TimePlus\";\r\
    \n/tool e-mail send to=\"a.teplyakov@opticom-spb.ru\" subject=\"Ligovka Un\
    is in ASS\" body=\"Ligovka Unis in ASS at \$TimePlus\";\r\
    \n" host=94.230.162.65 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"Ligovka Unis is OK\
    \" body=\"Ligovka Unis is OK at \$TimePlus\";\r\
    \n/tool e-mail send to=\"a.teplyakov@opticom-spb.ru\" subject=\"Ligovka Un\
    is is OK\" body=\"Ligovka Unis is OK at \$TimePlus\";\r\
    \n"
add down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"Ligovka WestKall in\
    \_ASS\" body=\"Ligovka WestKall in ASS at \$TimePlus\";\r\
    \n/tool e-mail send to=\"a.teplyakov@opticom-spb.ru\" subject=\"Ligovka We\
    stKall in ASS\" body=\"Ligovka WestKall in ASS at \$TimePlus\";\r\
    \n" host=109.167.193.129 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"Ligovka WestKall is\
    \_OK\" body=\"Ligovka WestKall is OK at \$TimePlus\";\r\
    \n/tool e-mail send to=\"a.teplyakov@opticom-spb.ru\" subject=\"Ligovka We\
    stKall is OK\" body=\"Ligovka WestKall is OK at \$TimePlus\";"
