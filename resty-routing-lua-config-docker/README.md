


lua -v
Lua 5.4.7  Copyright (C) 1994-2024 Lua.org, PUC-Rio

brew install luarocks
brew install openssl@1.1

luarocks list

Debug configuration
luarocks --lua-version=5.1 install luasec OPENSSL_DIR=$(brew --prefix openssl@1.1) --local --force
luarocks --lua-version=5.1 install luasocket --local --force
luarocks --lua-version=5.1 install mobdebug --local

openresty -p $PWD/ -c nginx.conf -g daemon\ off\;

lsof -i :8080
lsof -i :8173

luarocks show mobdebug
luarocks show luasocket

References
* https://github.com/openresty/lua-nginx-module/blob/master/README.markdown

luarocks --lua-version=5.1 install lua-resty-http
luarocks --lua-version=5.1 install lua-resty-openssl