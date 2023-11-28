require balena-image.inc

IMAGE_ROOTFS_SIZE = "${@disk_aligned(d,1024*1024)}"
