# feb/25/2021 09:40:07 by RouterOS 6.47.1
# software id = AEB5-SSFV
#
# model = RouterBOARD 962UiGS-5HacT2HnT
# serial number = 6F120660F398
/interface l2tp-server
add disabled=yes name=DC-Vkusno-Fortex user=DC-Vkusno-Fortex
add disabled=yes name=M7-Vkusno-Fortex user=M7-Vkusno-Fortex
/interface bridge
add fast-forward=no name=bridge1
/interface ethernet
set [ find default-name=ether1 ] speed=100Mbps
set [ find default-name=ether2 ] speed=100Mbps
set [ find default-name=ether3 ] speed=100Mbps
set [ find default-name=ether4 ] speed=100Mbps
set [ find default-name=ether5 ] speed=100Mbps
set [ find default-name=sfp1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
/interface wireless
set [ find default-name=wlan1 ] antenna-gain=0 country=no_country_set \
    disabled=no frequency=auto frequency-mode=manual-txpower mode=ap-bridge \
    ssid=Vkusno2g station-roaming=enabled
set [ find default-name=wlan2 ] antenna-gain=0 country=no_country_set \
    disabled=no frequency=auto frequency-mode=manual-txpower mode=ap-bridge \
    ssid=Vkusno5g station-roaming=enabled
/interface gre
add allow-fast-path=no local-address=185.61.94.233 mtu=1350 name=to_M8 \
    remote-address=37.0.29.153
add allow-fast-path=no ipsec-secret=Opti_SIP-7556009 local-address=\
    185.61.94.233 mtu=1350 name=to_M9_ATS remote-address=109.234.159.244
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk eap-methods="" \
    group-ciphers=tkip,aes-ccm mode=dynamic-keys supplicant-identity=MikroTik \
    unicast-ciphers=tkip,aes-ccm wpa-pre-shared-key=84959800648 \
    wpa2-pre-shared-key=84959800648
/ip pool
add name=dhcp_pool1 ranges=192.168.7.10-192.168.7.200
add name=l2tp ranges=172.20.9.2-172.20.9.100
/ip dhcp-server
add address-pool=dhcp_pool1 authoritative=after-2sec-delay disabled=no \
    interface=bridge1 name=dhcp1
/ppp profile
add change-tcp-mss=yes local-address=172.20.9.1 name=l2tp remote-address=l2tp \
    use-encryption=yes
/routing ospf instance
set [ find default=yes ] router-id=192.168.7.1
/snmp community
set [ find default=yes ] addresses=0.0.0.0/0
add addresses=192.168.5.106/32 name=pavlik
/user group
add name=Engineers policy="local,read,test,winbox,web,!telnet,!ssh,!ftp,!reboo\
    t,!write,!policy,!password,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=bridge1 hw=no interface=ether2
add bridge=bridge1 hw=no interface=ether3
add bridge=bridge1 hw=no interface=ether4
add bridge=bridge1 hw=no interface=sfp1
add bridge=bridge1 interface=wlan1
add bridge=bridge1 interface=wlan2
add bridge=bridge1 interface=ether5
/interface l2tp-server server
set authentication=mschap2 default-profile=l2tp enabled=yes ipsec-secret=\
    Opti-VPN use-ipsec=yes
/interface pptp-server server
set enabled=yes
/ip address
add address=192.168.7.1/24 interface=bridge1 network=192.168.7.0
add address=185.61.94.233/24 interface=ether1 network=185.61.94.0
add address=10.254.2.122/30 interface=to_M9_ATS network=10.254.2.120
add address=10.254.1.102/30 interface=to_M8 network=10.254.1.100
/ip dhcp-client
add interface=ether2
/ip dhcp-server lease
add address=192.168.7.100 comment=\
    "\CA\E0\F1\F1\EE\E2\FB\E9 \CA\EE\EC\EF\EB\E5\EA\F1" mac-address=\
    14:1F:BA:ED:55:FE server=dhcp1
add address=192.168.7.195 client-id=1:0:e:c4:ce:2d:fc comment=airii-pc \
    mac-address=00:0E:C4:CE:2D:FC server=dhcp1
/ip dhcp-server network
add address=192.168.7.0/24 boot-file-name="boot\\pxeboot.n12" dns-server=\
    192.168.7.1 gateway=192.168.7.1 next-server=192.168.7.1
/ip dns
set allow-remote-requests=yes servers=192.168.5.8,192.168.4.9
/ip dns static
add address=192.168.7.1 name=VkusnoPXE type=A
add address=192.168.4.4 name=fs-public.office.opticom.local type=A
add address=192.168.4.4 name=fs-space.office.opticom.local type=A
add address=192.168.4.4 name=fs-public type=A
add address=192.168.4.4 name=fs-space type=A
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
add address=109.234.159.246 list="All My IP"
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
add address=109.167.193.149 list="All My IP"
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
add address=92.62.112.189 list="All My IP"
add address=95.165.6.179 comment="Manage from AM" list=allow-mng-src
add address=158.58.132.132 comment=Sochi_BiSv list=allow-mng-src
add address=185.13.112.193 comment="mange from PY" list=allow-mng-src
/ip firewall filter
add action=drop chain=input comment=Drop-bruteforce_Winbox connection-state=\
    new in-interface=ether1 src-address-list=bruteforce_Winbox
add action=drop chain=input comment=Drop_PortScaners in-interface=ether1 \
    src-address-list=port_scanners
add action=drop chain=input comment="Drop DNS" dst-port=53 in-interface=\
    ether1 protocol=udp
add action=drop chain=input comment="Drop DNS" dst-port=53 in-interface=\
    ether1 protocol=tcp
add action=accept chain=input src-address-list="All My IP"
add action=accept chain=input comment="Allow Established connections" \
    connection-state=established
add action=accept chain=input comment="Allow Related connections" \
    connection-state=related
add action=jump chain=input connection-state=new dst-port=8291,23 \
    in-interface=ether1 jump-target=check-bruteforce_Winbox protocol=tcp
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
add action=accept chain=input comment=Accept_Winbox_Ssh dst-port=8291 \
    in-interface=ether1 protocol=tcp
add action=accept chain=input comment="accept ipsec udp" dst-port=500,4500 \
    protocol=udp
add action=accept chain=input comment="Accept GRE" protocol=gre
add action=accept chain=input comment="accept l2tp" dst-port=1701 protocol=\
    udp
add action=accept chain=input comment="accept ipsec-esp" protocol=ipsec-esp
add action=accept chain=input comment="accept ospf" protocol=ospf
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
add action=add-src-to-address-list address-list=MAIL_bruteforce-stage-8 \
    address-list-timeout=20s chain=check-MAIL_bruteforce disabled=yes \
    src-address-list=MAIL_bruteforce-stage-7
add action=add-src-to-address-list address-list=MAIL_bruteforce-stage-7 \
    address-list-timeout=20s chain=check-MAIL_bruteforce disabled=yes \
    src-address-list=MAIL_bruteforce-stage-6
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
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
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
add distance=2 gateway=185.61.94.232
add check-gateway=ping distance=1 dst-address=192.168.200.0/24 gateway=to_M8 \
    scope=20
/ip service
set telnet address=192.168.4.18/32
set ftp disabled=yes
set www address=192.168.0.0/16 disabled=yes
set ssh address=192.168.0.0/16
set api address=192.168.0.0/16 disabled=yes
set api-ssl address=192.168.0.0/16 disabled=yes
/ip smb
set comment=MikrotikSMBVkusno domain=office.opticom.local enabled=yes \
    interfaces=bridge1,DC-Vkusno-Fortex
/ip smb shares
set [ find default=yes ] disabled=yes
add directory=/disk1 max-sessions=100 name=pxe
/ip smb users
add name=pxeload password=pXPBWyp51a read-only=no
/ip socks
set enabled=yes port=4153
/ip socks access
add action=deny src-address=!95.154.216.128/25
/ip ssh
set allow-none-crypto=yes forwarding-enabled=remote
/ip tftp
add ip-addresses=192.168.7.0/24,192.168.16.0/22,10.0.10.0/24 real-filename=\
    /disk1/boot/pxeboot.n12 req-filename="boot\\\\pxeboot.n12"
add ip-addresses=192.168.7.0/24,10.0.10.0/24 real-filename=/disk1/boot/BCD \
    req-filename="Boot\\\\BCD"
add ip-addresses=192.168.7.0/24,10.0.10.0/24 real-filename=\
    /disk1/boot/bootmgr.exe req-filename="boot\\\\bootmgr.exe"
add ip-addresses=192.168.7.0/24,10.0.10.0/24 real-filename=\
    /disk1/boot/boot.sdi req-filename="Boot\\\\boot.sdi"
add ip-addresses=192.168.7.0/24,10.0.10.0/24 real-filename=\
    /disk1/boot/boot.sdi req-filename="boot\\\\boot.sdi"
add allow-rollover=yes ip-addresses=192.168.7.0/24,10.0.10.0/24 \
    real-filename=/disk1/boot/winpe.wim req-filename="Boot\\\\winpe.wim"
/ppp secret
add local-address=172.20.9.1 name=Mikrotik_Vkusno password=\
    Mikrotik_Vkusno_7556009 profile=l2tp remote-address=172.20.9.100 service=\
    l2tp
add local-address=10.254.0.229 name=DC-Vkusno-Fortex password=\
    DC-Vkusno-Fortex-7556009 profile=default-encryption remote-address=\
    10.254.0.230 service=l2tp
add local-address=10.254.0.233 name=M7-Vkusno-Fortex password=\
    M7-Vkusno-Fortex-7556009 profile=default-encryption remote-address=\
    10.254.0.234 service=l2tp
/routing filter
add action=discard chain=ospf-out prefix=185.61.94.0/24
add action=discard chain=ospf-in prefix=11.11.0.0/24
add action=discard chain=ospf-in prefix=11.11.0.1
add action=discard chain=ospf-in prefix=11.11.0.10
add action=discard chain=ospf-in prefix=11.11.0.20
add action=discard chain=ospf-in prefix=11.11.0.30
add action=discard chain=ospf-in prefix=11.11.0.40
add action=discard chain=ospf-in prefix=11.11.0.50
add action=discard chain=ospf-in prefix=11.11.0.60
add action=discard chain=ospf-in prefix=11.11.0.70
add action=discard chain=ospf-in prefix=11.11.0.80
add action=discard chain=ospf-in prefix=11.11.11.1
add action=discard chain=ospf-in prefix=10.1.1.0/30
add action=discard chain=ospf-in prefix=11.11.0.130
add action=discard chain=ospf-in prefix=11.11.0.100
add action=discard chain=ospf-in prefix=11.11.11.3
add action=discard chain=ospf-in prefix=11.11.11.6
add action=discard chain=ospf-in prefix=11.11.11.70
add action=discard chain=ospf-in prefix=11.11.11.2
add action=discard chain=ospf-in prefix=11.11.11.4
add action=discard chain=ospf-in prefix=11.11.11.5
add action=discard chain=ospf-in prefix=11.11.11.5
add action=discard chain=ospf-in prefix=11.11.11.7
add action=discard chain=ospf-in prefix=11.11.11.8
add action=discard chain=ospf-in prefix=11.11.11.9
add action=discard chain=ospf-in prefix=11.11.11.20
add action=discard chain=ospf-in prefix=11.11.11.20
add action=discard chain=ospf-in prefix=11.11.11.99
/routing ospf network
add area=backbone network=10.0.10.0/24
add area=backbone network=10.254.1.100/30
add area=backbone network=192.168.7.0/24
/snmp
set enabled=yes location=Moscow trap-community=pavlik trap-version=3
/system clock
set time-zone-autodetect=no time-zone-name=Europe/Moscow
/system identity
set name=Vkusno
/system leds
set 1 interface=wlan2
/system logging
add disabled=yes topics=tftp
add disabled=yes topics=smb
/system ntp client
set enabled=yes primary-ntp=192.168.4.9 secondary-ntp=212.7.1.131
/system routerboard settings
set cpu-frequency=600MHz
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
