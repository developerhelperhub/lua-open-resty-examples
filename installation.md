Step 1: Install Homebrew (if you haven't already)
If you don't have Homebrew installed, open your terminal and run:
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Step 1: Install OpenResty
lua-resty is typically used with OpenResty, which bundles NGINX and LuaJIT. You can install OpenResty using Homebrew:
```shell
brew search openresty
brew install openresty/brew/openresty
```


Install Information
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


openresty install location on mac
```shell
ls /usr/local/Cellar/openresty/1.25.3.2_1/bin/
```

Start openresty service
```shell
brew services start openresty
brew services info openresty
```



