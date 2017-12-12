FROM starlabio/ubuntu-base:1.0
MAINTAINER Will Abele <will.abele@starlab.io>

# Get bc for building the Linux Kernel.

RUN apt-get update && \
    apt-get --quiet --yes install bc && \
        apt-get autoremove -y && \
        apt-get clean && \
rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
# Grab the linaro tool chain we want
RUN mkdir -p /opt/linaro/aarch64

RUN cd /opt/linaro/aarch64 && wget --quiet --output-document linaro-cross.tar.xz https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/aarch64-linux-gnu/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-linux-gnu.tar.xz && tar xf linaro-cross.tar.xz --strip-components=1 && rm linaro-cross.tar.xz

env PATH /opt/linaro/aarch64/bin:$PATH
