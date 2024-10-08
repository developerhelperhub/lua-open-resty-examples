brew update

brew uninstall openresty/brew/openresty

rm -rf /usr/local/etc/openresty

brew uninstall luarocks

rm -rf /usr/local/etc/luarocks

rm -rf /Users/binoykr/.luarocks/lib/lua/

brew uninstall openssl@1.1

rm -rf /usr/local/etc/openssl@1.1.1

rm -rf /usr/local/etc/openssl@3

brew cleanup

brew doctor



rm -rf /usr/local/bin/lua
rm -rf /usr/local/bin/luac

rm -rf /usr/local/bin/luajit
rm -rf /usr/local/bin/luajit-2.1.1727870382

rm -rf /usr/local/lib/liblua*
rm -rf /usr/local/share/lua
rm -rf /usr/local/lib/lua

rm -rf /usr/local/include/lua*

sudo rm -rf /usr/local/lib/luarocks

