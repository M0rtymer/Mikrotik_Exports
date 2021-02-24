# jan/02/1970 04:55:05 by RouterOS 6.48
# software id = MBHJ-C46K
#
# model = RouterBOARD 952Ui-5ac2nD
# serial number = 71AF088AA236
/interface l2tp-server
add name=4.5-Ezevika user=4.5-Ezevika
/interface bridge
add name=bridge-lan
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
set [ find default-name=wlan2 ] ssid=MikroTik
/interface gre
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    89.22.17.149 mtu=1350 name=to_M8 remote-address=37.0.29.153
/interface list
add name=lan
add name=wan
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=pool-lan ranges=192.168.27.30-192.168.27.200
add name=l2tp ranges=172.20.33.2-172.20.33.100
/ip dhcp-server
add address-pool=pool-lan disabled=no interface=bridge-lan name=dhcp-lan
/ppp profile
set *0 local-address=172.20.33.1 remote-address=l2tp
add name=encrypt_profile use-encryption=yes
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=Engineers policy="local,read,test,winbox,web,!telnet,!ssh,!ftp,!reboo\
    t,!write,!policy,!password,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=bridge-lan interface=ether2
add bridge=bridge-lan interface=ether3
add bridge=bridge-lan interface=ether4
add bridge=bridge-lan interface=ether5
/interface l2tp-server server
set default-profile=default enabled=yes ipsec-secret=Opti-VPN use-ipsec=yes
/interface list member
add interface=bridge-lan list=lan
add interface=ether1 list=wan
/ip address
add address=192.168.27.1/24 interface=bridge-lan network=192.168.27.0
add address=89.22.17.149/24 interface=ether1 network=89.22.17.0
add address=10.254.1.78/30 interface=to_M8 network=10.254.1.76
/ip dhcp-client
add interface=ether1
/ip dhcp-server network
add address=192.168.27.0/24 boot-file-name="boot\\pxeboot.n12" dns-server=\
    192.168.4.9,8.8.8.8 gateway=192.168.27.1 netmask=24 next-server=\
    192.168.27.1 ntp-server=192.168.4.9
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
add address=85.140.63.236 comment="Samara MTS" list=allow-mng-src
add address=89.189.1.176/30 comment="NN Beeline" list=allow-mng-src
add address=89.249.249.224/27 comment="Nahabino Mosline" list=allow-mng-src
add address=91.210.85.216/29 comment=Nahabino-Fortex list=allow-mng-src
add address=92.62.112.189 comment=Moscow-M7-Mikrotik-Global list=\
    allow-mng-src
add address=94.230.162.99 comment=Ligovka-Unis list=allow-mng-src
add address=95.79.111.166 comment=NN-Office-DomRU list=allow-mng-src
add address=95.79.112.147 comment=HPL list=allow-mng-src
add address=109.167.203.211 comment="Ligovka_Roznica IP Socolceva" list=\
    allow-mng-src
add address=109.167.193.149 comment=Ligovka-WestKall list=allow-mng-src
add address=141.0.176.53 comment="Samara Avantel" list=allow-mng-src
add address=176.221.9.250 comment=Baltika9 list=allow-mng-src
add address=185.61.94.233 comment=Vkusno list=allow-mng-src
add address=217.76.40.104/29 comment=PaperUpack-Proizvodstvo list=\
    allow-mng-src
add address=46.36.216.112 comment="Fast VPS" list=allow-mng-src
add address=5.101.196.232 comment=Remzona list=allow-mng-src
add address=136.243.22.158 comment="Fast VPS" list=allow-mng-src
add address=90.154.127.194 comment=SunCity list=allow-mng-src
add address=192.168.0.0/16 comment="mange from LAN" list=allow-mng-src
add address=192.168.87.0/24 comment="mange from PY" list=allow-mng-src
add address=109.234.159.240/29 comment=Selectel-ATS list=allow-mng-src
add address=95.165.6.179 comment="manage from AM" list=allow-mng-src
add address=77.244.22.224/29 comment="IP Socolceva 2" list=allow-mng-src
add address=85.140.63.0/24 comment=Sochi3 list=allow-mng-src
add address=87.245.175.116 comment=PaperUpack list=allow-mng-src
add address=89.22.17.0/24 comment=Ezhivika list=allow-mng-src
add address=178.176.12.104/29 comment="Moscow Megafon" list=allow-mng-src
add address=195.151.167.64/29 comment="Moscow Orange" list=allow-mng-src
add address=5.8.79.189 comment=Unipacking list=allow-mng-src
add address=5.189.230.53 comment=Optiform list=allow-mng-src
add address=158.58.132.129 comment="IP Shelistov" list=allow-mng-src
add address=158.58.132.132 comment=Sochi_BiSv list=allow-mng-src
add address=185.13.112.0/24 comment="mange from PY" list=allow-mng-src
/ip firewall filter
add action=accept chain=input comment="accept established,related" \
    connection-state=established,related
add action=drop chain=input comment="drop invalid input" connection-state=\
    invalid
add action=accept chain=input comment="accept allow-mng-src" dst-port=\
    8291,22,23 protocol=tcp src-address-list=allow-mng-src
add action=jump chain=input comment="Check port knock" icmp-options=8:0-255 \
    jump-target=knock packet-size=!0-99 protocol=icmp
add action=accept chain=input comment="ACCEPT TLS after knock" dst-port=443 \
    protocol=tcp src-address-list=KNOCK-SUCCESS
add action=accept chain=input comment="ACCEPT SSH & WBox after knock" \
    dst-port=22,8291 protocol=tcp src-address-list=KNOCK-SUCCESS
add action=drop chain=input comment="drop blacklisted" connection-state=new \
    in-interface-list=wan src-address-list=BlackList
add action=jump chain=input comment="jump quarantine" connection-state=new \
    dst-port=8291,22,23 in-interface-list=wan jump-target=quarantine \
    protocol=tcp
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
add action=accept chain=input comment="accept web proxy from lan" dst-port=\
    8080 protocol=tcp src-address=192.168.0.0/16
add action=accept chain=input comment="accept socks5 proxy from lan" \
    dst-port=1080 protocol=tcp src-address=192.168.0.0/16
add action=accept chain=input comment="accept LAN icmp" protocol=icmp \
    src-address=192.168.0.0/16
add action=accept chain=input comment="accept ipsec udp" dst-port=500,4500 \
    protocol=udp
add action=accept chain=input comment="Accept GRE" protocol=gre
add action=accept chain=input comment="accept l2tp" dst-port=1701 protocol=\
    udp
add action=accept chain=input comment="accept ipsec-esp" protocol=ipsec-esp
add action=accept chain=input comment="accept ospf" protocol=ospf
add action=accept chain=input comment="Allow SNMP port 161" dst-port=161 \
    protocol=udp
add action=accept chain=input comment="accept SNMP" dst-port=161,162 \
    protocol=udp
add action=drop chain=input comment="drop all from NOT !Lan interface list" \
    in-interface-list=!lan
add action=accept chain=forward comment="accept DNS LAN --> WAN" dst-port=53 \
    in-interface-list=lan protocol=udp
add action=drop chain=forward out-interface-list=!wan src-address=\
    192.168.22.143
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
add action=masquerade chain=srcnat out-interface=ether1
add action=dst-nat chain=dstnat disabled=yes dst-port=25,443,465,587,993 \
    in-interface=ether1 protocol=tcp to-addresses=192.168.5.51
add action=dst-nat chain=dstnat dst-port=25,443,993 in-interface=ether1 \
    protocol=tcp to-addresses=192.168.5.51
/ip firewall service-port
set ftp disabled=yes
set tftp disabled=yes
set irc disabled=yes
set h323 disabled=yes
set sip disabled=yes ports=5060,5061,5062
set pptp disabled=yes
set udplite disabled=yes
set dccp disabled=yes
set sctp disabled=yes
/ip route
add distance=1 gateway=89.22.17.148
add distance=1 dst-address=192.168.5.51/32 gateway=4.5-Ezevika
/ip service
set telnet address=192.168.4.18/32 disabled=yes
set ftp disabled=yes
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/ip smb
set enabled=yes
/ip smb shares
set [ find default=yes ] disabled=yes
add directory=/disk1 max-sessions=100 name=pxe
/ip smb users
add name=pxeload password=pXPBWyp51a read-only=no
/ip socks
set auth-method=password enabled=yes version=5
/ip socks users
add name=1CServices password=gorexeq@!38
add name=user1 password=user1
/ip ssh
set allow-none-crypto=yes forwarding-enabled=remote
/ip tftp
add ip-addresses=192.168.27.0/24 real-filename=/disk1/boot/pxeboot.n12 \
    req-filename="boot\\\\pxeboot.n12"
add ip-addresses=192.168.27.0/24 real-filename=/disk1/boot/BCD req-filename=\
    "Boot\\\\BCD"
add ip-addresses=192.168.27.0/24 real-filename=/disk1/boot/bootmgr.exe \
    req-filename="boot\\\\bootmgr.exe"
add ip-addresses=192.168.27.0/24 real-filename=/disk1/boot/boot.sdi \
    req-filename="Boot\\\\boot.sdi"
add ip-addresses=192.168.27.0/24 real-filename=/disk1/boot/boot.sdi \
    req-filename="boot\\\\boot.sdi"
add allow-rollover=yes ip-addresses=192.168.27.0/24 real-filename=\
    /disk1/boot/winpe.wim req-filename="Boot\\\\winpe.wim"
/ppp secret
add name=4.5-Ezevika password="Gznm Pthysitr Fgtkmcbyf 404" service=l2tp
add name=ezhevika password=ezhevika7556009 service=l2tp
/routing ospf network
add area=backbone network=10.254.1.76/30
/system clock
set time-zone-name=Europe/Moscow
/system identity
set name=EzeVika
/system ntp client
set enabled=yes primary-ntp=185.22.60.71
/system scheduler
add interval=1w name=Weekly_Backup_Scheduler on-event=Weekly_Backup_Script \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/03/2019 start-time=12:00:00
/system script
add dont-require-permissions=no name="Current IP" owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    \_get the current IP address from the internet (in case of double-nat)\r\
    \n/tool fetch mode=http address=\"checkip.dyndns.org\" src-path=\"/\" dst-\
    path=\"/dyndns.checkip.html\"\r\
    \n:local result [/file get dyndns.checkip.html contents]\r\
    \n# parse the current IP result\r\
    \n:local resultLen [:len \$result]\r\
    \n:local startLoc [:find \$result \": \" -1]\r\
    \n:set startLoc (\$startLoc + 2)\r\
    \n:local endLoc [:find \$result \"</body>\" -1]\r\
    \n:global currentIP [:pick \$result \$startLoc \$endLoc]\r\
    \n/log warning  \$currentIP"
add dont-require-permissions=no name=Weekly_Backup_Script owner=Moriarty \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=":local MailServer 192.168.4.2;\r\
    \n:local MailUser \"mikrotik\";\r\
    \n:local MailPass \"5e76a8Ts55\";\r\
    \n:local MailSender \"mikrotik@opti-com.ru\";\r\
    \n:local MailTo \"compuage@gmail.com,mikrotik@opti-com.ru\";\r\
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
set address=192.168.4.2 from=mikrotik@opti-com.ru password=5e76a8Ts55 \
    start-tls=yes user=mikrotik
