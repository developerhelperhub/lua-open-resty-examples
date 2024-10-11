FROM openresty/openresty:1.21.4.1-0-alpine

RUN apk add --no-cache \
        build-base \
        curl \
        git \
        wget \
        readline-dev \
        lua5.1 lua5.1-dev \
        openssl-dev

WORKDIR /app

RUN wget https://luarocks.org/releases/luarocks-3.9.2.tar.gz \
    && tar zxpf luarocks-3.9.2.tar.gz \
    && cd luarocks-3.9.2 \
    && ./configure --lua-version=5.1 --with-lua-include=/usr/include \
    && make build \
    && make install \
    && luarocks --version \
    && cd /app \
    && rm -rf luarocks-3.9.2 luarocks-3.9.2.tar.gz


RUN luarocks install lua-resty-http \
    && luarocks install lua-resty-openssl \
    && luarocks install lua-resty-openidc

ENTRYPOINT /bin/sh