FROM starlabio/ubuntu-base:1.0
MAINTAINER Derek Straka <derek@starlab.io>

# Grab the linaro tool chain we want
RUN mkdir -p /opt/linaro/aarch64

RUN cd /opt/linaro/aarch64 && wget --quiet --output-document linaro-cross.tar.xz https://releases.linaro.org/14.11/components/toolchain/binaries/aarch64-linux-gnu/gcc-linaro-4.9-2014.11-x86_64_aarch64-linux-gnu.tar.xz && tar xf linaro-cross.tar.xz --strip-components=1 && rm linaro-cross.tar.xz

env PATH /opt/linaro/aarch64/bin:$PATH
