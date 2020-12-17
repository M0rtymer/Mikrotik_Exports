# nov/22/1970 15:35:05 by RouterOS 6.45.6
# software id = TDRD-HQ14
#
# model = CCR1009-7G-1C-1S+
# serial number = 914F0A66A09F
/interface l2tp-server
add name=DC-NN-Beeline user=DC-NN-Beeline
add name=DC-NN-DomRu user=DC-NN-DomRu
add name=M7-NN-Beeline user=M7-NN-Beeline
add name=M7-NN-DomRu user=M7-NN-DomRu
add name=Selectel-NN-Beeline user=Selectel-NN-Beeline
add name=Selectel-NN-DomRu user=Selectel-NN-DomRu
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
