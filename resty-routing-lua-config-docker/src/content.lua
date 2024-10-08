local http = require "resty.http"  -- OpenResty's HTTP client library
local cjson = require "cjson"
local ngx = ngx

-- Define upstream servers
local upstreams = {
    item_service = "http://item_service:8081",
    order_service = "http://order_service:8082"
}

-- Function to determine upstream server based on request URI
local function get_upstream(uri)

    ngx.log(ngx.DEBUG, "URI :", uri)

    if uri:find("^/item%-service") then

        ngx.log(ngx.DEBUG, "Item service found")

        local rewrite_uri = ngx.re.sub(uri, "^/item-service/(.*)", "/$1", "o")

        ngx.log(ngx.DEBUG, "Item service found, rewrite uri: ", rewrite_uri)

        return upstreams.item_service .. rewrite_uri
    elseif uri:find("^/order%-service") then

        ngx.log(ngx.DEBUG, "Order service found")

        local rewrite_uri = ngx.re.sub(uri, "^/order-service/(.*)", "/$1", "o")

        ngx.log(ngx.DEBUG, "Item service found, rewrite uri: ", rewrite_uri)

        return upstreams.order_service .. rewrite_uri
    else

        ngx.log(ngx.DEBUG, "Path not found!")

        return nil  -- No matching upstream
    end
end

local uri = ngx.var.uri

-- Determine the appropriate upstream based on the URI
local upstream = get_upstream(uri)

if upstream == nil then
    -- Return a 404 response if no upstream matches
    ngx.status = ngx.HTTP_NOT_FOUND
    ngx.say("404 Not Found: No matching upstream.")
    return ngx.exit(ngx.HTTP_NOT_FOUND)
end

-- Create a new HTTP client
local httpc = http.new()

ngx.log(ngx.DEBUG, "Request url ", upstream)

-- Set up the request
local res, err = httpc:request_uri(upstream, {
    method = ngx.req.get_method(),
    body = ngx.req.get_body_data(),
    headers = ngx.req.get_headers()
})

-- Function to filter out non-serializable values
local function filter_serializable(tbl)
    local result = {}
    for k, v in pairs(tbl) do
        if type(v) ~= "function" then  -- Exclude functions
            result[k] = v
        end
    end
    return result
end

--ngx.log(ngx.DEBUG, "Response: ", cjson.encode(filter_serializable(res)))

-- Handle errors
if not res then
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("500 Internal Server Error: Failed to proxy request - ", err)
    return ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end

-- Pass the upstream response to the client
ngx.status = res.status
for k, v in pairs(res.headers) do
    if k ~= "Transfer-Encoding" then  -- Exclude unwanted headers
        ngx.header[k] = v
    end
end
ngx.say(res.body)
ngx.exit(res.status)