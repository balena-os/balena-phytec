UBOOT_KCONFIG_SUPPORT = "1"

inherit ${@'resin-u-boot' if 'k3' in set(d.getVar('MACHINEOVERRIDES').split(':')) else ''}
