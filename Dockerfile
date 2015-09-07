FROM debian:jessie

RUN apt-get -qq update \
    && apt-get -qqy install \
    automake \
    curl \
    gettext \
    libcurl3-dev \
    libssl-dev \
    libtool \
    libunwind8 \
    make \
    unzip \
    zlib1g \
    && curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh \
    \
    && curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | sudo tar zxfv - -C /usr/local/src \
    && cd /usr/local/src/libuv-1.4.2 \
    && sh autogen.sh \
    && ./configure \
    && make \
    && make install \
    && rm -rf /usr/local/src/libuv-1.4.2 && cd ~/ \
    && ldconfig
