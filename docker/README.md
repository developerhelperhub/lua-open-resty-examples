

Test Lua installation inside container

```shell
docker run -it --rm --net host --entrypoint /bin/sh --workdir /app openresty/openresty:1.21.4.1-0-alpine

apk add --no-cache \
    build-base \
    curl \
    git \
    wget \
    readline-dev \
    lua5.1 lua5.1-dev \
    openssl-dev


wget https://luarocks.org/releases/luarocks-3.9.2.tar.gz && \
    tar zxpf luarocks-3.9.2.tar.gz  && \
    cd luarocks-3.9.2 && \
    ./configure --lua-version=5.1 --with-lua-include=/usr/include && \
    make build && \
    make install && \
    luarocks --version && \
    cd /app && \
    rm -rf luarocks-3.9.2 luarocks-3.9.2.tar.gz


luarocks install luasec
luarocks install luasocket
luarocks install mobdebug
```


Check the current version of Alpine you're using:
cat /etc/alpine-release

Update the /etc/apk/repositories file with URLs for a supported version, for example, v3.18. You can use a text editor like vi or nano:
vi /etc/apk/repositories

Replace any outdated URLs (like v3.15) with URLs for the latest supported version. For example:
https://dl-cdn.alpinelinux.org/alpine/v3.18/main
https://dl-cdn.alpinelinux.org/alpine/v3.18/community


This installs OpenResty typically into /usr/local/openresty.
/usr/local/openresty



```shell
docker run -it --name openresty-lua1.5 -p 8080:8080 --entrypoint /bin/sh -v ${HOME}:/root/ -v ${PWD}:/app -w /app developerhelperhub/openresty-lua1.5

luarocks install lua-resty-http
luarocks install lua-resty-openssl

openresty -p $(pwd) -c nginx.conf -g daemon\ off\;
```

curl http://localhost:8080

docker exec -it openresty-lua1.5 /bin/sh


docker build -t developerhelperhub/openresty-lua1.5 .

docker run -it --name openresty-lua1.5 -p 8080:8080 --entrypoint /bin/sh -v ${HOME}:/root/ -v ${PWD}:/app -w /app developerhelperhub/openresty-lua1.5


cp nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
cp -r src/ /usr/local/openresty/nginx/myapp

openresty -g daemon\ off\;