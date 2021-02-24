# feb/15/1970 23:26:19 by RouterOS 6.48
# software id = GTQR-GGJH
#
# model = CRS326-24S+2Q+
# serial number = D84E0C6694DC
/interface bridge
add admin-mac=48:8F:5A:DC:22:6F auto-mac=no name=bridge vlan-filtering=yes
/interface ethernet
set [ find default-name=qsfpplus1-1 ] comment="to R3-NF05" l2mtu=1592
set [ find default-name=qsfpplus1-2 ] l2mtu=1592
set [ find default-name=qsfpplus1-3 ] l2mtu=1592
set [ find default-name=qsfpplus1-4 ] l2mtu=1592
set [ find default-name=qsfpplus2-1 ] disabled=yes l2mtu=1592
set [ find default-name=qsfpplus2-2 ] disabled=yes l2mtu=1592
set [ find default-name=qsfpplus2-3 ] disabled=yes l2mtu=1592
set [ find default-name=qsfpplus2-4 ] disabled=yes l2mtu=1592
set [ find default-name=sfp-sfpplus1 ] comment="r3-h001 nic1" l2mtu=1592
set [ find default-name=sfp-sfpplus2 ] comment="r3-h001 nic3" l2mtu=1592
set [ find default-name=sfp-sfpplus3 ] comment="r3-h002 nic1" l2mtu=1592
set [ find default-name=sfp-sfpplus4 ] comment="r3-h002 nic3" l2mtu=1592
set [ find default-name=sfp-sfpplus5 ] comment="r3-h003 nic1" l2mtu=1592
set [ find default-name=sfp-sfpplus6 ] comment="r3-h003 nic3" l2mtu=1592
set [ find default-name=sfp-sfpplus7 ] comment="r3-h004 nic1" l2mtu=1592
set [ find default-name=sfp-sfpplus8 ] comment="r3-h004 nic3" l2mtu=1592
set [ find default-name=sfp-sfpplus9 ] comment="r3-h005 nic1" l2mtu=1592
set [ find default-name=sfp-sfpplus10 ] comment="r3-h005 nic3" l2mtu=1592
set [ find default-name=sfp-sfpplus11 ] l2mtu=1592
set [ find default-name=sfp-sfpplus12 ] l2mtu=1592
set [ find default-name=sfp-sfpplus13 ] l2mtu=1592
set [ find default-name=sfp-sfpplus14 ] l2mtu=1592
set [ find default-name=sfp-sfpplus15 ] l2mtu=1592
set [ find default-name=sfp-sfpplus16 ] l2mtu=1592
set [ find default-name=sfp-sfpplus17 ] l2mtu=1592
set [ find default-name=sfp-sfpplus18 ] l2mtu=1592
set [ find default-name=sfp-sfpplus19 ] l2mtu=1592
set [ find default-name=sfp-sfpplus20 ] l2mtu=1592
set [ find default-name=sfp-sfpplus21 ] comment="to xe-3/1/0" l2mtu=10218 \
    mtu=9000
set [ find default-name=sfp-sfpplus22 ] comment="to xe-3/1/1" l2mtu=10218 \
    mtu=9000
set [ find default-name=sfp-sfpplus23 ] comment="to xe-3/1/2" l2mtu=10218 \
    mtu=9000
set [ find default-name=sfp-sfpplus24 ] l2mtu=1592
/interface bonding
add comment="Bond-VLAN 6,10,30 to ae2" mode=802.3ad name=bond-juniper slaves=\
    sfp-sfpplus21,sfp-sfpplus22,sfp-sfpplus23
add comment="Bond-VLAN 20,40 to R3-NF05" mode=802.3ad name=bond-mikrotik \
    slaves=qsfpplus1-1,qsfpplus1-2,qsfpplus1-3,qsfpplus1-4
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridge comment=defconf interface=sfp-sfpplus1 pvid=6
add bridge=bridge comment=defconf interface=sfp-sfpplus2
add bridge=bridge comment=defconf interface=sfp-sfpplus3 pvid=6
add bridge=bridge comment=defconf interface=sfp-sfpplus4
add bridge=bridge comment=defconf interface=sfp-sfpplus5 pvid=6
add bridge=bridge comment=defconf interface=sfp-sfpplus6 pvid=40
add bridge=bridge comment=defconf interface=sfp-sfpplus7 pvid=6
add bridge=bridge comment=defconf interface=sfp-sfpplus8 pvid=40
add bridge=bridge comment=defconf interface=sfp-sfpplus9 pvid=6
add bridge=bridge comment=defconf interface=sfp-sfpplus10 pvid=40
add bridge=bridge comment=defconf interface=sfp-sfpplus11
add bridge=bridge comment=defconf interface=sfp-sfpplus12
add bridge=bridge comment=defconf interface=sfp-sfpplus13
add bridge=bridge comment=defconf interface=sfp-sfpplus14
add bridge=bridge comment=defconf interface=sfp-sfpplus15
add bridge=bridge comment=defconf interface=sfp-sfpplus16
add bridge=bridge comment=defconf interface=sfp-sfpplus17
add bridge=bridge comment=defconf interface=sfp-sfpplus18
add bridge=bridge comment=defconf interface=sfp-sfpplus19
add bridge=bridge comment=defconf interface=sfp-sfpplus20
add bridge=bridge interface=bond-juniper multicast-router=disabled
add bridge=bridge interface=bond-mikrotik multicast-router=disabled
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface bridge vlan
add bridge=bridge comment=iSCSI tagged="sfp-sfpplus5,sfp-sfpplus7,sfp-sfpplus9\
    ,bond-juniper,sfp-sfpplus1,sfp-sfpplus3" vlan-ids=10
add bridge=bridge comment=iSCSI tagged="sfp-sfpplus7,sfp-sfpplus9,sfp-sfpplus5\
    ,bond-juniper,sfp-sfpplus1,sfp-sfpplus3,bond-mikrotik" vlan-ids=30
add bridge=bridge comment=vMotion tagged=\
    sfp-sfpplus5,sfp-sfpplus7,sfp-sfpplus9,bond-mikrotik vlan-ids=20
add bridge=bridge comment=VM-Traffic tagged=bond-juniper untagged=\
    sfp-sfpplus1,sfp-sfpplus3,sfp-sfpplus5,sfp-sfpplus7,sfp-sfpplus9 \
    vlan-ids=6
add bridge=bridge comment=vSAN tagged=bond-mikrotik untagged=\
    sfp-sfpplus6,sfp-sfpplus8,sfp-sfpplus10 vlan-ids=40
/ip address
add address=10.73.4.16/24 interface=ether1 network=10.73.4.0
/ip route
add distance=2 gateway=10.73.4.1
/system identity
set name=R3-NF06
/system ntp client
set enabled=yes primary-ntp=185.189.12.50
/system routerboard settings
set boot-os=router-os
