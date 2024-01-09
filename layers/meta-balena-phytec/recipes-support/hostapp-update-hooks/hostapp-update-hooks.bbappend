FILESEXTRAPATHS:append := ":${THISDIR}/files"

HOSTAPP_HOOKS += " 99-resin-uboot"

HOSTAPP_HOOKS:append:phyboard-lyra-am62xx-2 = " \
    99-flash-bootloader-am62xx \
"
