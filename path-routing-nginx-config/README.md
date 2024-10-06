

```shell
# testing the config
openresty -t -p $(pwd) -c nginx.conf

# running in demon mode
openresty -p $(pwd) -c nginx.conf

# not running in demon mode
openresty -p $(pwd) -c nginx.conf -g daemon\ off\;
```
