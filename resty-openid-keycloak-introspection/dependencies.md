brew install openssl@1.1
luarocks install luasec OPENSSL_DIR=$(brew --prefix openssl@1.1)

luarocks install lua-resty-http
luarocks install lua-resty-openssl
luarocks install lua-resty-openidc

luarocks list
luarocks show lua-resty-openssl
