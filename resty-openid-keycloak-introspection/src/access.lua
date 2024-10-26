local cjson = require "cjson"

local ngx = ngx
local opts = {
    discovery = "http://127.0.0.1:8084/realms/mes-application/.well-known/openid-configuration",
    client_id = "openresty-api-gateway",
    client_secret = "B0rxAinZBXlvBhIotrCUpBADLC1q9bgw",
    introspection_endpoint = "http://127.0.0.1:8084/realms/mes-application/protocol/openid-connect/token/introspect",
    token_signing_alg_values_supported = {"RS256"},
    introspection_expiry_claim = "exp",
    ssl_verify = "no",
    validate_scope = false,  -- you can adjust this depending on your needs
    proxy_opts = nil  -- No proxy needed
}

local res, err = require("resty.openidc").introspect(opts)

if err then
    ngx.status = 403
    ngx.say("Access denied: " .. err)
    ngx.exit(ngx.HTTP_FORBIDDEN)
end

 -- If introspection is successful, proceed to backend
 ngx.req.set_header("X-User", res.sub)  -- you can pass user info to the upstream service
 
 ngx.log(ngx.DEBUG, "User: ", res.sub)
 ngx.log(ngx.DEBUG, "Token is valid. Roles: ", require("cjson").encode(res.realm_access.roles))

 if res.realm_access.roles ~= nil then
    
    ngx.req.set_header("X-Roles", table.concat(res.realm_access.roles, ","))  -- example passing roles
 end
 