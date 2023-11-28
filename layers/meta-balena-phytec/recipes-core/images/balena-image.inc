BALENA_BOOT_PARTITION_FILES:append:phyboard-lyra-am62xx-2 = " \
    ${SPL_BINARYNAME}: \
    u-boot.${UBOOT_SUFFIX}: \
    tiboot3.bin: \
    oftree: \
    ${@format_balena_boot_partition_files(d, make_dtb_boot_files(d))} \
"

BALENA_BOOT_SIZE="65535"


def format_balena_boot_partition_files(d, input):
    """Reformat file paths from IMAGE_BOOT_FILES to BALENA_BOOT_PARTITION_FILES style
        IMAGE_BOOT_FILES uses semicolons when the file has to be renamed.
        BALENA_BOOT_PARTITION_FILES uses colon for that and requires it even when not renaming.
    """
    files = input.split()
    result = []
    for file in files:
        if file.find(';') != -1:
            file[file.find(';')] = ':'
        else:
            file += ':'
        result.append(file)
    return ' '.join(result)
