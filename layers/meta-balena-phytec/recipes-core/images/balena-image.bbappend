require balena-image.inc

IMAGE_ROOTFS_SIZE = "${@disk_aligned(d,1024*1024)}"

BALENA_STATE_SIZE_phyboard-lyra-am62xx-2 = "20480"
