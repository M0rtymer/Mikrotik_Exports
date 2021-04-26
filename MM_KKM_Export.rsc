# apr/26/2021 11:25:08 by RouterOS 6.46.1
# software id = GRTV-4CIM
#
# model = RouterBOARD 941-2nD
# serial number = 5B3204657242
/interface l2tp-client
add allow=mschap2 connect-to=89.22.17.21 disabled=no max-mru=1400 max-mtu=\
    1400 name=KKM_Mobile_Motor password=KKM_Mobile_Motor_7556009 user=\
    KKM_Mobile_Motor
add allow=mschap2 connect-to=109.234.159.76 disabled=no max-mru=1400 max-mtu=\
    1400 name=Selectell password=KKM_Mobile_Motor_7556009 user=\
    KKM_Mobile_Motor
/interface bridge
add name=Local
/interface wireless
set [ find default-name=wlan1 ] antenna-gain=0 country=no_country_set \
    frequency-mode=manual-txpower ssid=MikroTik
/interface list
add name=Internet
add name=NoDiscovery
add exclude=NoDiscovery name=Discovery
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.254.250-192.168.254.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=Local lease-time=1d name=\
    dhcp1
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-1 router-id=\
    192.168.254.249
/user group
add name=Engineers policy="local,read,test,winbox,web,!telnet,!ssh,!ftp,!reboo\
    t,!write,!policy,!password,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=Local interface=ether3
add bridge=Local interface=ether2
add bridge=Local interface=ether4
/ip neighbor discovery-settings
set discover-interface-list=Discovery
/interface list member
add interface=ether1 list=Internet
add interface=ether1 list=NoDiscovery
add interface=ether2 list=NoDiscovery
add interface=Local list=NoDiscovery
/ip address
add address=192.168.254.249/29 interface=Local network=192.168.254.248
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server lease
add address=192.168.254.253 mac-address=8C:1C:DA:82:45:12 server=dhcp1
/ip dhcp-server network
add address=192.168.254.248/29 dns-server=8.8.8.8 gateway=192.168.254.249
/ip dns
set servers=8.8.8.8
/ip firewall address-list
add address=37.0.29.144/28 list="All My IP"
add address=109.234.159.72/29 list="All My IP"
add address=85.140.63.236 list="All My IP"
add address=89.189.1.178 list="All My IP"
add address=89.249.249.234 list="All My IP"
add address=91.210.85.221 list="All My IP"
add address=92.62.112.189 list="All My IP"
add address=94.230.162.99 list="All My IP"
add address=95.79.111.166 list="All My IP"
add address=95.79.112.147 list="All My IP"
add address=109.167.203.211 list="All My IP"
add address=109.167.193.149 list="All My IP"
add address=141.0.176.53 list="All My IP"
add address=176.221.9.250 list="All My IP"
add address=178.176.12.105 list="All My IP"
add address=185.61.94.233 list="All My IP"
add address=195.151.167.65 list="All My IP"
add address=217.76.40.104/29 list="All My IP"
add address=0.0.0.0/8 list=BOGONS
add address=10.0.0.0/8 list=BOGONS
add address=100.64.0.0/10 list=BOGONS
add address=127.0.0.0/8 list=BOGONS
add address=169.254.0.0/16 list=BOGONS
add address=172.16.0.0/12 list=BOGONS
add address=192.0.0.0/24 list=BOGONS
add address=192.0.2.0/24 list=BOGONS
add address=192.168.0.0/16 list=BOGONS
add address=198.18.0.0/15 list=BOGONS
add address=198.51.100.0/24 list=BOGONS
add address=203.0.113.0/24 list=BOGONS
add address=224.0.0.0/3 list=BOGONS
add address=37.0.29.144/28 comment=DC list=allow-mng-src
add address=109.234.159.72/29 comment=Selectel list=allow-mng-src
add address=85.140.63.236 comment="Samara MTS" list=allow-mng-src
add address=141.0.176.53 comment="Samara Avantel" list=allow-mng-src
add address=89.189.1.176/30 comment="NN Beeline" list=allow-mng-src
add address=95.79.111.166 comment="NN DomRU" list=allow-mng-src
add address=89.249.249.224/27 comment="Nahabino Mosline" list=allow-mng-src
add address=91.210.85.216/29 comment="Nahabino Fortex" list=allow-mng-src
add address=92.62.112.189 comment="Moscow M7" list=allow-mng-src
add address=109.167.193.149 comment="Ligovka WestKall" list=allow-mng-src
add address=94.230.162.99 comment="Ligovka Unis" list=allow-mng-src
add address=109.167.203.211 comment="IP Socolceva" list=allow-mng-src
add address=77.244.22.224/29 comment="IP Socolceva 2" list=allow-mng-src
add address=95.79.112.147 comment=HPL list=allow-mng-src
add address=176.221.9.250 comment=Baltika9 list=allow-mng-src
add address=178.176.12.105 comment=Moscow_Diapazon_Orange list=allow-mng-src
add address=195.151.167.65 comment=Moscow_Diapazon_Megafon list=allow-mng-src
add address=85.140.63.0/24 comment=Sochi3 list=allow-mng-src
add address=185.61.94.233 comment=Vkusno list=allow-mng-src
add address=87.245.175.116 comment=PaperUpack list=allow-mng-src
add address=217.76.40.104/29 comment="PaperUpack Proizvodstvo" list=\
    allow-mng-src
add address=89.22.17.0/24 comment=Ezhivika list=allow-mng-src
add address=136.243.22.158 comment="Fast VPS" list=allow-mng-src
add address=46.36.216.112 comment="Fast VPS" list=allow-mng-src
add address=5.101.196.232 comment=Remzona list=allow-mng-src
add address=90.154.127.194 comment=Uniroll list=allow-mng-src
add address=192.168.0.0/16 comment="mange from LAN" list=allow-mng-src
add address=195.151.167.67 comment=Orange list=allow-mng-src
add address=109.234.159.76 comment=Selectel list=allow-mng-src
add address=192.168.87.0/24 comment="mange from PY" list=allow-mng-src
add address=185.13.112.239 comment="mange from PY" list=allow-mng-src
add address=109.252.122.237 comment="manage from AM" list=allow-mng-src
add address=95.165.6.179 comment="Manage from AM" list=allow-mng-src
add address=158.58.132.132 comment=Sochi_BiSv list=allow-mng-src
add address=185.13.112.193 comment="mange from PY" list=allow-mng-src
/ip firewall filter
add action=accept chain=input comment="Allow Related connections" \
    connection-state=related
add action=accept chain=input comment="Allow Established connections" \
    connection-state=established
add action=accept chain=input comment="Accept All My IP" in-interface-list=\
    Internet src-address-list="All My IP"
add action=accept chain=input comment="accept allow-mng-src" \
    src-address-list=allow-mng-src
add action=drop chain=input comment="dropping port scanners" \
    src-address-list=port_scanners
add action=drop chain=input comment="Drop DNS" dst-port=53 in-interface-list=\
    Internet protocol=udp
add action=drop chain=input comment="Drop DNS" dst-port=53 in-interface-list=\
    Internet protocol=tcp
add action=jump chain=input connection-state=new dst-port=8291,23,22 \
    in-interface-list=NoDiscovery jump-target=check-bruteforce_Winbox \
    protocol=tcp
add action=add-src-to-address-list address-list=bruteforce_Winbox \
    address-list-timeout=1h chain=check-bruteforce_Winbox src-address-list=\
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
    new in-interface-list=Internet src-address-list=bruteforce_Winbox
add action=accept chain=input comment=Accept_Winbox_Ssh dst-port=8291 \
    in-interface-list=Internet protocol=tcp
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=1m chain=input comment="Port scanners to list" \
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
add action=drop chain=input comment=Drop_ALL in-interface-list=Internet
add action=drop chain=forward comment=Drop_ALL connection-state=new \
    in-interface-list=Internet out-interface=Local
add action=drop chain=forward comment=Drop_ALL connection-state=new disabled=\
    yes dst-address-list=BOGONS in-interface=Local
add action=drop chain=forward comment=Drop_ALL connection-state=new disabled=\
    yes in-interface=Local protocol=icmp
add action=drop chain=input comment=Drop_ALL connection-state=new disabled=\
    yes in-interface=Local protocol=icmp
/ip firewall mangle
add action=mark-routing chain=prerouting dst-address=0.0.0.0/0 \
    dst-address-list=!BOGONS new-routing-mark=ToVPS passthrough=no \
    src-address=192.168.254.248/29
/ip firewall nat
add action=masquerade chain=srcnat dst-address=0.0.0.0/0 dst-address-list=\
    !BOGONS out-interface=KKM_Mobile_Motor src-address=192.168.254.248/29
/ip firewall service-port
set ftp disabled=yes
set tftp disabled=yes
set irc disabled=yes
set h323 disabled=yes
set sip disabled=yes
set pptp disabled=yes
set udplite disabled=yes
set dccp disabled=yes
set sctp disabled=yes
/ip route
add distance=1 gateway=172.20.22.1 routing-mark=ToVPS
/ip service
set telnet address=192.168.4.18/32 disabled=yes
set ftp disabled=yes
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/ipv6 nd
set [ find default=yes ] advertise-dns=no
/routing filter
add action=accept chain=ospf-out prefix=192.168.254.248/29
add action=discard chain=ospf-out
/routing ospf network
add area=backbone network=10.254.0.12/30
/system clock
set time-zone-name=Europe/Moscow
/system identity
set name=Mobile_Motor_KKM
/system scheduler
add interval=1w name=Weekly_Backup_Scheduler on-event=Weekly_Backup_Script \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/03/2019 start-time=12:00:00
/system script
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
set address=mail.opti-com.ru from=mikrotik@opti-com.ru password=5e76a8Ts55 \
    start-tls=yes user=mikrotik
/tool mac-server
set allowed-interface-list=none
/tool mac-server mac-winbox
set allowed-interface-list=none
/tool mac-server ping
set enabled=no
