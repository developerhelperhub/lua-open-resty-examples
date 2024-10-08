

Select the working directory of the project `resty-routing-lua-config-docker`
```shell
cd resty-routing-lua-config-docker
```

Login inside the container of openresty with lua5.1, for testing the application inside container.  

```shell
docker run -it --name openresty-lua1.5 -p 8080:8080 --entrypoint /bin/sh -v ${HOME}:/root/ -v ${PWD}:/app -w /app developerhelperhub/openresty-lua1.5

cp nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
cp -r src/ /usr/local/openresty/nginx/myapp

openresty -g daemon\ off\;
```

Replace the ip address upstream service of your host system, 'src/content.lua' file, currently using mac
```shell
local upstreams = {
    item_service = "http://192.168.29.230:8081",
    order_service = "http://192.168.29.230:8082"
}
```

Find macOS Host IP Address: You can get your macOS host's IP address as described earlier, using one of the following commands:
```shell
ipconfig getifaddr en0  # For Wi-Fi
ipconfig getifaddr en1  # For Ethernet
```

Makesure the upstream services are running your local machine, which are item-service:8081 and order-service:8082

Following command used to test path route
```shell
curl --location 'http://localhost:8080/item-service/items'
curl --location 'http://localhost:8080/order-service/orders'
```