# jun/06/1971 02:51:10 by RouterOS 6.44.3
# software id = SUT7-ZI3W
#
# model = CCR1009-7G-1C-1S+
# serial number = 914F0A3D3DAF
/interface bridge
add name=Local
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
add name=DC-Samara-Avantel user=DC-Samara-Avantel
add name=DC-Samara-MTS user=DC-Samara-MTS
add name=M7-Samara-Avantel user=M7-Samara-Avantel
add name=M7-Samara-MTS user=M7-Samara-MTS
/interface list
add exclude=all name=Internet
add exclude=Internet include=all name=LocalLan
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=l2tp ranges=172.20.6.2-172.20.6.100
add name=dhcp_pool0 ranges=\
    192.168.62.10-192.168.62.254,192.168.63.30-192.168.63.200
/ip dhcp-server
add add-arp=yes address-pool=dhcp_pool0 disabled=no interface=Local \
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
    \n}" lease-time=1h name=Local
/ppp profile
add change-tcp-mss=yes local-address=172.20.6.1 name=VPN-Internet \
    remote-address=l2tp use-encryption=yes
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-1 router-id=\
    192.168.63.1
/system logging action
set 0 memory-lines=10000
/interface bridge port
add bridge=Local interface=sfp-sfpplus1
add bridge=Local interface=ether3
add bridge=Local interface=ether4
add bridge=Local interface=ether5
/ip neighbor discovery-settings
set discover-interface-list=LocalLan
/interface l2tp-server server
set authentication=mschap2 enabled=yes ipsec-secret=Opti-VPN use-ipsec=yes
/interface list member
add interface=ether1 list=Internet
add interface=ether2 list=Internet
/ip address
add address=85.140.63.236/24 interface=ether1 network=85.140.63.0
add address=141.0.176.53/27 interface=ether2 network=141.0.176.32
add address=192.168.63.1/23 interface=Local network=192.168.62.0
add address=10.10.10.1/29 comment=Master disabled=yes interface=ether6 \
    network=10.10.10.0
add address=10.10.10.2/29 comment=Slave interface=ether6 network=10.10.10.0
/ip dhcp-client
add dhcp-options=hostname,clientid disabled=no interface=ether7
/ip dhcp-server alert
add disabled=no interface=Local
/ip dhcp-server lease
add address=192.168.63.43 mac-address=00:50:56:80:75:F9
add address=192.168.63.12 mac-address=00:07:4D:6F:F1:EE
add address=192.168.62.9 client-id=1:0:3:ea:15:e7:c8 mac-address=\
    00:03:EA:15:E7:C8 server=Local
/ip dhcp-server network
add address=192.168.62.0/23 boot-file-name="boot\\pxeboot.n12" dns-server=\
    192.168.4.9,192.168.5.5 domain=office.opticom.local gateway=192.168.63.1 \
    next-server=192.168.63.43
/ip dns
set allow-remote-requests=yes query-server-timeout=10s query-total-timeout=\
    20s servers=8.8.8.8
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
add address=178.176.12.104/29 list="All My IP"
add address=195.151.167.64/29 list="All My IP"
add address=92.62.112.128/25 list="All My IP"
/ip firewall filter
add action=drop chain=input comment="dropping port scanners" \
    in-interface-list=Internet src-address-list=port_scanners
add action=drop chain=input comment="Drop DNS" dst-port=53 in-interface-list=\
    Internet protocol=udp
add action=drop chain=input comment="Drop DNS" dst-port=53 in-interface-list=\
    Internet protocol=tcp
add action=accept chain=input comment="Accept All My IP" in-interface-list=\
    Internet src-address-list="All My IP"
add action=accept chain=input comment="Allow Established connections" \
    connection-state=established
add action=accept chain=input comment="Allow Related connections" \
    connection-state=related
add action=jump chain=input connection-state=new dst-port=8291,23,22 \
    in-interface-list=Internet jump-target=check-bruteforce_Winbox protocol=\
    tcp
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
add action=jump chain=forward comment=check-MAIL_bruteforce connection-state=\
    new disabled=yes dst-port=25,465,587,993,443 in-interface-list=Internet \
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
    25,465,587,993,443 in-interface-list=Internet protocol=tcp
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
add action=drop chain=input comment=Drop_ALL in-interface-list=Internet
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
add action=masquerade chain=srcnat out-interface-list=Internet src-address=\
    192.168.62.0/23
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
add check-gateway=ping distance=1 gateway=85.140.63.254 routing-mark=MTS
add check-gateway=ping distance=1 gateway=141.0.176.33 routing-mark=Avantel
add check-gateway=ping distance=2 gateway=141.0.176.33
add check-gateway=ping distance=3 gateway=85.140.63.254
add distance=3 dst-address=192.168.200.0/24 gateway=M7-Samara-Avantel
add distance=4 dst-address=192.168.200.0/24 gateway=M7-Samara-MTS
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
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
/routing filter
add action=accept chain=ospf-out prefix=192.168.62.0/23
add action=discard chain=ospf-out
/routing ospf interface
add interface=DC-Samara-Avantel network-type=point-to-point
add cost=15 interface=DC-Samara-MTS network-type=point-to-point
/routing ospf network
add area=backbone network=10.0.10.0/24
add area=backbone network=10.254.0.168/30
add area=backbone network=10.254.0.172/30
/system clock
set time-zone-name=Europe/Moscow
/system identity
set name=Samara_MikroTik_Slave
/system logging
set 3 action=disk
/system ntp client
set enabled=yes primary-ntp=94.247.111.10 secondary-ntp=192.168.4.9
/system scheduler
add interval=1w name=fullWeeklyBackupJob on-event=fullWeeklyBackup policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2018 start-time=12:00:00
add interval=10m name=Reset on-event=Reset_to_def_and_load_config policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add disabled=yes interval=1d1m1s name=BackupConfig on-event=ConfigToBackup \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
/system script
add dont-require-permissions=no name=fullWeeklyBackup owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    export file=\"config_full.rsc\";\r\
    \n:delay 2s;\r\
    \n /tool e-mail send to=\"d.anischenko@opti-com.ru\" subject=\"Samara Mikr\
    otik Full Weekly backup script\" file=\"config_full.rsc\";\r\
    \n:delay 2s;\r\
    \n/file remove config_full.rsc;"
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
/tool e-mail
set address=mail.opti-com.ru from=mikrotik@opti-com.ru password=5e76a8Ts5 \
    start-tls=yes user=mikrotik
/tool mac-server
set allowed-interface-list=LocalLan
/tool mac-server mac-winbox
set allowed-interface-list=LocalLan
/tool netwatch
add down-script="/tool e-mail send to=\"d.anischenko@opti-com.ru\" subject=\"S\
    amara Not ping DC\" body=\"Ping From Samara 141.0.176.53 to DC 37.0.29.152\
    \_is FAIL \";\r\
    \n" host=37.0.29.152 interval=10s
