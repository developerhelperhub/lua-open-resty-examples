

Select the working directory of the project `resty-openid-keycloak-introspection`
```shell
cd resty-openid-keycloak-introspection

```

Find the ip address / network of containers
```shell
docker network ls
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' microservices-development-cluster-control-plane
docker inspect -f '{{.NetworkSettings.Networks}}' microservices-development-cluster-control-plane
docker inspect -f '{{.NetworkSettings.Networks}}' mygateway
```

Login inside the container of openresty with lua5.1, for testing the application inside container.  

```shell
docker rm mygateway
docker run -it --name mygateway -p 8080:8080 --entrypoint /bin/sh -v $(PWD)/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf -v $(PWD)/src:/usr/local/openresty/nginx/myapp  -v ${HOME}:/root/ -v ${PWD}:/app -w /app --network kind --link microservices-development-cluster-control-plane:keycloak.myapp.com --add-host keycloak.myapp.com:172.18.0.2  developerhelperhub/openresty-lua1.5

cat /etc/hosts

curl http://keycloak.myapp.com/realms/mes-application/.well-known/openid-configuration
curl http://host.docker.internal:8081/items


curl http://192.168.29.230:8081/items

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