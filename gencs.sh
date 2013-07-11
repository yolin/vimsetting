#!/bin/bash
if [ "$1" = "" ]; then
    genfolder="/ISD2/ATHEROS_APPS /ISD2/BELKIN_APPS /ISD2/COMMON_APPS /ISD2/configs /ISD2/crosslibs /ISD2/DLINK_APPS /ISD2/extras /ISD2/IODATA_APPS /ISD2/KCODES_APPS /ISD2/MIPS32 /ISD2/MIPS32_APPS /ISD2/MIPS32_KNLAPPS /ISD2/NETCOMM_APPS /ISD2/others /ISD2/RALINK_KNL /ISD2/RT_APPS /ISD2/RTL_APPS /ISD2/SAMPLES /ISD2/scripts /ISD2/SILEX_APPS /ISD2/SITECOM_APPS /ISD2/SYSTEM_KNLAPPS /ISD2/TARGET_RAMDISK /ISD2/TR_APPS /ISD2/UBICOM /ISD2/UBICOM_APPS /ISD2/util /ISD2/vendors /ISD2/VOIP_APPS /ISD2/WEB_APPS
/ISD2/ZYXEL_APPS"
else
    genfolder="$*"
fi

exgentype='-name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.htm" -o -name "*.html" -o -name "*.js" -o -name "Makefile.*" -o -name "Makefile" -o -name "*.make"'

for d in $genfolder
do
    mkdir -p /CSCOPE/$d
    echo "find $d -type f $exgentype > /CSCOPE/$d/cscope.files && cscope -bkq -i /CSCOPE/$d/cscope.files -f /CSCOPE/$d/cscope.out"
done