FROM balenalib/intel-nuc-debian:buster-20210705

# Debian Buster is EOL: its packages were pulled from the live deb.debian.org/
# security.debian.org mirrors and only remain on archive.debian.org, whose
# Release files are also past their validity window. Point apt at the
# archive and skip the valid-until check so `apt-get update` still works.
RUN sed -i 's|deb.debian.org|archive.debian.org|g; s|security.debian.org|archive.debian.org|g' /etc/apt/sources.list \
	&& echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Install dependencies
RUN apt-get update && apt-get install -y curl wget build-essential libelf-dev bc flex libssl-dev bison gcc-arm-linux-gnueabi gcc-aarch64-linux-gnu python-minimal

# Fetch kernel module headers built and source
ADD example_module /usr/src/app/example_module_headers_src/
ADD kernel_modules_headers.tar.gz /usr/src/app/
WORKDIR /usr/src/app

# Workaround for a subtle issue in the linker path. Debian defaults to /lib64/ld-linux-x86-64.so.2 while balenaOS defaults to /lib/ld-linux-x86-64.so.2 for os/headers. Affects NUC.
RUN if [ -f /lib64/ld-linux-x86-64.so.2 ]; then \
	if [ ! -f /lib/ld-linux-x86-64.so.2 ]; then \
		ln -s /lib64/ld-linux-x86-64.so.2  /lib/ld-linux-x86-64.so.2 ; \
	fi; \
    fi;

ARG kernel_arch
ARG cross_compile_prefix
# Compile external hello module using header sources
RUN ARCH=${kernel_arch} CROSS_COMPILE=${cross_compile_prefix} make -C /usr/src/app/*/build modules_prepare
RUN ARCH=${kernel_arch} CROSS_COMPILE=${cross_compile_prefix} make -C /usr/src/app/*/build/ M=/usr/src/app/example_module_headers_src
