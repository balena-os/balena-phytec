UBOOT_KCONFIG_SUPPORT = "1"

inherit ${@'resin-u-boot' if 'k3' in set(d.getVar('MACHINEOVERRIDES').split(':')) else ''}

FILESEXTRAPATHS:prepend:k3 := "${THISDIR}/files:"

SRC_URI:append:k3 = " \
    file://balenaos_bootcommand.cfg \
    file://0001-Integrate-with-Balena-u-boot-environment.patch \
"
