do_install:append:am62xx() {
    # Disable the systemd watchdog because systemd doesn't support the RTI-Windowed Watchdog Timer
    rm ${D}/${sysconfdir}/systemd/system.conf.d/watchdog.conf
}
