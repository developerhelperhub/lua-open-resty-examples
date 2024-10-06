


```shell
# testing the config
openresty -t -p $(pwd) -c nginx.conf

# running in demon mode
openresty -p $(pwd) -c nginx.conf

# not running in demon mode
openresty -p $(pwd) -c nginx.conf -g daemon\ off\;
```

Step 3: Test the Setup
Open your web browser or use curl to access your Lua script:

```shell
curl http://localhost:8080/
```

You should see a response from the httpbin API.

check app running on port  8080
```shell
lsof -i :8080

COMMAND   PID    USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
nginx   90495 binoykr    6u  IPv4 0x718b25731f7195b9      0t0  TCP *:http-alt (LISTEN)
nginx   90496 binoykr    6u  IPv4 0x718b25731f7195b9      0t0  TCP *:http-alt (LISTEN)
```

Verify the nignx request log
```shell
tail -f /usr/local/var/log/nginx/access.log
```


Reference
https://github.com/nginx/nginx/blob/master/conf/mime.types