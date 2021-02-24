# nov/01/2020 13:17:03 by RouterOS 6.47.7
# software id = UTSU-IMSR
#
# model = CCR1009-7G-1C-1S+
# serial number = 914F08FD0FBD
/interface bridge
add name=bridge_lan
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
add disabled=yes name=M7-Samara-Avantel user=M7-Samara-Avantel
add disabled=yes name=M7-Samara-MTS user=M7-Samara-MTS
/interface gre
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    141.0.176.53 mtu=1350 name=to_M8_Avantel remote-address=37.0.29.153
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    85.140.63.236 mtu=1350 name=to_M8_MTS remote-address=37.0.29.153
add allow-fast-path=no ipsec-secret=Opti_SIP-7556009 local-address=\
    141.0.176.53 mtu=1350 name=to_M9_ATS_Avantel remote-address=\
    109.234.159.244
add allow-fast-path=no ipsec-secret=Opti_SIP-7556009 local-address=\
    85.140.63.236 mtu=1350 name=to_M9_ATS_MTS remote-address=109.234.159.244
/interface list
add exclude=all name=wan
add exclude=wan include=all name=LocalLan
add name=lan
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=l2tp ranges=172.20.6.2-172.20.6.100
add name=Local63x ranges=\
    192.168.62.10-192.168.62.254,192.168.63.60-192.168.63.200
/ip dhcp-server
add add-arp=yes address-pool=Local63x disabled=no interface=bridge_lan \
    lease-script=":if (\$leaseBound = 1) do={\r\
    \n\t/ip dhcp-server lease;\r\
    \n\t:foreach i in=[find dynamic=yes] do={\r\
    \n\t\t:local dhcpip  \r\
    \n                                :local delmac \"00:00:00:00:00:00\" \r\
    \n\t\t:set dhcpip [ get \$i address ];\r\
    \n\t\t:local clientmac\r\
    \n\t\t:set clientmac [get \$i mac-address];\r\
    \n\r\
    \n\t                  :if (\$clientmac = \$delmac) do={\r\
    \n\t\t\t:local comment \"DEL\"\r\
    \n\t\t                :set comment ( \$comment . \": \" .  \$dhcpip . \": \
    \" . \$clientmac);\r\
    \n\t\t\t/log error \$comment;\r\
    \n\r\
    \n\r\
    \n                                               :local deladdr [find mac-\
    address=\$delmac]\r\
    \n                                               :local i\r\
    \n                                               :foreach i in \$deladdr d\
    o={ \r\
    \n                                                remove \$i;\r\
    \n                                                }   \r\
    \n\t\t}\r\
    \n\r\
    \n}\r\
    \n}" lease-time=2h name=Local
/ppp profile
add change-tcp-mss=yes local-address=172.20.6.1 name=VPN-Internet \
    remote-address=l2tp use-encryption=yes
add name=encrypt_profile use-encryption=yes
add name=no_encrypt_profile use-encryption=no
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-1 router-id=\
    192.168.63.1
/snmp community
add addresses=192.168.5.106/32 name=pavlik
/system logging action
set 0 memory-lines=10000
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=Engineers policy="local,read,test,winbox,web,!telnet,!ssh,!ftp,!reboo\
    t,!write,!policy,!password,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=bridge_lan interface=sfp-sfpplus1
add bridge=bridge_lan interface=ether3
add bridge=bridge_lan interface=ether4
add bridge=bridge_lan interface=ether5
add bridge=bridge_lan interface=combo1
/ip neighbor discovery-settings
set discover-interface-list=LocalLan
/interface l2tp-server server
set authentication=mschap2 enabled=yes ipsec-secret=Opti-VPN use-ipsec=yes
/interface list member
add interface=ether1 list=wan
add interface=ether2 list=wan
add interface=bridge_lan list=lan
/ip address
add address=85.140.63.236/24 comment=MTS interface=ether1 network=85.140.63.0
add address=141.0.176.53/27 comment=Avantel interface=ether2 network=\
    141.0.176.32
add address=192.168.63.1/23 interface=bridge_lan network=192.168.62.0
add address=10.10.10.1/29 comment=Master interface=ether6 network=10.10.10.0
add address=10.10.10.2/29 comment=Slave disabled=yes interface=ether6 \
    network=10.10.10.0
add address=10.254.2.62/30 interface=to_M9_ATS_Avantel network=10.254.2.60
add address=10.254.2.66/30 interface=to_M9_ATS_MTS network=10.254.2.64
add address=10.254.1.62/30 interface=to_M8_Avantel network=10.254.1.60
add address=10.254.1.66/30 interface=to_M8_MTS network=10.254.1.64
/ip dhcp-client
add disabled=no interface=ether7
/ip dhcp-server alert
add disabled=no interface=bridge_lan
/ip dhcp-server lease
add address=192.168.63.240 mac-address=00:07:4D:6F:F1:EE
add address=Local63x client-id=1:0:15:65:be:ad:6 mac-address=\
    00:15:65:BE:AD:06 server=Local
add address=Local63x client-id=1:80:5e:c0:42:e:57 mac-address=\
    80:5E:C0:42:0E:57 server=Local
add address=Local63x client-id=1:80:5e:c0:42:c:b5 mac-address=\
    80:5E:C0:42:0C:B5 server=Local
add address=Local63x client-id=1:80:5e:c0:42:e:a0 mac-address=\
    80:5E:C0:42:0E:A0 server=Local
add address=Local63x client-id=1:0:15:65:be:ac:c1 mac-address=\
    00:15:65:BE:AC:C1 server=Local
add address=Local63x client-id=1:80:5e:c0:42:c:cb mac-address=\
    80:5E:C0:42:0C:CB server=Local
add address=Local63x client-id=1:80:5e:c0:c:4b:2c mac-address=\
    80:5E:C0:0C:4B:2C server=Local
add address=Local63x client-id=1:80:5e:c0:c:4a:5d mac-address=\
    80:5E:C0:0C:4A:5D server=Local
add address=192.168.63.30 client-id=1:f0:9f:c2:ff:a3:94 mac-address=\
    F0:9F:C2:FF:A3:94 server=Local
add address=Local63x client-id=1:0:15:65:be:ac:7a mac-address=\
    00:15:65:BE:AC:7A server=Local
add address=Local63x client-id=1:80:5e:c0:8:52:4 mac-address=\
    80:5E:C0:08:52:04 server=Local
add address=Local63x client-id=1:80:5e:c0:42:8:81 mac-address=\
    80:5E:C0:42:08:81 server=Local
add address=Local63x client-id=1:80:5e:c0:1a:d4:be mac-address=\
    80:5E:C0:1A:D4:BE server=Local
add address=Local63x client-id=1:80:5e:c0:c:51:17 mac-address=\
    80:5E:C0:0C:51:17 server=Local
add address=Local63x client-id=1:80:5e:c0:42:f:90 mac-address=\
    80:5E:C0:42:0F:90 server=Local
add address=Local63x client-id=1:80:5e:c0:42:e:59 mac-address=\
    80:5E:C0:42:0E:59 server=Local
add address=Local63x client-id=1:0:15:65:ca:a:8e mac-address=\
    00:15:65:CA:0A:8E server=Local
add address=Local63x client-id=1:80:5e:c0:42:e:17 mac-address=\
    80:5E:C0:42:0E:17 server=Local
add address=Local63x client-id=1:80:5e:c0:42:8:83 mac-address=\
    80:5E:C0:42:08:83 server=Local
add address=Local63x client-id=1:0:15:65:be:ac:f4 mac-address=\
    00:15:65:BE:AC:F4 server=Local
add address=Local63x client-id=1:80:5e:c0:12:24:8b mac-address=\
    80:5E:C0:12:24:8B server=Local
add address=Local63x client-id=1:80:5e:c0:42:9:c7 mac-address=\
    80:5E:C0:42:09:C7 server=Local
add address=Local63x client-id=1:80:5e:c0:12:25:13 mac-address=\
    80:5E:C0:12:25:13 server=Local
add address=Local63x client-id=1:80:5e:c0:3b:a2:92 mac-address=\
    80:5E:C0:3B:A2:92 server=Local
add address=Local63x client-id=1:80:5e:c0:c:49:31 mac-address=\
    80:5E:C0:0C:49:31 server=Local
add address=Local63x client-id=1:80:5e:c0:42:f:9c mac-address=\
    80:5E:C0:42:0F:9C server=Local
add address=Local63x client-id=1:80:5e:c0:42:e:a2 mac-address=\
    80:5E:C0:42:0E:A2 server=Local
add address=Local63x client-id=1:80:5e:c0:42:e:40 mac-address=\
    80:5E:C0:42:0E:40 server=Local
add address=Local63x client-id=1:0:15:65:be:ac:f3 mac-address=\
    00:15:65:BE:AC:F3 server=Local
add address=192.168.62.9 client-id=1:0:3:ea:15:e7:c8 mac-address=\
    00:03:EA:15:E7:C8 server=Local
add address=Local63x client-id=1:80:5e:c0:42:e:30 mac-address=\
    80:5E:C0:42:0E:30 server=Local
add address=Local63x client-id=1:80:5e:c0:12:24:96 mac-address=\
    80:5E:C0:12:24:96 server=Local
add address=Local63x client-id=1:80:5e:c0:8:4e:f mac-address=\
    80:5E:C0:08:4E:0F server=Local
add address=Local63x client-id=1:80:5e:c0:d:25:6d mac-address=\
    80:5E:C0:0D:25:6D server=Local
add address=Local63x client-id=1:0:15:65:be:ac:f6 mac-address=\
    00:15:65:BE:AC:F6 server=Local
add address=Local63x client-id=1:80:5e:c0:d:30:a1 mac-address=\
    80:5E:C0:0D:30:A1 server=Local
add address=Local63x client-id=1:80:5e:c0:42:f:79 mac-address=\
    80:5E:C0:42:0F:79 server=Local
add address=Local63x client-id=1:80:5e:c0:42:8:82 mac-address=\
    80:5E:C0:42:08:82 server=Local
add address=Local63x client-id=1:80:5e:c0:42:e:9d mac-address=\
    80:5E:C0:42:0E:9D server=Local
add address=Local63x client-id=1:80:5e:c0:42:8:59 mac-address=\
    80:5E:C0:42:08:59 server=Local
add address=Local63x client-id=1:80:5e:c0:3b:a1:55 mac-address=\
    80:5E:C0:3B:A1:55 server=Local
add address=Local63x client-id=1:80:5e:c0:c:4b:34 mac-address=\
    80:5E:C0:0C:4B:34 server=Local
add address=Local63x client-id=1:80:5e:c0:42:8:7d mac-address=\
    80:5E:C0:42:08:7D server=Local
add address=Local63x client-id=1:80:5e:c0:42:8:65 mac-address=\
    80:5E:C0:42:08:65 server=Local
add address=Local63x client-id=1:80:5e:c0:3e:52:71 mac-address=\
    80:5E:C0:3E:52:71 server=Local
add address=Local63x client-id=1:80:5e:c0:42:8:5a mac-address=\
    80:5E:C0:42:08:5A server=Local
add address=Local63x client-id=1:80:5e:c0:3e:53:9b mac-address=\
    80:5E:C0:3E:53:9B server=Local
add address=Local63x client-id=1:80:5e:c0:42:f:7b mac-address=\
    80:5E:C0:42:0F:7B server=Local
add address=Local63x client-id=1:80:5e:c0:c:4c:8e mac-address=\
    80:5E:C0:0C:4C:8E server=Local
add address=Local63x client-id=1:80:5e:c0:42:e:3f mac-address=\
    80:5E:C0:42:0E:3F server=Local
add address=Local63x client-id=1:80:5e:c0:12:22:b9 mac-address=\
    80:5E:C0:12:22:B9 server=Local
add address=Local63x client-id=1:80:5e:c0:13:9a:a9 mac-address=\
    80:5E:C0:13:9A:A9 server=Local
add address=Local63x client-id=1:0:15:65:be:ac:e1 mac-address=\
    00:15:65:BE:AC:E1 server=Local
add address=192.168.63.21 client-id=1:78:8a:20:fb:e6:6 mac-address=\
    78:8A:20:FB:E6:06 server=Local
add address=192.168.62.83 client-id=1:80:5e:c0:2c:3b:c1 mac-address=\
    80:5E:C0:2C:3B:C1 server=Local
add address=192.168.63.27 client-id=1:80:2a:a8:a0:5c:af mac-address=\
    80:2A:A8:A0:5C:AF server=Local
add address=Local63x client-id=1:0:15:65:be:ed:9d mac-address=\
    00:15:65:BE:ED:9D server=Local
add address=Local63x client-id=1:0:15:65:f8:39:38 mac-address=\
    00:15:65:F8:39:38 server=Local
add address=192.168.63.26 client-id=1:80:2a:a8:ac:cb:f7 mac-address=\
    80:2A:A8:AC:CB:F7 server=Local
add address=192.168.63.25 client-id=1:80:2a:a8:a0:29:33 mac-address=\
    80:2A:A8:A0:29:33 server=Local
add address=192.168.63.24 client-id=1:80:2a:a8:a0:26:a8 mac-address=\
    80:2A:A8:A0:26:A8 server=Local
add address=Local63x client-id=1:0:15:65:be:f2:19 mac-address=\
    00:15:65:BE:F2:19 server=Local
add address=Local63x client-id=1:0:15:65:be:e7:20 mac-address=\
    00:15:65:BE:E7:20 server=Local
add address=192.168.62.71 client-id=1:80:5e:c0:2c:3c:2f mac-address=\
    80:5E:C0:2C:3C:2F server=Local
add address=Local63x client-id=1:0:15:65:ca:a:91 mac-address=\
    00:15:65:CA:0A:91 server=Local
add address=Local63x client-id=1:0:15:65:be:ed:64 mac-address=\
    00:15:65:BE:ED:64 server=Local
add address=Local63x client-id=1:80:5e:c0:11:1d:5b mac-address=\
    80:5E:C0:11:1D:5B server=Local
add address=Local63x client-id=1:0:15:65:ca:c:61 mac-address=\
    00:15:65:CA:0C:61 server=Local
add address=192.168.63.29 client-id=1:80:2a:a8:ac:cc:27 mac-address=\
    80:2A:A8:AC:CC:27 server=Local
add address=192.168.63.28 client-id=1:80:2a:a8:ac:cc:52 mac-address=\
    80:2A:A8:AC:CC:52 server=Local
add address=Local63x client-id=1:0:15:65:be:f3:4e mac-address=\
    00:15:65:BE:F3:4E server=Local
add address=192.168.63.22 client-id=1:78:8a:20:fb:e6:75 mac-address=\
    78:8A:20:FB:E6:75 server=Local
add address=Local63x client-id=1:0:15:65:be:f1:75 mac-address=\
    00:15:65:BE:F1:75 server=Local
add address=Local63x client-id=1:0:15:65:ca:a:9c mac-address=\
    00:15:65:CA:0A:9C server=Local
add address=192.168.63.23 client-id=1:80:2a:a8:a0:26:93 mac-address=\
    80:2A:A8:A0:26:93 server=Local
add address=Local63x client-id=1:80:5e:c0:1d:9f:b0 mac-address=\
    80:5E:C0:1D:9F:B0 server=Local
add address=Local63x client-id=1:0:15:65:be:ed:92 mac-address=\
    00:15:65:BE:ED:92 server=Local
add address=Local63x client-id=1:0:15:65:be:e7:a mac-address=\
    00:15:65:BE:E7:0A server=Local
add address=Local63x client-id=1:80:5e:c0:1d:a5:f5 mac-address=\
    80:5E:C0:1D:A5:F5 server=Local
add address=Local63x client-id=1:80:5e:c0:1c:e1:95 mac-address=\
    80:5E:C0:1C:E1:95 server=Local
add address=Local63x client-id=1:80:5e:c0:1d:a4:fd mac-address=\
    80:5E:C0:1D:A4:FD server=Local
add address=Local63x client-id=1:80:5e:c0:13:a3:c7 mac-address=\
    80:5E:C0:13:A3:C7 server=Local
add address=Local63x client-id=1:80:5e:c0:1d:a5:68 mac-address=\
    80:5E:C0:1D:A5:68 server=Local
add address=Local63x client-id=1:0:15:65:be:f1:90 mac-address=\
    00:15:65:BE:F1:90 server=Local
add address=Local63x client-id=1:80:5e:c0:13:9a:a0 mac-address=\
    80:5E:C0:13:9A:A0 server=Local
add address=Local63x client-id=1:80:5e:c0:10:5:20 mac-address=\
    80:5E:C0:10:05:20 server=Local
add address=Local63x client-id=1:80:5e:c0:13:9c:3d mac-address=\
    80:5E:C0:13:9C:3D server=Local
add address=Local63x client-id=1:80:5e:c0:c:4b:a mac-address=\
    80:5E:C0:0C:4B:0A server=Local
add address=Local63x client-id=1:80:5e:c0:42:f:7f mac-address=\
    80:5E:C0:42:0F:7F server=Local
add address=Local63x client-id=1:74:4d:28:43:13:7f mac-address=\
    74:4D:28:43:13:7F server=Local
add address=Local63x client-id=1:80:5e:c0:18:4:fc mac-address=\
    80:5E:C0:18:04:FC server=Local
add address=Local63x client-id=1:0:15:65:be:ac:bd mac-address=\
    00:15:65:BE:AC:BD server=Local
add address=Local63x client-id=1:80:5e:c0:42:c:aa mac-address=\
    80:5E:C0:42:0C:AA server=Local
add address=Local63x client-id=1:80:5e:c0:d:30:ea mac-address=\
    80:5E:C0:0D:30:EA server=Local
add address=Local63x client-id=1:80:5e:c0:11:1c:be mac-address=\
    80:5E:C0:11:1C:BE server=Local
add address=192.168.63.20 client-id=\
    ff:56:81:dd:c1:0:1:0:1:24:e5:76:a5:0:50:56:81:dd:c1 mac-address=\
    00:50:56:81:DD:C1 server=Local
add address=Local63x client-id=1:80:5e:c0:3e:94:ac mac-address=\
    80:5E:C0:3E:94:AC server=Local
add address=Local63x client-id=1:80:5e:c0:3c:86:6a mac-address=\
    80:5E:C0:3C:86:6A server=Local
add address=Local63x client-id=1:80:5e:c0:3c:86:73 mac-address=\
    80:5E:C0:3C:86:73 server=Local
add address=Local63x client-id=1:80:5e:c0:3b:ae:91 mac-address=\
    80:5E:C0:3B:AE:91 server=Local
add address=Local63x client-id=1:80:5e:c0:42:8:50 mac-address=\
    80:5E:C0:42:08:50 server=Local
add address=Local63x client-id=1:80:5e:c0:3b:a0:48 mac-address=\
    80:5E:C0:3B:A0:48 server=Local
add address=Local63x client-id=1:0:15:65:be:ac:96 mac-address=\
    00:15:65:BE:AC:96 server=Local
add address=Local63x client-id=1:0:15:65:be:ac:a5 mac-address=\
    00:15:65:BE:AC:A5 server=Local
add address=Local63x client-id=1:0:15:65:ca:c:5b mac-address=\
    00:15:65:CA:0C:5B server=Local
add address=Local63x client-id=1:0:15:65:be:f1:c1 mac-address=\
    00:15:65:BE:F1:C1 server=Local
add address=Local63x mac-address=F4:4D:30:64:D8:77 server=Local
add address=Local63x mac-address=F4:4D:30:69:03:C9 server=Local
add address=Local63x mac-address=F4:4D:30:6D:35:D1 server=Local
add address=Local63x mac-address=F4:4D:30:6D:17:27 server=Local
add address=Local63x mac-address=F4:4D:30:6D:3E:D4 server=Local
add address=Local63x mac-address=94:C6:91:14:B5:59 server=Local
add address=Local63x mac-address=94:C6:91:A0:DD:71 server=Local
add address=Local63x mac-address=F4:4D:30:6D:17:33 server=Local
add address=Local63x mac-address=F4:4D:30:6D:28:6E server=Local
add address=Local63x mac-address=94:C6:91:1D:B9:BB server=Local
add address=Local63x mac-address=F4:4D:30:6D:28:7C server=Local
add address=Local63x mac-address=94:C6:91:A1:2C:37 server=Local
add address=Local63x mac-address=94:C6:91:A6:4E:D6 server=Local
add address=Local63x mac-address=F4:4D:30:65:F5:83 server=Local
add address=Local63x mac-address=94:C6:91:1E:A5:9D server=Local
add address=Local63x mac-address=94:C6:91:10:A1:2A server=Local
add address=Local63x mac-address=94:C6:91:AB:D5:49 server=Local
add address=Local63x mac-address=94:C6:91:AB:DA:EC server=Local
add address=Local63x mac-address=F4:4D:30:6D:2B:FD server=Local
add address=Local63x mac-address=94:C6:91:A5:43:6F server=Local
add address=Local63x mac-address=94:C6:91:19:0E:C1 server=Local
add address=Local63x mac-address=94:C6:91:A6:4A:6F server=Local
add address=Local63x mac-address=94:C6:91:A6:56:E6 server=Local
add address=Local63x mac-address=F4:4D:30:6C:87:AC server=Local
add address=Local63x mac-address=94:C6:91:A1:2E:61 server=Local
add address=Local63x mac-address=94:C6:91:A8:36:9D server=Local
add address=Local63x mac-address=F4:4D:30:6D:17:15 server=Local
add address=Local63x mac-address=94:C6:91:A1:2D:73 server=Local
add address=Local63x mac-address=F4:4D:30:6D:2F:72 server=Local
add address=Local63x mac-address=94:C6:91:A6:45:27 server=Local
add address=Local63x mac-address=94:C6:91:1F:49:22 server=Local
add address=Local63x mac-address=94:C6:91:1F:4C:CF server=Local
add address=Local63x mac-address=94:C6:91:A6:48:55 server=Local
add address=Local63x mac-address=94:C6:91:A1:2E:F4 server=Local
add address=Local63x mac-address=94:C6:91:A6:47:A8 server=Local
add address=Local63x mac-address=94:C6:91:AB:DA:CE server=Local
add address=Local63x mac-address=94:C6:91:A6:53:D3 server=Local
add address=Local63x mac-address=94:C6:91:1F:D6:8E server=Local
add address=Local63x mac-address=94:C6:91:A6:53:45 server=Local
add address=Local63x mac-address=94:C6:91:A6:4F:E2 server=Local
add address=Local63x mac-address=94:C6:91:A6:43:81 server=Local
add address=Local63x mac-address=94:C6:91:10:73:3C server=Local
add address=Local63x mac-address=94:C6:91:A8:31:D9 server=Local
add address=Local63x mac-address=94:C6:91:A6:54:16 server=Local
add address=Local63x mac-address=94:C6:91:18:C8:0D server=Local
add address=Local63x mac-address=F4:4D:30:69:00:74 server=Local
add address=Local63x mac-address=94:C6:91:A6:5B:FC server=Local
add address=Local63x mac-address=F4:4D:30:6C:E6:65 server=Local
add address=Local63x mac-address=94:C6:91:A8:32:4F server=Local
add address=Local63x mac-address=94:C6:91:A1:2E:AD server=Local
add address=Local63x mac-address=94:C6:91:1D:C0:69 server=Local
add address=Local63x mac-address=94:C6:91:10:7D:13 server=Local
add address=Local63x mac-address=F4:4D:30:65:1D:7F server=Local
add address=Local63x mac-address=94:C6:91:11:9F:74 server=Local
add address=Local63x mac-address=94:C6:91:A6:47:F2 server=Local
add address=Local63x mac-address=94:C6:91:A0:DD:A9 server=Local
add address=Local63x client-id=1:94:c6:91:a6:4e:7c mac-address=\
    94:C6:91:A6:4E:7C server=Local
add address=Local63x client-id=1:94:c6:91:a8:74:c5 mac-address=\
    94:C6:91:A8:74:C5 server=Local
add address=Local63x client-id=1:80:5e:c0:3b:9f:bc mac-address=\
    80:5E:C0:3B:9F:BC server=Local
add address=192.168.63.43 client-id=1:0:50:56:80:9b:1c mac-address=\
    00:50:56:80:9B:1C server=Local
add address=Local63x client-id=1:80:5e:c0:1c:d7:e7 mac-address=\
    80:5E:C0:1C:D7:E7 server=Local
add address=Local63x client-id=1:0:15:65:be:e4:ff mac-address=\
    00:15:65:BE:E4:FF server=Local
add address=Local63x mac-address=F4:4D:30:69:D9:1F server=Local
add address=Local63x mac-address=00:50:56:80:49:13 server=Local
add address=Local63x client-id=1:0:15:65:be:ed:8f mac-address=\
    00:15:65:BE:ED:8F server=Local
add address=192.168.63.239 client-id=1:40:b0:34:a1:b8:18 mac-address=\
    40:B0:34:A1:B8:18 server=Local
/ip dhcp-server network
add address=192.168.62.0/23 boot-file-name="boot\\pxeboot.n12" dns-server=\
    192.168.4.9,192.168.5.8 domain=office.opticom.local gateway=192.168.63.1 \
    next-server=192.168.63.43
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
add address=77.244.30.254 comment="SPB Samsa WestKall" list=allow-mng-src
add address=77.244.30.26 comment="SPB Samsa WestKall" list=allow-mng-src
add address=77.244.30.27 comment="SPB Samsa WestKall" list=allow-mng-src
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
    new-connection-mark=MTS passthrough=yes
add action=mark-connection chain=input in-interface=ether2 \
    new-connection-mark=Avantel passthrough=yes
add action=mark-routing chain=output connection-mark=MTS new-routing-mark=MTS \
    passthrough=yes
add action=mark-routing chain=output connection-mark=Avantel \
    new-routing-mark=Avantel passthrough=yes
/ip firewall nat
add action=masquerade chain=srcnat out-interface-list=wan src-address=\
    192.168.62.0/23
/ip firewall service-port
set irc disabled=yes
set h323 disabled=yes
set udplite disabled=yes
/ip route
add check-gateway=ping distance=3 gateway=85.140.63.254 routing-mark=MTS
add check-gateway=ping distance=3 gateway=141.0.176.33 routing-mark=Avantel
add check-gateway=ping distance=3 gateway=85.140.63.254
add check-gateway=ping distance=4 gateway=141.0.176.33
add distance=1 dst-address=192.168.200.0/24 gateway=to_M9_ATS_Avantel
add distance=2 dst-address=192.168.200.0/24 gateway=to_M9_ATS_MTS
/ip service
set telnet address=192.168.4.18/32 disabled=yes
set ftp disabled=yes
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/ip ssh
set forwarding-enabled=remote
/lcd
set backlight-timeout=never default-screen=informative-slideshow \
    read-only-mode=yes touch-screen=disabled
/lcd screen
set 0 disabled=yes
set 1 disabled=yes
set 2 disabled=yes
set 3 disabled=yes
set 5 disabled=yes
/ppp secret
add local-address=10.254.0.169 name=DC-Samara-Avantel password=\
    DC-Samara-Avantel-7556009 profile=default-encryption remote-address=\
    10.254.0.170 service=l2tp
add local-address=10.254.0.173 name=DC-Samara-MTS password=\
    DC-Samara-MTS-7556009 profile=default-encryption remote-address=\
    10.254.0.174 service=l2tp
add local-address=10.254.0.177 name=M7-Samara-MTS password=\
    M7-Samara-MTS-7556009 profile=default-encryption remote-address=\
    10.254.0.178 service=l2tp
add local-address=10.254.0.181 name=M7-Samara-Avantel password=\
    M7-Samara-Avantel-7556009 profile=default-encryption remote-address=\
    10.254.0.182 service=l2tp
add name=mikrotik password=mikrotik profile=VPN-Internet service=l2tp
add local-address=10.254.1.61 name=to_M8_Avantel password=toM8909189 profile=\
    encrypt_profile remote-address=10.254.1.62 service=l2tp
/routing filter
add action=accept chain=ospf-out prefix=192.168.62.0/23
add action=discard chain=ospf-out
/routing ospf interface
add cost=5 network-type=point-to-point
add cost=11 network-type=point-to-point
add cost=15 interface=to_M8_Avantel network-type=point-to-point
add cost=5 interface=to_M8_MTS network-type=point-to-point
/routing ospf network
add area=backbone network=10.0.10.0/24
add area=backbone network=10.254.1.60/30
add area=backbone network=10.254.1.64/30
/snmp
set enabled=yes location=Samara trap-community=pavlik trap-interfaces=\
    bridge_lan trap-version=3
/system clock
set time-zone-name=Europe/Samara
/system identity
set name=Samara_MikroTik_Master
/system logging
set 3 action=disk
/system ntp client
set enabled=yes primary-ntp=94.247.111.10 secondary-ntp=192.168.4.9
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
    \n/system identity set name=Samara_MikroTik_Slave\r\
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
    \n/system identity set name=Samara_MikroTik_Master\r\
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
/tool mac-server mac-winbox
set allowed-interface-list=LocalLan
/tool netwatch
add down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"Samara Avantel in A\
    SS\" body=\"Samara Avantel in ASS at \$TimePlus\";\r\
    \n/tool e-mail send to=\"v.ivkin@opti-com.ru\" subject=\"Samara Avantel in\
    \_ASS\" body=\"Samara Avantel in ASS at \$TimePlus\";\r\
    \n" host=141.0.176.33 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"Samara Avantel is O\
    K\" body=\"Samara Avantel is OK at \$TimePlus\";\r\
    \n/tool e-mail send to=\"v.ivkin@opti-com.ru\" subject=\"Samara Avantel is\
    \_OK\" body=\"Samara Avantel is OK at \$TimePlus\";"
add down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"Samara MTS in ASS\"\
    \_body=\"Samara MTS in ASS at \$TimePlus\";\r\
    \n/tool e-mail send to=\"v.ivkin@opti-com.ru\" subject=\"Samara MTS in ASS\
    \" body=\"Samara MTS in ASS at \$TimePlus\";" host=85.140.63.254 \
    up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"Samara MTS is OK\" \
    body=\"Samara MTS is OK at \$TimePlus\";\r\
    \n/tool e-mail send to=\"v.ivkin@opti-com.ru\" subject=\"Samara MTS is OK\
    \" body=\"Samara MTS is OK at \$TimePlus\";"
