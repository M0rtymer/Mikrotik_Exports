# nov/18/2020 20:35:57 by RouterOS 6.47.7
# software id = ZRSA-JAH0
#
# model = RBD53GR-5HacD2HnD
# serial number = D5F80CA1EFD8
/interface bridge
add name=bridge_lan
/interface ethernet
set [ find default-name=ether1 ] comment=WAN
set [ find default-name=ether2 ] comment=LAN
set [ find default-name=ether5 ] comment=to_Morty
/interface lte
set [ find ] comment=WAN name=lte1 network-mode=3g,lte
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
set [ find default-name=wlan2 ] ssid=MikroTik
/interface vlan
add disabled=yes interface=bridge_lan mtu=1350 name=10_NUC vlan-id=10
add disabled=yes interface=bridge_lan mtu=1350 name=20_VoIP vlan-id=20
add disabled=yes interface=bridge_lan name=30_RogueLike vlan-id=30
add disabled=yes interface=bridge_lan name=100_Green vlan-id=1
add interface=bridge_lan name=101_Guest vlan-id=101
/interface list
add name=lan
add name=wan
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot
/ip pool
add name=pool_lan ranges=192.168.208.10-192.168.208.250
add name=pool_10 ranges=192.168.208.10-192.168.208.120
add name=pool_20 ranges=192.168.208.129-192.168.208.250
add name=pool_guest ranges=192.168.101.10-192.168.101.250
add name=pool_rogue ranges=192.168.209.130-192.168.209.250
add name=pool_green ranges=192.168.209.10-192.168.209.120
/ip dhcp-server
add address-pool=pool_10 interface=10_NUC lease-time=4h name=dhcp_10
add address-pool=pool_20 interface=20_VoIP lease-time=4h name=dhcp_20
add address-pool=pool_rogue interface=30_RogueLike lease-time=30m name=\
    dhcp_30
add address-pool=pool_green interface=100_Green lease-time=4h name=dhcp_100
add address-pool=pool_guest disabled=no interface=101_Guest name=dhcp_101
add address-pool=pool_lan disabled=no interface=bridge_lan lease-time=4h \
    name=dhcp_local
/interface l2tp-client
add allow=mschap2 connect-to=37.0.29.153 disabled=no ipsec-secret=Opti-VPN \
    max-mru=1350 max-mtu=1350 name=to_M8_LTE password=Opti7556009 profile=\
    default use-ipsec=yes user=NBN_Padik
add allow=mschap2 connect-to=109.234.159.244 disabled=no ipsec-secret=\
    Opti-VPN max-mru=1350 max-mtu=1350 name=to_M9_LTE password=Opti7556009 \
    profile=default use-ipsec=yes user=NBN_Padik
/routing ospf instance
set [ find default=yes ] router-id=192.168.208.1
/system logging action
add name=modem target=memory
/user group
add name=Engineers policy="local,read,test,winbox,web,!telnet,!ssh,!ftp,!reboo\
    t,!write,!policy,!password,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=bridge_lan interface=ether2
add bridge=bridge_lan interface=ether3
add bridge=bridge_lan interface=ether4
add bridge=bridge_lan interface=ether5
/interface bridge vlan
add bridge=bridge_lan disabled=yes tagged=bridge_lan,ether2 vlan-ids=10
add bridge=bridge_lan disabled=yes tagged=bridge_lan,ether2 vlan-ids=20
add bridge=bridge_lan disabled=yes tagged=bridge_lan,ether2 vlan-ids=30
add bridge=bridge_lan disabled=yes tagged=bridge_lan,ether2 vlan-ids=101
add bridge=bridge_lan disabled=yes tagged=bridge_lan,ether2 vlan-ids=100
/interface list member
add interface=ether1 list=wan
add interface=lte1 list=wan
/ip address
add address=192.168.101.1/24 interface=101_Guest network=192.168.101.0
add address=192.168.209.129/25 disabled=yes interface=30_RogueLike network=\
    192.168.209.128
add address=192.168.208.1/25 disabled=yes interface=10_NUC network=\
    192.168.208.0
add address=192.168.208.129/25 disabled=yes interface=20_VoIP network=\
    192.168.208.128
add address=192.168.209.1/25 disabled=yes interface=100_Green network=\
    192.168.209.0
add address=192.168.208.1/24 interface=bridge_lan network=192.168.208.0
add address=10.254.1.170/30 disabled=yes interface=wlan1 network=10.254.1.168
add address=10.254.2.170/30 disabled=yes interface=wlan1 network=10.254.2.168
/ip dhcp-server network
add address=192.168.101.0/24 dns-server=192.168.101.1 gateway=192.168.101.1
add address=192.168.208.0/24 boot-file-name="boot\\pxeboot.n12" dns-server=\
    192.168.4.9,192.168.5.8 domain=office.opticom.local gateway=192.168.208.1 \
    next-server=192.168.208.1 ntp-server=192.168.4.9
/ip dns
set servers=8.8.8.8
/ip dns static
add comment="DNS Split >>> FWD" forward-to=192.168.4.9 regexp=\
    ^.*dit|lab|office|office.opticom.local type=FWD
add forward-to=192.168.5.8 regexp=^.*dit|lab|office|office.opticom.local \
    type=FWD
/ip firewall address-list
add address=37.0.29.144/28 comment=DC list=allow-mng-src
add address=109.234.159.72/29 comment=Selectel list=allow-mng-src
add address=109.234.159.240/29 comment=Selectel-ATS list=allow-mng-src
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
add action=jump chain=input comment="Check port knock" icmp-options=8:0-255 \
    jump-target=knock packet-size=!0-99 protocol=icmp
add action=accept chain=input comment="ACCEPT TLS after knock" dst-port=443 \
    protocol=tcp src-address-list=KNOCK-SUCCESS
add action=accept chain=input comment="ACCEPT SSH & WBox after knock" \
    dst-port=22,8291 protocol=tcp src-address-list=KNOCK-SUCCESS
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
add action=return chain=knock comment="KNOCK FAILURE return" \
    src-address-list=KNOCK-FAILURE
add action=add-src-to-address-list address-list=KNOCK-SUCCESS \
    address-list-timeout=1h chain=knock comment="KNOCK 3rd - success 600" \
    packet-size=628 src-address-list=knock2
add action=return chain=knock comment="KNOCK 3rd - success return" \
    src-address-list=KNOCK-SUCCESS
add action=add-src-to-address-list address-list=KNOCK-FAILURE \
    address-list-timeout=1m chain=knock comment="KNOCK 3rd - failure" \
    src-address-list=knock2
add action=return chain=knock comment="KNOCK 3rd - failure return" \
    src-address-list=KNOCK-FAILURE
add action=add-src-to-address-list address-list=knock2 address-list-timeout=\
    1m chain=knock comment="KNOCK 2nd - success 500" packet-size=528 \
    src-address-list=knock1
add action=return chain=knock comment="KNOCK 2nd - success return" \
    src-address-list=knock2
add action=add-src-to-address-list address-list=KNOCK-FAILURE \
    address-list-timeout=1m chain=knock comment="KNOCK 2nd - failure" \
    src-address-list=knock1
add action=return chain=knock comment="KNOCK 2nd - failure return" \
    src-address-list=KNOCK-FAILURE
add action=add-src-to-address-list address-list=knock1 address-list-timeout=\
    1m chain=knock comment="KNOCK 1st - success 174" packet-size=202
add action=return chain=knock comment="KNOCK 1st - success return" \
    src-address-list=knock1
add action=add-src-to-address-list address-list=KNOCK-FAILURE \
    address-list-timeout=1m chain=knock comment="KNOCK 1st - failure"
/ip firewall nat
add action=masquerade chain=srcnat out-interface-list=wan
/ip route
add disabled=yes distance=1 dst-address=192.168.20.10/32 gateway=*11
add distance=1 dst-address=192.168.200.0/24 gateway=to_M9_LTE
/ip smb
set domain=office.opticom.local enabled=yes
/ip smb shares
set [ find default=yes ] disabled=yes
add directory=/disk1 max-sessions=100 name=pxe
/ip smb users
add name=pxeload password=pXPBWyp51a read-only=no
/ip tftp
add ip-addresses=192.168.208.0/24 real-filename=/disk1/boot/pxeboot.n12 \
    req-filename="boot\\\\pxeboot.n12"
add ip-addresses=192.168.208.0/24 real-filename=/disk1/boot/BCD req-filename=\
    "Boot\\\\BCD"
add ip-addresses=192.168.208.0/24 real-filename=/disk1/boot/bootmgr.exe \
    req-filename="boot\\\\bootmgr.exe"
add ip-addresses=192.168.208.0/24 real-filename=/disk1/boot/boot.sdi \
    req-filename="Boot\\\\boot.sdi"
add ip-addresses=192.168.208.0/24 real-filename=/disk1/boot/boot.sdi \
    req-filename="boot\\\\boot.sdi"
add allow-rollover=yes ip-addresses=192.168.208.0/24 real-filename=\
    /disk1/boot/winpe.wim req-filename="Boot\\\\winpe.wim"
/routing ospf interface
add cost=15 interface=to_M8_LTE network-type=point-to-point
/routing ospf network
add area=backbone network=10.254.1.172/30
add area=backbone network=192.168.208.0/23
add area=backbone network=10.254.1.168/30
/system clock
set time-zone-name=Europe/Moscow
/system identity
set name=NBN_Padik
/system logging
add action=modem prefix=r11_lte topics=lte
add action=modem prefix=r11_gsm topics=gsm
/system scheduler
add interval=1w name=Weekly_Backup_Scheduler on-event=Weekly_Backup_Script \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/03/2019 start-time=12:00:00
/system script
add dont-require-permissions=no name=Weekly_Backup_Script owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local MailServer [:resolve \"smtp.gmail.com\"];\r\
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
