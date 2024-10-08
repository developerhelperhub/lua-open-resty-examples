My local Lua version is 
```shell
lua -v
Lua 5.4.7  Copyright (C) 1994-2024 Lua.org, PUC-Rio
```

Install dependencies
```shell
brew install luarocks
brew install openssl@1.1
```

List Lua plugins whihc are installed
```shell
luarocks list
```

Install the debug dependencies
```shell
luarocks --lua-version=5.1 install luasec OPENSSL_DIR=$(brew --prefix openssl@1.1) --local --force
luarocks --lua-version=5.1 install luasocket --local --force
luarocks --lua-version=5.1 install mobdebug --local
```

Install the http dependencies
```shell
luarocks --lua-version=5.1 install lua-resty-http
luarocks --lua-version=5.1 install lua-resty-openssl
```

Run application in working directory
```shell
openresty -p $PWD/ -c nginx.conf -g daemon\ off\;
```

Verify the port are running 
```shell
lsof -i :8080
lsof -i :8173
```

Verify the install location of plugins
```shell
luarocks show mobdebug
luarocks show luasocket
```

References
* https://github.com/openresty/lua-nginx-module/blob/master/README.markdown

