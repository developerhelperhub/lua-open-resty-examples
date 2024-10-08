FROM developerhelperhub/openresty-lua1.5

COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY src/ /usr/local/openresty/nginx/myapp

EXPOSE 8080

ENTRYPOINT ["openresty", "-g", "daemon off;"]