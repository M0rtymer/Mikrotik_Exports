# feb/08/2021 09:55:13 by RouterOS 6.47.7
# software id = 65IE-BQRA
#
# model = CCR1009-7G-1C-1S+
# serial number = 7AEC0750EF0B
/interface bridge
add name=management
/interface ethernet
set [ find default-name=ether1 ] speed=100Mbps
set [ find default-name=ether2 ] speed=100Mbps
set [ find default-name=ether3 ] speed=100Mbps
set [ find default-name=ether4 ] speed=100Mbps
set [ find default-name=ether5 ] speed=100Mbps
set [ find default-name=ether6 ] speed=100Mbps
set [ find default-name=ether7 ] speed=100Mbps
set [ find default-name=sfp-sfpplus1 ] advertise=\
    10M-full,100M-full,1000M-full loop-protect=on
/interface l2tp-server
add name=NBN_Padik user=NBN_Padik
add comment="Lic-edge >>> 1C" disabled=yes name=lic-edge user=lic-edge
/interface vrrp
add interface=ether6 name=Lan2x priority=200 vrid=3
add authentication=ah interface=sfp-sfpplus1 name=Levira on-backup="/interface\
    \_disable [find name=\"Baltika9-R_Telecom\"]\r\
    \n/interface disable [find name=\"BumUpack-Origamo\"]\r\
    \n/interface disable [find name=\"Ezevika-Fortex\"]\r\
    \n/interface disable [find name=\"HPL-ER-Telecom\"]\r\
    \n/interface disable [find name=\"Ligovka-Unis\"]\r\
    \n/interface disable [find name=\"Ligovka-WestKall\"]\r\
    \n/interface disable [find name=\"LigovkaRoznica-Sokoltseva\"]\r\
    \n/interface disable [find name=\"M7\"]\r\
    \n/interface disable [find name=\"Moscow_Diapazon-Megafon\"]\r\
    \n/interface disable [find name=\"Moscow_Diapazon-Orange\"]\r\
    \n/interface disable [find name=\"NN-Beeline\"]\r\
    \n/interface disable [find name=\"NN-DomRu\"]\r\
    \n/interface disable [find name=\"Nahabino-Fortex\"]\r\
    \n/interface disable [find name=\"Nahabino-Mosline\"]\r\
    \n/interface disable [find name=\"Remzona\"]\r\
    \n/interface disable [find name=\"Samara-Avantel\"]\r\
    \n/interface disable [find name=\"Samara-MTS\"]\r\
    \n/interface disable [find name=\"Sun-City\"]\r\
    \n/interface disable [find name=\"UniRoll-COMCOR\"]\r\
    \n/interface disable [find name=\"Unipacking-MTS\"]\r\
    \n/interface disable [find name=\"Vkusno-Fortex\"]\r\
    \n/interface disable [find name=\"VolgaUpack\"]" on-master="/interface ena\
    ble [find name=\"Baltika9-R_Telecom\"]\r\
    \n/interface enable [find name=\"BumUpack-Origamo\"]\r\
    \n/interface enable [find name=\"Ezevika-Fortex\"]\r\
    \n/interface enable [find name=\"HPL-ER-Telecom\"]\r\
    \n/interface enable [find name=\"Ligovka-Unis\"]\r\
    \n/interface enable [find name=\"Ligovka-WestKall\"]\r\
    \n/interface enable [find name=\"LigovkaRoznica-Sokoltseva\"]\r\
    \n/interface enable [find name=\"M7\"]\r\
    \n/interface enable [find name=\"Moscow_Diapazon-Megafon\"]\r\
    \n/interface enable [find name=\"Moscow_Diapazon-Orange\"]\r\
    \n/interface enable [find name=\"NN-Beeline\"]\r\
    \n/interface enable [find name=\"NN-DomRu\"]\r\
    \n/interface enable [find name=\"Nahabino-Fortex\"]\r\
    \n/interface enable [find name=\"Nahabino-Mosline\"]\r\
    \n/interface enable [find name=\"Remzona\"]\r\
    \n/interface enable [find name=\"Samara-Avantel\"]\r\
    \n/interface enable [find name=\"Samara-MTS\"]\r\
    \n/interface enable [find name=\"Sun-City\"]\r\
    \n/interface enable [find name=\"UniRoll-COMCOR\"]\r\
    \n/interface enable [find name=\"Unipacking-MTS\"]\r\
    \n/interface enable [find name=\"Vkusno-Fortex\"]\r\
    \n/interface enable [find name=\"VolgaUpack\"]" password=Opti7556009 \
    priority=200 version=2
add disabled=yes interface=combo1 name=Local_VRRP priority=200 version=2 \
    vrid=2
/interface gre
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_Ezhevika remote-address=89.22.17.149
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_HPL remote-address=95.79.112.147
add allow-fast-path=no ipsec-secret=Opti-VPN local-address=37.0.29.153 name=\
    to_IP_Shelistov remote-address=158.58.132.129
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_IP_Sokoltceva1 remote-address=\
    109.167.203.211
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_IP_Sokoltceva2 remote-address=109.167.197.75
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_M7_VPN remote-address=109.234.159.76
add allow-fast-path=no ipsec-secret=Opti_SIP-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_M9_ATS remote-address=109.234.159.244
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_MBM-Roll remote-address=87.245.140.157
add allow-fast-path=no ipsec-secret=Opti-VPN local-address=37.0.29.153 mtu=\
    1350 name=to_MSK_Megafon remote-address=178.176.12.106
add allow-fast-path=no ipsec-secret=Qwe1 local-address=37.0.29.153 name=\
    to_MSK_Orange remote-address=195.151.167.69
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_NBN_Fortex remote-address=91.210.85.220
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_NBN_Mosline remote-address=89.249.249.235
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_NBN_PDK_Mastertel remote-address=\
    109.73.39.210
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_NN_Beeline remote-address=89.189.1.178
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_NN_DomRu remote-address=95.79.111.166
add allow-fast-path=no ipsec-secret=Opti-VPN local-address=37.0.29.153 mtu=\
    1350 name=to_PUP2 remote-address=87.245.175.116
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_SAM_Avantel remote-address=141.0.176.53
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_SAM_MTS remote-address=85.140.63.236
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_SB-Service_Remzona remote-address=\
    5.101.196.232
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_SCH_BiSv remote-address=158.58.132.132
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_SCH_DagoTel remote-address=91.215.90.202
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_SPB_Kuz_TTK remote-address=188.43.245.113
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_SPB_Kuz_WestCall remote-address=\
    176.221.9.250
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_SPB_Samsa_Severen remote-address=46.228.4.44
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_SPB_Samsa_WestCall remote-address=\
    77.244.30.26
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_Uniroll remote-address=90.154.127.194
add allow-fast-path=no ipsec-secret=Opti-VPN local-address=37.0.29.153 mtu=\
    1350 name=to_Vkusno remote-address=185.61.94.233
add allow-fast-path=no ipsec-secret=Opti_OSPF-7556009 local-address=\
    37.0.29.153 mtu=1350 name=to_VolgaUpack remote-address=95.79.121.4
/interface vlan
add interface=combo1 name=Vlan6 vlan-id=6
/interface list
add name=Internet
add exclude=Internet include=all name=discover
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip ipsec peer
add address=178.176.12.105/32 disabled=yes local-address=37.0.29.146 name=\
    DiapazonMegafon
/ip ipsec profile
add dh-group=modp1024 enc-algorithm=aes-128 name=MyProfile nat-traversal=no
/ip ipsec peer
add address=217.76.40.106/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=BumUpack-Podolsk profile=MyProfile
add address=195.151.167.65/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=DiapazonOrange profile=MyProfile
add address=188.43.245.113/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=Baltika9_TTK profile=MyProfile
add address=176.221.9.250/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=Baltika9-R_Telecom profile=MyProfile
add address=109.167.203.211/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=LigovkaRoznica-Sokoltseva profile=MyProfile
add address=109.167.193.149/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=Ligovka-WestKall profile=MyProfile
add address=95.79.112.147/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=HPL-ER-Telecom profile=MyProfile
add address=94.230.162.99/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=Ligovka-Unis profile=MyProfile
add address=92.62.112.189/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=M7-Rackstore profile=MyProfile
add address=91.210.85.220/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=Nahabino-Fortex profile=MyProfile
add address=89.249.249.235/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=Nahabino-Mosline profile=MyProfile
add address=89.22.17.149/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=Ezevika profile=MyProfile
add address=77.244.22.227/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=Sokolceva2 profile=MyProfile
add address=5.101.196.232/32 disabled=yes exchange-mode=ike2 local-address=\
    37.0.29.146 name=Remzona profile=MyProfile
/ip ipsec proposal
add enc-algorithms=aes-128-cbc name=MyProp
/ip pool
add name=VPN ranges=10.0.10.120-10.0.10.254
add name=ServiceVPN ranges=192.168.25.130-192.168.25.190
/ppp profile
set *0 dns-server=192.168.5.8,192.168.4.9 local-address=10.0.10.101 \
    remote-address=VPN
add name=VPNblank use-encryption=yes
add dns-server=192.168.5.8,192.168.4.9 local-address=192.168.25.129 name=\
    ServiceVPN remote-address=ServiceVPN use-encryption=yes
add change-tcp-mss=yes name=NoEncrypt use-encryption=no
add name=EncryptYes use-encryption=yes
add name=encrypt_profile use-encryption=required
set *FFFFFFFE use-encryption=required
/interface sstp-client
add connect-to=195.151.167.65 name=sstp-out1 password=user1234 profile=\
    default-encryption user=user1234
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-1 \
    redistribute-other-ospf=as-type-1 router-id=10.0.10.100
/snmp community
add addresses=::/0 name=pavlik
/system logging action
set 0 memory-lines=10000
set 3 remote=192.168.4.12
add bsd-syslog=yes name=gremote remote=192.168.5.111 remote-port=11512 \
    src-address=192.168.4.1 syslog-facility=syslog target=remote
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=Engineers policy="local,read,test,winbox,web,!telnet,!ssh,!ftp,!reboo\
    t,!write,!policy,!password,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=management interface=ether4
add bridge=management interface=ether5
/ip firewall connection tracking
set tcp-established-timeout=10m
/ip neighbor discovery-settings
set discover-interface-list=!Internet
/interface l2tp-server server
set allow-fast-path=yes authentication=mschap1,mschap2 default-profile=\
    ServiceVPN enabled=yes ipsec-secret=Opti-VPN max-mru=1400 max-mtu=1400 \
    use-ipsec=yes
/interface list member
add interface=sfp-sfpplus1 list=Internet
add interface=Levira list=Internet
/ip address
add address=37.0.29.152/28 interface=Levira network=37.0.29.144
add address=37.0.29.153/28 interface=Levira network=37.0.29.144
add address=10.10.10.1/29 comment=Master interface=ether7 network=10.10.10.0
add address=10.10.10.2/29 comment=Slave disabled=yes interface=ether7 \
    network=10.10.10.0
add address=192.168.4.1/23 disabled=yes interface=Local_VRRP network=\
    192.168.4.0
add address=10.10.10.10/29 comment=Master-VRRP interface=combo1 network=\
    10.10.10.8
add address=10.10.10.9/29 comment=Slave-VRRP disabled=yes interface=combo1 \
    network=10.10.10.8
add address=10.10.10.17/29 comment=VRRP-Levira-Master interface=sfp-sfpplus1 \
    network=10.10.10.16
add address=10.10.10.18/29 comment=VRRP-Levira-Slave disabled=yes interface=\
    sfp-sfpplus1 network=10.10.10.16
add address=192.168.2.1/24 interface=Lan2x network=192.168.2.0
add address=10.10.10.25/29 comment=Lan2x-VRRP-Master interface=ether6 \
    network=10.10.10.24
add address=10.10.10.26/29 comment=Lan2x-VRRP-Slave disabled=yes interface=\
    ether6 network=10.10.10.24
add address=37.0.29.146/28 interface=Levira network=37.0.29.144
add address=10.10.5.5 disabled=yes interface=ether5 network=10.10.5.5
add address=10.254.1.113/30 interface=to_IP_Shelistov network=10.254.1.112
add address=10.254.1.5/30 interface=to_M9_ATS network=10.254.1.4
add address=10.254.1.69/30 interface=to_SCH_DagoTel network=10.254.1.68
add address=10.254.1.73/30 interface=to_SCH_BiSv network=10.254.1.72
add address=10.254.1.81/30 interface=to_HPL network=10.254.1.80
add address=10.254.1.1/30 interface=to_M7_VPN network=10.254.1.0
add address=10.254.1.13/30 interface=to_MSK_Megafon network=10.254.1.12
add address=10.254.1.9/30 interface=to_MSK_Orange network=10.254.1.8
add address=10.254.1.17/30 interface=to_NBN_Fortex network=10.254.1.16
add address=10.254.1.21/30 interface=to_NBN_Mosline network=10.254.1.20
add address=10.254.1.25/30 interface=to_SPB_Samsa_WestCall network=\
    10.254.1.24
add address=10.254.1.29/30 interface=to_SPB_Samsa_Severen network=10.254.1.28
add address=10.254.1.33/30 interface=to_SPB_Kuz_WestCall network=10.254.1.32
add address=10.254.1.37/30 interface=to_SPB_Kuz_TTK network=10.254.1.36
add address=10.254.1.41/30 interface=to_NN_DomRu network=10.254.1.40
add address=10.254.1.45/30 interface=to_NN_Beeline network=10.254.1.44
add address=10.254.1.61/30 interface=to_SAM_Avantel network=10.254.1.60
add address=10.254.1.65/30 interface=to_SAM_MTS network=10.254.1.64
add address=10.254.1.77/30 interface=to_Ezhevika network=10.254.1.76
add address=10.254.1.85/30 interface=to_IP_Sokoltceva1 network=10.254.1.84
add address=10.254.1.89/30 interface=to_IP_Sokoltceva2 network=10.254.1.88
add address=10.254.1.93/30 interface=to_MBM-Roll network=10.254.1.92
add address=10.254.1.97/30 interface=to_Uniroll network=10.254.1.96
add address=10.254.1.101/30 interface=to_Vkusno network=10.254.1.100
add address=10.254.1.109/30 interface=to_SB-Service_Remzona network=\
    10.254.1.108
add address=10.254.1.105/30 interface=to_PUP2 network=10.254.1.104
add address=10.254.1.117/30 interface=to_VolgaUpack network=10.254.1.116
add address=10.254.1.169/30 interface=to_NBN_PDK_Mastertel network=\
    10.254.1.168
add address=10.73.4.1/24 interface=management network=10.73.4.0
add address=192.168.4.1/23 interface=Vlan6 network=192.168.4.0
/ip dns
set servers=8.8.8.8
/ip dns static
add comment="DNS Split >>> FWD" forward-to=192.168.4.9 regexp=\
    ^.*dit|lab|office|office.opticom.local type=FWD
add forward-to=192.168.5.8 regexp=^.*dit|lab|office|office.opticom.local \
    type=FWD
/ip firewall address-list
add address=192.168.0.0/16 list=addr_to4x
add address=10.0.10.0/24 list=addr_to4x
add address=192.168.4.2 disabled=yes list=out_to_37.0.29.152
add address=192.168.5.7 comment=Jira list=out_to_37.0.29.153
add address=37.0.29.144/28 comment=DC list="All My IP"
add address=109.234.159.72/29 comment=Selectel list="All My IP"
add address=85.140.63.236 comment="Samara MTS" list="All My IP"
add address=89.189.1.176/30 comment="NN Beeline" list="All My IP"
add address=89.249.249.224/27 comment="Nahabino Mosline" list="All My IP"
add address=91.210.85.216/29 comment=Nahabino-Fortex list="All My IP"
add address=92.62.112.189 comment=Moscow-M7-Mikrotik-Global list="All My IP"
add address=94.230.162.99 comment=Ligovka-Unis list="All My IP"
add address=95.79.111.166 comment=NN-Office-DomRU list="All My IP"
add address=95.79.112.147 comment=HPL list="All My IP"
add address=109.167.203.211 comment="Ligovka_Roznica IP Socolceva" list=\
    "All My IP"
add address=109.167.193.149 comment=Ligovka-WestKall list="All My IP"
add address=141.0.176.53 comment="Samara Avantel" list="All My IP"
add address=176.221.9.250 comment=Baltika9 list="All My IP"
add address=178.176.12.104/29 comment=Moscow_Diapazon_Megafon list=\
    "All My IP"
add address=185.61.94.233 comment=Vkusno list="All My IP"
add address=195.151.167.65 comment=Moscow_Diapazon_Megafon list="All My IP"
add address=217.76.40.104/29 comment=PaperUpack-Proizvodstvo list="All My IP"
add address=46.36.216.112 comment="Fast VPS" list="All My IP"
add address=5.101.196.232 comment=Remzona list="All My IP"
add address=10.10.10.0/24 comment=DC list="All My IP"
add address=192.168.4.27 list=out_to_37.0.29.146
add address=136.243.22.158 comment="Fast VPS" list="All My IP"
add address=192.168.4.8 list=out_to_37.0.29.146
add address=192.168.4.18 list=out_to_37.0.29.146
add address=90.154.127.194 comment=SunCity list="All My IP"
add address=212.67.5.18 comment=WebSharks list=BPM
add address=192.168.4.137 list=out_to_37.0.29.146
add address=192.168.4.138 list=out_to_37.0.29.146
add address=192.168.4.112 list=out_to_37.0.29.146
add address=95.163.249.17 comment=WebSharks list=BPM
add address=95.163.210.126 comment=WebSharks list=BPM
add address=79.137.175.237 comment=WebSharks list=BPM
add address=188.234.155.14 comment=WebSharks list=BPM
add address=82.209.203.221 comment=OrangeProcess list=BPM
add address=192.168.5.9 list=out_to_37.0.29.146
add address=192.168.5.10 list=out_to_37.0.29.146
add address=192.168.4.5 list=Internet-to-Levira
add address=10.0.0.0/8 list=LocalNetAddress
add address=192.168.0.0/16 list=LocalNetAddress
add address=192.168.4.250 list=Internet-to-Levira
add address=192.168.4.12 disabled=yes list=Internet-to-Levira
add address=192.168.25.130-192.168.25.190 list=Internet-to-Levira
add address=192.168.5.101 list=out_to_37.0.29.146
add address=192.168.5.104 list=out_to_37.0.29.146
add address=192.168.4.12 list=out_to_MoscowOrange
add address=192.168.5.5 disabled=yes list=out_to_37.0.29.153
add address=80.75.130.0/24 comment="SIP Mtt" list=SIP
add address=79.126.33.23 comment=WebSharks disabled=yes list=BPM
add address=79.126.18.248 comment=WebSharks disabled=yes list=BPM
add address=89.207.88.67 comment=WebSharks list=BPM
add address=95.165.6.179 comment="Manage from AM" list=allow-mng-src
add address=212.34.48.0/24 comment=Lubaev list="All My IP"
add address=89.109.9.216 comment=WebSharks list=BPM
add address=192.168.5.130 comment=himinbjerg list=out_to_37.0.29.146
add address=158.58.132.132 comment=Sochi_BiSv list=allow-mng-src
add address=185.13.112.193 comment="mange from PY" list=allow-mng-src
add address=173.245.48.0/20 list=Clowdflare
add address=103.21.244.0/22 list=Clowdflare
add address=103.22.200.0/22 list=Clowdflare
add address=103.31.4.0/22 list=Clowdflare
add address=141.101.64.0/18 list=Clowdflare
add address=108.162.192.0/18 list=Clowdflare
add address=190.93.240.0/20 list=Clowdflare
add address=188.114.96.0/20 list=Clowdflare
add address=197.234.240.0/22 list=Clowdflare
add address=198.41.128.0/17 list=Clowdflare
add address=162.158.0.0/15 list=Clowdflare
add address=104.16.0.0/12 list=Clowdflare
add address=172.64.0.0/13 list=Clowdflare
add address=131.0.72.0/22 list=Clowdflare
add address=192.168.5.80 comment=fortigate list=out_to_37.0.29.152
/ip firewall filter
add action=passthrough chain=forward src-address=10.73.0.0/16
add action=accept chain=forward comment="\C7\E0\F7\E5\EC \F2\EE \F1\F2\EE\FF\
    \EB\EE \EF\F0\E0\E2\E8\EB\EE \F1 accept forward -> 4.8, \EF\E5\F0\E5\E4\E5\
    \EB\E0\EB \EF\EE\E4 5.130" disabled=yes dst-address=192.168.5.130
add action=accept chain=input protocol=icmp
add action=accept chain=input comment="Allow Established connections" \
    connection-state=established,related
add action=accept chain=input disabled=yes protocol=icmp
add action=accept chain=forward comment="Allow Established connections" \
    connection-state=established,related
add action=accept chain=input comment=VRRP connection-state="" dst-address=\
    10.10.10.0/24 src-address=10.10.10.0/24
add action=accept chain=forward dst-port=1541,1560-1591 protocol=tcp
add action=accept chain=input comment="All My IP" in-interface-list=Internet \
    src-address-list="All My IP"
add action=accept chain=forward comment="All My IP" in-interface-list=\
    Internet src-address-list="All My IP"
add action=accept chain=forward comment=BPM dst-port=\
    48687,48689,48688,48690,3389 in-interface-list=Internet protocol=tcp \
    src-address-list=BPM
add action=accept chain=forward comment=BPM-SIP disabled=yes dst-port=\
    5001,5060,5061,5090,9000-20000 in-interface-list=Internet protocol=udp \
    src-address-list=SIP
add action=accept chain=forward comment=BPM-SIP disabled=yes dst-port=\
    5001,5060,5061,5090,9000-20000 in-interface-list=Internet protocol=tcp \
    src-address-list=SIP
add action=accept chain=forward comment="accept FGT" dst-address=37.0.29.152 \
    dst-port=10443 protocol=tcp
add action=accept chain=forward comment=Sharepoint dst-address=192.168.5.9 \
    dst-port=3389 in-interface-list=Internet protocol=tcp
add action=accept chain=forward comment=Sharepoint dst-address=192.168.5.10 \
    dst-port=3389 in-interface-list=Internet protocol=tcp
add action=drop chain=input comment="dropping port scanners" \
    in-interface-list=Internet src-address-list=port_scanners
add action=drop chain=forward comment="dropping port scanners" \
    in-interface-list=Internet src-address-list=port_scanners
add action=drop chain=forward comment=Drop-MAIL_bruteforcers \
    in-interface-list=Internet src-address-list=MAIL_bruteforcer_Manual
add action=drop chain=input comment="Drop DNS" dst-port=53 in-interface-list=\
    Internet protocol=udp
add action=drop chain=input comment="Drop DNS" dst-port=53 in-interface-list=\
    Internet protocol=tcp
add action=drop chain=input comment="drop ssh brute forcers" \
    in-interface-list=Internet src-address-list=ssh_blacklist
add action=jump chain=forward connection-state=new in-interface-list=Internet \
    jump-target=anti-DDoS
add action=jump chain=input connection-state=new in-interface-list=Internet \
    jump-target=anti-DDoS
add action=drop chain=forward connection-state=new src-address-list=BAN-DDoS
add action=return chain=anti-DDoS dst-limit=15,25,src-address/2s \
    in-interface-list=Internet
add action=add-src-to-address-list address-list=BAN-DDoS \
    address-list-timeout=1d chain=anti-DDoS
add action=add-dst-to-address-list address-list=connection-limit \
    address-list-timeout=1d chain=input comment=Connection_limit \
    connection-limit=200,32 in-interface-list=Internet protocol=tcp
add action=drop chain=input comment=Adr_list_connection-limit_drop \
    in-interface-list=Internet src-address-list=connection-limit
add action=add-src-to-address-list address-list=ssh_blacklist \
    address-list-timeout=3d chain=input connection-state=new dst-port=\
    22,23,8291,5323,5324,8292 in-interface-list=Internet protocol=tcp \
    src-address-list=ssh_stage3
add action=add-src-to-address-list address-list=ssh_stage3 \
    address-list-timeout=30m chain=input connection-state=new dst-port=\
    22,23,8291,5323,5324,8292 in-interface-list=Internet protocol=tcp \
    src-address-list=ssh_stage2
add action=add-src-to-address-list address-list=ssh_stage2 \
    address-list-timeout=30m chain=input connection-state=new dst-port=\
    22,23,8291,5323,5324,8292 in-interface-list=Internet protocol=tcp \
    src-address-list=ssh_stage1
add action=add-src-to-address-list address-list=ssh_stage1 \
    address-list-timeout=30m chain=input connection-state=new dst-port=\
    22,23,8291,5323,5324,8292 in-interface-list=Internet protocol=tcp
add action=accept chain=input comment="Accept ansible" dst-port=22 protocol=\
    tcp src-address=192.168.5.144
add action=accept chain=input comment=Accept_Winbox_Ssh dst-port=8291,8292 \
    in-interface-list=Internet protocol=tcp
add action=jump chain=forward comment=check-MAIL_bruteforce connection-state=\
    new disabled=yes dst-port=25,465,443 in-interface-list=Internet \
    jump-target=check-MAIL_bruteforce protocol=tcp
add action=jump chain=check-MAIL_bruteforce disabled=yes jump-target=\
    Block-MAIL_bruteforce src-address-list=MAIL_bruteforce-stage-9
add action=log chain=Block-MAIL_bruteforce disabled=yes log=yes log-prefix=\
    "Block email IP" src-address-list=!MAIL_bruteforcer
add action=add-src-to-address-list address-list=MAIL_bruteforcer \
    address-list-timeout=30m chain=Block-MAIL_bruteforce disabled=yes \
    src-address-list=MAIL_bruteforce-stage-9
add action=add-src-to-address-list address-list=MAIL_bruteforce-stage-9 \
    address-list-timeout=20s chain=check-MAIL_bruteforce disabled=yes \
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
add action=accept chain=forward comment=Mail_Accept dst-port=25,465,443 \
    in-interface-list=Internet protocol=tcp
add action=accept chain=input comment="accept GRE" in-interface-list=Internet \
    protocol=gre
add action=accept chain=input comment="Allow L2TP" dst-port=1701 \
    in-interface-list=Internet protocol=tcp
add action=accept chain=input comment="Allow L2TP" dst-port=1701 \
    in-interface-list=Internet protocol=udp
add action=accept chain=input dst-port=500 in-interface-list=Internet \
    protocol=udp
add action=accept chain=input dst-port=4500 in-interface-list=Internet \
    protocol=udp
add action=accept chain=input comment="accept Cloudflare" port=443 protocol=\
    tcp src-address-list=Clowdflare
add action=accept chain=forward comment="accept Cloudflare" port=443 \
    protocol=tcp src-address-list=Clowdflare
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="Port scanners to list" \
    in-interface-list=Internet protocol=tcp psd=21,5s,3,1
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="NMAP FIN Stealth scan" \
    in-interface-list=Internet protocol=tcp tcp-flags=\
    fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="SYN/FIN scan" \
    in-interface-list=Internet protocol=tcp tcp-flags=fin,syn
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="SYN/RST scan" \
    in-interface-list=Internet protocol=tcp tcp-flags=syn,rst
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="FIN/PSH/URG scan" \
    in-interface-list=Internet protocol=tcp tcp-flags=\
    fin,psh,urg,!syn,!rst,!ack
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="ALL/ALL scan" \
    in-interface-list=Internet protocol=tcp tcp-flags=fin,syn,rst,psh,ack,urg
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=2w chain=input comment="NMAP NULL scan" \
    in-interface-list=Internet protocol=tcp tcp-flags=\
    !fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=input comment="Drop everything else" in-interface-list=\
    Internet
add action=drop chain=forward comment="Drop everything else" \
    connection-state=new in-interface-list=Internet log=yes
add action=accept chain=forward comment="Allow FGT" dst-port=6443,6444 \
    in-interface-list=Internet protocol=tcp
add action=drop chain=forward disabled=yes out-interface=Levira src-address=\
    192.168.5.101
/ip firewall mangle
add action=mark-connection chain=input disabled=yes dst-address=37.0.29.146 \
    new-connection-mark=levira_146 passthrough=yes src-address=195.151.167.65
add action=mark-connection chain=input disabled=yes dst-address=37.0.29.146 \
    new-connection-mark=levira_146 passthrough=yes src-address=178.176.12.105
add action=mark-connection chain=prerouting connection-state=new dst-address=\
    37.0.29.152 dst-port=25,465,443 in-interface=Levira new-connection-mark=\
    "IN-37.0.29.152-port 25,465,443" passthrough=no protocol=tcp
add action=mark-connection chain=prerouting connection-state=new dst-address=\
    192.168.4.2 in-interface=to_M7_VPN new-connection-mark=\
    IN-Selectell-Out-192.168.4.2 passthrough=no
add action=mark-connection chain=prerouting connection-state=new dst-address=\
    192.168.4.2 in-interface=to_M7_VPN new-connection-mark=\
    IN-Orange-Out-192.168.4.2 passthrough=no
add action=accept chain=prerouting connection-mark=\
    "IN-37.0.29.152-port 25,465,443" dst-address-list=!LocalNetAddress
add action=accept chain=prerouting comment="\FD\F2\EE \E4\EB\FF \C6\FB\F0\FB" \
    dst-address-list=!LocalNetAddress src-address-list=Internet-to-Levira
add action=accept chain=prerouting dst-address-list=!LocalNetAddress \
    src-address-list=out_to_37.0.29.153
add action=accept chain=prerouting dst-address-list=!LocalNetAddress \
    src-address-list=out_to_37.0.29.152
add action=accept chain=prerouting dst-address-list=!LocalNetAddress \
    src-address-list=out_to_37.0.29.146
add action=mark-routing chain=output connection-mark=levira_146 disabled=yes \
    new-routing-mark=out_levira_146 passthrough=yes
add action=mark-routing chain=prerouting connection-mark=\
    IN-Orange-Out-192.168.4.2 dst-address-list=!LocalNetAddress \
    new-routing-mark=to-Moscow-Orange passthrough=no src-address=192.168.4.2
add action=mark-routing chain=prerouting dst-address-list=!LocalNetAddress \
    new-routing-mark=to-Moscow-Orange passthrough=no src-address-list=\
    out_to_MoscowOrange
add action=mark-routing chain=prerouting dst-address-list=!LocalNetAddress \
    new-routing-mark=to-Moscow-Selectel passthrough=no src-address=\
    192.168.4.0/23
/ip firewall nat
add action=src-nat chain=srcnat out-interface-list=Internet src-address-list=\
    out_to_37.0.29.152 to-addresses=37.0.29.152
add action=src-nat chain=srcnat out-interface-list=Internet src-address-list=\
    out_to_37.0.29.153 to-addresses=37.0.29.153
add action=src-nat chain=srcnat out-interface-list=Internet src-address-list=\
    out_to_37.0.29.146 to-addresses=37.0.29.146
add action=src-nat chain=srcnat connection-mark=\
    "IN-37.0.29.152-port 25,465,443" out-interface-list=Internet \
    to-addresses=37.0.29.152
add action=masquerade chain=srcnat out-interface-list=Internet \
    src-address-list=Internet-to-Levira
add action=dst-nat chain=dstnat comment="152 ==> HTTPS fgt" dst-address=\
    37.0.29.152 dst-port=6443 in-interface=Levira protocol=tcp to-addresses=\
    192.168.5.80 to-ports=443
add action=dst-nat chain=dstnat comment="152 ==> SSL fgt" dst-address=\
    37.0.29.152 dst-port=6444 in-interface=Levira protocol=tcp to-addresses=\
    192.168.5.80 to-ports=10443
add action=dst-nat chain=dstnat comment=mail.opti-com.ru dst-address=\
    37.0.29.152 dst-port=25,465,443 in-interface=Levira protocol=tcp \
    to-addresses=192.168.4.2
add action=dst-nat chain=dstnat comment=FortiGate dst-address=37.0.29.152 \
    dst-port=500,4500 protocol=udp to-addresses=192.168.5.80
add action=dst-nat chain=dstnat comment=Jira dst-address=37.0.29.153 \
    dst-port=8080,5228,5229,5230,2195,5223,2196 protocol=tcp src-address=\
    46.36.216.112 to-addresses=192.168.5.7
add action=dst-nat chain=dstnat comment=Cloudflare dst-address=37.0.29.153 \
    port=443 protocol=tcp src-address-list=Clowdflare to-addresses=\
    192.168.5.7
add action=dst-nat chain=dstnat comment=Confluence disabled=yes dst-address=\
    37.0.29.153 dst-port=8090 protocol=tcp src-address=46.36.216.112 \
    to-addresses=192.168.5.5
add action=dst-nat chain=dstnat comment=Vadim dst-address=37.0.29.146 \
    dst-port=4369,5672,61613,15672,25672,10080,35197 protocol=tcp \
    src-address=136.243.22.158 to-addresses=192.168.4.27
add action=dst-nat chain=dstnat comment=TomaHawk dst-address=37.0.29.146 \
    dst-port=63777 protocol=tcp src-address=136.243.22.158 to-addresses=\
    192.168.4.18 to-ports=80
add action=dst-nat chain=dstnat comment=himinbjerg.opti-com.ru dst-address=\
    37.0.29.146 dst-port=443 in-interface=Levira protocol=tcp to-addresses=\
    192.168.5.130 to-ports=443
add action=dst-nat chain=dstnat comment="Bifrost test portal" dst-address=\
    37.0.29.146 dst-port=9443 protocol=tcp to-addresses=192.168.5.113 \
    to-ports=443
add action=dst-nat chain=dstnat comment=BPM dst-address=37.0.29.146 dst-port=\
    48687 protocol=tcp src-address-list=BPM to-addresses=192.168.4.137 \
    to-ports=3389
add action=dst-nat chain=dstnat comment=BPM dst-address=37.0.29.146 dst-port=\
    48690 protocol=tcp src-address-list=BPM to-addresses=192.168.4.112 \
    to-ports=3389
add action=dst-nat chain=dstnat comment=BPM dst-address=37.0.29.146 dst-port=\
    48691 protocol=tcp src-address-list=BPM to-addresses=192.168.5.104 \
    to-ports=3389
add action=dst-nat chain=dstnat comment=BPM dst-address=37.0.29.146 dst-port=\
    48688 protocol=tcp src-address-list=BPM to-addresses=192.168.4.138 \
    to-ports=3389
add action=dst-nat chain=dstnat comment="bpm > 3cx-st:3389" dst-address=\
    37.0.29.146 dst-port=48689 protocol=tcp src-address-list=BPM \
    to-addresses=192.168.5.101 to-ports=3389
add action=dst-nat chain=dstnat comment=BPM-SIP disabled=yes dst-address=\
    37.0.29.146 dst-port=5001,5060,5061,5090,9000-20000 protocol=udp \
    src-address-list=SIP to-addresses=192.168.5.101
add action=dst-nat chain=dstnat comment=BPM-SIP disabled=yes dst-address=\
    37.0.29.146 dst-port=5001,5060,5061,5090,9000-20000 protocol=tcp \
    src-address-list=SIP to-addresses=192.168.5.101
add action=dst-nat chain=dstnat comment=Sharepoint dst-address=37.0.29.146 \
    dst-port=32590 protocol=tcp to-addresses=192.168.5.9 to-ports=3389
add action=dst-nat chain=dstnat comment=Sharepoint dst-address=37.0.29.146 \
    dst-port=32510 protocol=tcp to-addresses=192.168.5.10 to-ports=3389
add action=dst-nat chain=dstnat dst-port=8292 protocol=tcp to-addresses=\
    10.10.10.2 to-ports=8291
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
/ip ipsec identity
add disabled=yes peer=DiapazonMegafon secret=Opti-VPN7556009
add disabled=yes peer=DiapazonOrange secret=Opti-VPN7556009
add disabled=yes peer=Baltika9_TTK secret=Opti-VPN7556009
add disabled=yes peer=Nahabino-Mosline secret=Opti-VPN7556009
add disabled=yes peer=Remzona secret=Opti-VPN7556009
add disabled=yes peer=BumUpack-Podolsk secret=Opti-VPN7556009
add disabled=yes peer=M7-Rackstore secret=Opti-VPN7556009
add disabled=yes peer=Ezevika secret=Opti-VPN7556009
add disabled=yes peer=Baltika9-R_Telecom secret=Opti-VPN7556009
add disabled=yes peer=HPL-ER-Telecom secret=Opti-VPN7556009
add disabled=yes peer=Ligovka-WestKall secret=Opti-VPN7556009
add disabled=yes peer=Ligovka-Unis secret=Opti-VPN7556009
add disabled=yes peer=LigovkaRoznica-Sokoltseva secret=Opti-VPN7556009
add disabled=yes peer=Nahabino-Fortex secret=Opti-VPN7556009
add disabled=yes peer=Sokolceva2 secret=Opti-VPN7556009
/ip ipsec policy
add disabled=yes peer=DiapazonMegafon proposal=MyProp
add disabled=yes peer=DiapazonOrange proposal=MyProp
add disabled=yes peer=Baltika9_TTK proposal=MyProp
add disabled=yes peer=Nahabino-Mosline proposal=MyProp
add disabled=yes peer=Remzona proposal=MyProp
add disabled=yes peer=BumUpack-Podolsk proposal=MyProp
add disabled=yes peer=M7-Rackstore proposal=MyProp
add disabled=yes peer=Ezevika proposal=MyProp
add disabled=yes peer=Baltika9-R_Telecom proposal=MyProp
add disabled=yes peer=HPL-ER-Telecom proposal=MyProp
add disabled=yes peer=Ligovka-WestKall proposal=MyProp
add disabled=yes peer=Ligovka-Unis proposal=MyProp
add disabled=yes peer=LigovkaRoznica-Sokoltseva proposal=MyProp
add disabled=yes peer=Nahabino-Fortex proposal=MyProp
add disabled=yes peer=Sokolceva2 proposal=MyProp
/ip route
add distance=1 gateway=10.254.1.2 routing-mark=to-Moscow-Selectel
add distance=1 gateway=Levira routing-mark=out_levira_146
add disabled=yes distance=1 gateway=37.0.29.145 routing-mark=out_levira_146
add disabled=yes distance=1 gateway=*3A routing-mark=to-Moscow-Orange
add distance=1 gateway=37.0.29.145
add check-gateway=ping distance=250 gateway=10.10.10.1
add distance=2 dst-address=192.168.187.0/24 gateway=to_SPB_Samsa_WestCall
add distance=2 dst-address=192.168.188.0/24 gateway=to_SPB_Samsa_WestCall
add comment="Digi keys" distance=110 dst-address=192.168.252.0/28 gateway=\
    lic-edge scope=20
/ip service
set telnet address=192.168.4.18/32
set ftp address=10.10.10.0/29
set www disabled=yes
set ssh address=192.168.20.0/23,192.168.5.144/32
set api disabled=yes
set api-ssl disabled=yes
/ip ssh
set allow-none-crypto=yes forwarding-enabled=remote
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
add name=P.Yakushin password=P.Yakushin_7556009 profile=ServiceVPN service=\
    l2tp
add name=Pasha_Home password=Pasha_Home_7556009 profile=ServiceVPN service=\
    l2tp
add local-address=10.0.10.126 name=Mikrotik_Moscow_Office_New password=\
    Mikrotik_Moscow_Office_New_7556009 remote-address=10.0.10.127 service=\
    l2tp
add local-address=10.0.10.114 name=Mikrotik_Moscow_M7 password=\
    Mikrotik_Moscow_M7_7556009 remote-address=10.0.10.115 service=l2tp
add local-address=10.254.0.254 name=M7_Datacenter password=\
    M7_Datacenter_7556009 profile=EncryptYes remote-address=10.254.0.253 \
    service=l2tp
add local-address=10.254.0.1 name=Mikrotik_Moscow_Selectell password=\
    Mikrotik_Moscow_Selectell_7556009 profile=EncryptYes remote-address=\
    10.254.0.2 service=l2tp
add local-address=10.0.10.134 name=Origamo_Office password=\
    Origamo_Mikrotik_Office_7556009 remote-address=10.0.10.135 service=l2tp
add local-address=10.254.1.58 name=lic-edge password=n!pus@j@d01yuh@kef!h24 \
    remote-address=10.254.1.57 service=l2tp
add local-address=10.254.0.205 name=test password=test-7556009 \
    remote-address=10.254.0.206 service=l2tp
add local-address=10.254.1.173 name=NBN_Padik password=Opti7556009 \
    remote-address=10.254.1.174 service=l2tp
/radius
add address=192.168.5.20 secret=2013Gbnth09 service=ppp src-address=\
    192.168.4.1 timeout=1s
/routing filter
add action=accept chain=ospf-out prefix=192.168.4.0/23
add action=accept chain=ospf-out prefix=192.168.2.0/24
add action=accept chain=ospf-out prefix=192.168.25.128/26
add action=accept chain=ospf-out prefix=10.73.0.0/16
add action=accept chain=ospf-out disabled=yes prefix=192.168.252.0/28
add action=discard chain=ospf-out prefix=37.0.30.136/29
add action=discard chain=ospf-out
/routing ospf interface
add cost=5 interface=to_SCH_BiSv network-type=point-to-point
add cost=15 interface=to_SCH_DagoTel network-type=point-to-point
add cost=15 interface=to_MSK_Megafon network-type=point-to-point
add cost=5 interface=to_MSK_Orange network-type=point-to-point
add interface=to_IP_Shelistov network-type=point-to-point
add interface=to_Vkusno network-type=point-to-point
add interface=to_Ezhevika network-type=point-to-point
add interface=to_HPL network-type=point-to-point
add interface=to_M9_ATS network-type=point-to-point
add interface=to_IP_Sokoltceva1 network-type=point-to-point
add interface=to_M7_VPN network-type=point-to-point
add cost=5 interface=to_NBN_Fortex network-type=point-to-point
add cost=15 interface=to_NBN_Mosline network-type=point-to-point
add interface=to_PUP2 network-type=point-to-point
add interface=to_IP_Sokoltceva2 network-type=point-to-point
add cost=35 interface=to_NN_Beeline network-type=point-to-point
add cost=30 interface=to_NN_DomRu network-type=point-to-point
add cost=15 interface=to_SPB_Kuz_TTK network-type=point-to-point
add cost=5 interface=to_SPB_Kuz_WestCall network-type=point-to-point
add cost=15 interface=to_SAM_Avantel network-type=point-to-point
add cost=5 interface=to_SAM_MTS network-type=point-to-point
add interface=to_Uniroll network-type=point-to-point
add interface=to_VolgaUpack network-type=point-to-point
add interface=to_SB-Service_Remzona network-type=point-to-point
add interface=to_MBM-Roll network-type=point-to-point
add cost=5 interface=to_SPB_Samsa_WestCall network-type=point-to-point
add cost=15 interface=to_SPB_Samsa_Severen network-type=point-to-point
add interface=management network-type=point-to-point
add cost=5 interface=to_NBN_PDK_Mastertel network-type=point-to-point
/routing ospf network
add area=backbone network=10.254.0.240/30
add area=backbone network=192.168.25.128/26
add area=backbone network=10.254.1.68/30
add area=backbone network=10.254.1.104/30
add area=backbone network=10.254.1.56/30
add area=backbone network=192.168.252.0/28
add area=backbone network=10.254.1.76/30
add area=backbone network=172.16.50.0/24
add area=backbone network=10.254.1.72/30
add area=backbone network=10.254.1.4/30
add area=backbone network=10.254.1.80/30
add area=backbone network=10.254.1.0/30
add area=backbone network=10.254.1.8/30
add area=backbone network=10.254.1.12/30
add area=backbone network=10.254.1.16/30
add area=backbone network=10.254.1.20/30
add area=backbone network=10.254.1.24/30
add area=backbone network=10.254.1.28/30
add area=backbone network=10.254.1.32/30
add area=backbone network=10.254.1.36/30
add area=backbone network=10.254.1.40/30
add area=backbone network=10.254.1.44/30
add area=backbone network=10.254.1.60/30
add area=backbone network=10.254.1.64/30
add area=backbone network=10.254.1.84/30
add area=backbone network=10.254.1.88/30
add area=backbone network=10.254.1.92/30
add area=backbone network=10.254.1.96/30
add area=backbone network=10.254.1.100/30
add area=backbone network=10.254.1.108/30
add area=backbone network=10.254.1.112/30
add area=backbone network=10.254.1.116/30
add area=backbone network=10.254.1.172/30
add area=backbone network=10.254.1.168/30
add area=backbone network=10.73.0.0/16
/snmp
set enabled=yes location=DC trap-community=pavlik trap-interfaces=Lan2x \
    trap-version=3
/system clock
set time-zone-name=Europe/Tallinn
/system identity
set name=DC_Master
/system logging
set 3 action=disk
add disabled=yes topics=l2tp
add action=remote disabled=yes prefix=Mikrotik_DC topics=account
add disabled=yes topics=ospf
add disabled=yes topics=radius
add disabled=yes topics=critical
add action=gremote topics=info,error,route,dhcp,critical
add disabled=yes prefix=IPSEC__ topics=ipsec
/system ntp client
set enabled=yes primary-ntp=195.3.254.2
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
    export compact file=\"config_full.rsc\"\r\
    \n:delay 1s;\r\
    \n:local ts \"\r\
    \n/user set admin password=Cfyrn-Gtnth,ehu-9914sexsex \\r\\\r\
    \n\\n/import config_full.rsc\\r\\\r\
    \n\\n/ip address disable [find comment=\\\"Master-VRRP\\\"] \\r\\\r\
    \n\\n/ip address enable [find comment=\\\"Slave-VRRP\\\"] \\r\\\r\
    \n\\n/ip address disable [find comment=\\\"VRRP-Levira-Master\\\"] \\r\\\r\
    \n\\n/ip address enable [find comment=\\\"VRRP-Levira-Slave\\\"] \\r\\\r\
    \n\\n/ip address disable [find comment=\\\"Lan2x-VRRP-Master\\\"] \\r\\\r\
    \n\\n/ip address enable [find comment=\\\"Lan2x-VRRP-Slave\\\"] \\r\\\r\
    \n\\n/interface vrrp set priority=100 [find name=\\\"Local_VRRP\\\"] \\r\\\
    \r\
    \n\\n/interface vrrp set priority=100 [find name=\\\"Levira\\\"] \\r\\\r\
    \n\\n/interface vrrp set priority=100 [find name=\\\"Lan2x\\\"] \\r\\\r\
    \n\\n/ip address disable [find comment=\\\"Master\\\"] \\r\\\r\
    \n\\n/ip address enable [find comment=\\\"Slave\\\"] \\r\\\r\
    \n\\n/system scheduler enable [find name=Reset] \\r\\\r\
    \n\\n/system scheduler disable [find name=BackupConfig] \\r\\\r\
    \n\\n/system scheduler disable [find name=fullDWeeklyBackup] \\r\\\r\
    \n\\n/system identity set name=DC_Slave\\r\\\r\
    \n\\n/file remove start_new \\r\\\r\
    \n\\n/file remove config_full.rsc\"\r\
    \n/file print file=start.txt\r\
    \n:delay 3s;\r\
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
    \n/file remove start.txt;"
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
set address=192.168.4.2 from=mikrotik@opti-com.ru password=5e76a8Ts55 \
    start-tls=yes user=mikrotik
/tool mac-server
set allowed-interface-list=discover
/tool mac-server mac-winbox
set allowed-interface-list=discover
/tool mac-server ping
set enabled=no
/tool netwatch
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Ligovka-Unis i\
    s DOWN\" body=\"L2tp_Ligovka-Unis is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.153 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Ligovka-Unis i\
    s UP\" body=\"L2tp_Ligovka-Unis is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Baltika9-R_Tel\
    ecom is DOWN\" body=\"L2tp_Baltika9-R_Telecom is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.221 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Baltika9-R_Tel\
    ecom is UP\" body=\"L2tp_Baltika9-R_Telecom is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_BumUpack-Origa\
    mo is DOWN\" body=\"L2tp_BumUpack-Origamo is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.105 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_BumUpack-Origa\
    mo is UP\" body=\"L2tp_BumUpack-Origamo is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Ezevika-Fortex\
    \_is DOWN\" body=\"L2tp_Ezevika-Fortex is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.249 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Ezevika-Fortex\
    \_is UP\" body=\"L2tp_Ezevika-Fortex is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_HPL-ER-Telecom\
    \_is DOWN\" body=\"L2tp_HPL-ER-Telecom is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.129 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_HPL-ER-Telecom\
    \_is UP\" body=\"L2tp_HPL-ER-Telecom is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Ligovka-WestKa\
    ll is DOWN\" body=\"L2tp_Ligovka-WestKall is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.157 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Ligovka-WestKa\
    ll is UP\" body=\"L2tp_Ligovka-WestKall is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Ligovka-WestKa\
    ll is DOWN\" body=\"L2tp_Ligovka-WestKall is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.237 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Ligovka-WestKa\
    ll is UP\" body=\"L2tp_Ligovka-WestKall is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_M7_to_DC is DO\
    WN\" body=\"L2tp_M7_to_DC is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.253 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_M7_to_DC is UP\
    \" body=\"L2tp_M7_to_DC is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Moscow_Diapazo\
    n-Megafon is DOWN\" body=\"L2tp_Moscow_Diapazon-Megafon is DOWN at \$TimeP\
    lus\";\r\
    \n" host=10.254.0.209 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Moscow_Diapazo\
    n-Megafon is UP\" body=\"L2tp_Moscow_Diapazon-Megafon is UP at \$TimePlus\
    \";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Moscow_Diapazo\
    n-Orange is DOWN\" body=\"L2tp_Moscow_Diapazon-Orange is DOWN at \$TimePlu\
    s\";\r\
    \n" host=10.254.0.205 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Moscow_Diapazo\
    n-Orange is UP\" body=\"L2tp_Moscow_Diapazon-Orange is UP at \$TimePlus\";\
    "
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Selectell_to_D\
    C is DOWN\" body=\"L2tp_Selectell_to_DC is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.2 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Selectell_to_D\
    C is UP\" body=\"L2tp_Selectell_to_DC is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_NN-Beeline is \
    DOWN\" body=\"L2tp_NN-Beeline is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.189 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_NN-Beeline is \
    UP\" body=\"L2tp_NN-Beeline is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_NN-DomRu is DO\
    WN\" body=\"L2tp_NN-DomRu is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.185 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_NN-DomRu is UP\
    \" body=\"L2tp_NN-DomRu is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Nahabino-Forte\
    x is DOWN\" body=\"L2tp_Nahabino-Fortex is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.137 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Nahabino-Forte\
    x is UP\" body=\"L2tp_Nahabino-Fortex is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Nahabino-Mosli\
    ne is DOWN\" body=\"L2tp_Nahabino-Mosline is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.141 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Nahabino-Mosli\
    ne is UP\" body=\"L2tp_Nahabino-Mosline is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Remzona is DOW\
    N\" body=\"L2tp_Remzona is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.85 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Remzona is UP\
    \" body=\"L2tp_Remzona is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Samara-Avantel\
    \_is DOWN\" body=\"L2tp_Samara-Avantel is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.169 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Samara-Avantel\
    \_is UP\" body=\"L2tp_Samara-Avantel is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Samara-MTS is \
    DOWN\" body=\"L2tp_Samara-MTS is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.173 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Samara-MTS is \
    UP\" body=\"L2tp_Samara-MTS is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Sun-City is DO\
    WN\" body=\"L2tp_Sun-City is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.113 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Sun-City is UP\
    \" body=\"L2tp_Sun-City is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_UniRoll-COMCOR\
    \_is DOWN\" body=\"L2tp_UniRoll-COMCOR is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.245 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_UniRoll-COMCOR\
    \_is UP\" body=\"L2tp_UniRoll-COMCOR is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Unipacking-MTS\
    \_is DOWN\" body=\"L2tp_Unipacking-MTS is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.241 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Unipacking-MTS\
    \_is UP\" body=\"L2tp_Unipacking-MTS is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Vkusno-Fortex \
    is DOWN\" body=\"L2tp_Vkusno-Fortex is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.229 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Vkusno-Fortex \
    is UP\" body=\"L2tp_Vkusno-Fortex is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_VolgaUpack is \
    DOWN\" body=\"L2tp_VolgaUpack is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.201 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_VolgaUpack is \
    UP\" body=\"L2tp_VolgaUpack is UP at \$TimePlus\";"
add disabled=yes down-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Baltika 9 TTK \
    is DOWN\" body=\"L2tp_Baltika 9 TTK is DOWN at \$TimePlus\";\r\
    \n" host=10.254.0.65 up-script=":local Mysymbol \":\";\r\
    \n:local MyTime1 ([:pick [/system clock get time] 0 2]);\r\
    \n:local MyTime2 [:pick [/system clock get time] 3 8];\r\
    \n:if (\$MyTime1=\"24\")  do={ :set MyTime1 \"00\";};\r\
    \n:local TimePlus  [:totime (\$MyTime1.\$Mysymbol.\$MyTime2)];\r\
    \n:log info \$TimePlus;\r\
    \n/tool e-mail send to=\"alert@opti-com.ru\" subject=\"L2tp_Baltika 9 TTK \
    is UP\" body=\"L2tp_Baltika 9 TTK is UP at \$TimePlus\";"
