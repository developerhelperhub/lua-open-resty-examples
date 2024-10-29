This section explain the Open Resty framework in our Mac Machine Locally

### Version
Following software need to install in our local machine
* Lua 5.1: Programing Language
* Luarocks 3.9.2: Lua Package Manager
* Open Resty 1.27.1.1: Web Framework

### Install Lua 5.1

Execute the following command to install the Lua 5.1 version
```shell
brew fetch lua@5.1
brew install "$(brew --cache lua@5.1)"
```

Verify the lua version
```shell
lua-5.1 -v
#Lua 5.1.5  Copyright (C) 1994-2012 Lua.org, PUC-Rio
# install location on 
```

### Luarocks 3.9.2

Execute the following command to install the Luarocks 3.9.2 version and configure with lua 5.1
Install Lua package manager luarocks 3.9.2 and configure with lua 5.1
```shell
curl https://luarocks.github.io/luarocks/releases/luarocks-3.9.2.tar.gz -O luarocks-3.9.2.tar.gz
cd luarocks-3.9.2
./configure --lua-version=5.1 --with-lua-include=/usr/local/Cellar/lua@5.1/5.1.5_8/include/lua5.1
make build 
make install
luarocks --version
```

### OpenResty 3.9.2
lua-resty is typically used with OpenResty, which bundles NGINX and LuaJIT. You can install OpenResty using Homebrew:
```shell
brew tap openresty/brew
brew install openresty/brew/openresty

openresty -v
#nginx version: openresty/1.27.1.1
```

Note: if we have below error related `geoip`, please install this `brew install geoip`
```shell
./configure: error: the GeoIP module requires the GeoIP library.
You can either do not enable the module or install the library.
```

**Verify the Install Information**
```shell
brew info openresty

==> openresty/brew/openresty: stable 1.25.3.2
Scalable Web Platform by Extending NGINX with Lua
https://openresty.org
Installed
/usr/local/Cellar/openresty/1.25.3.2_1 (325 files, 7.2MB) *
  Built from source on 2024-10-02 at 13:18:11
From: https://github.com/openresty/homebrew-brew/blob/HEAD/Formula/openresty.rb
==> Dependencies
Required: geoip ✔, openresty/brew/openresty-openssl111 ✔, pcre ✔
Optional: postgresql ✘
==> Options
--with-iconv
        Compile with ngx_http_iconv_module
--with-postgresql
        Compile with ngx_http_postgres_module
--with-slice
        Compile with ngx_http_slice_module
==> Caveats
You can find the configuration files for openresty under /usr/local/etc/openresty/.

To restart openresty/brew/openresty after an upgrade:
  sudo brew services restart openresty/brew/openresty
Or, if you don't want/need a background service you can just run:
  /usr/local/opt/openresty/bin/openresty -g daemon\ off\;
```

**Openresty install location on mac**
```shell
ls /usr/local/Cellar/openresty/1.27.1.1_1
```

**Note**: lua@5.1 has been disabled because it is deprecated upstream! It was disabled on 2024-02-16.
