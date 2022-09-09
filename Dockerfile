FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y \
        gcc libusb-dev make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y wget \
    && wget -O /arm.tar.bz2 \
        https://developer.arm.com/-/media/Files/downloads/gnu-rm/5_4-2016q2/gccarmnoneeabi542016q220160622linuxtar.bz2?revision=8f445a99-c1ae-4ed8-9eb8-f41929a671c4?product=GNU%20Arm%20Embedded%20Toolchain,32-bit,,Linux,5-2016-q2-update \
    && tar xvf /arm.tar.bz2 -C / \
    && mv /gcc-arm-none-eabi-5_4-2016q2 arm \
    && rm /arm.tar.bz2 \
    && apt-get autoremove -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y libc6-i386 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y git \
    && git clone -b nanopb-0.4.4 https://github.com/nanopb/nanopb /opt/nanopb \
    && rm -rf /opt/nanopb/.git \
    && rm -rf /opt/nanopb/tests \
    && apt-get autoremove -y git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y \
        python3 python3-protobuf protobuf-compiler \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y wget \
    && wget -O /nrfjprog.tar.gz \
       https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/10-17-3/nrf-command-line-tools-10.17.3_Linux-amd64.tar.gz \
    && tar -zxvf /nrfjprog.tar.gz -C / \
    && mv /nrf-command-line-tools /nrfjprog \
    && rm /nrfjprog.tar.gz /README.txt \
    && apt-get autoremove -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN cd ~ \
    && apt-get update \
    && apt install -y \
       wget \
       openssl \
       libssl-dev \
       g++-multilib \
    && wget https://cmake.org/files/v3.20/cmake-3.20.0.tar.gz \
    && tar -xvzf cmake-3.20.0.tar.gz \
    && rm cmake-3.20.0.tar.gz \
    && cd cmake-3.20.0 \
    && ./bootstrap --prefix=/usr/local \
    && make \
    && make install \
    && apt-get autoremove -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN dpkg --unpack JLink_Linux_V766a_x86_64.deb
