local cjson = require "cjson"

local ngx = ngx
local opts = {
    discovery = "http://keycloak.myapp.com/realms/mes-application/.well-known/openid-configuration",
    client_id = "openresty-api-gateway",
    client_secret = "VdWM6SfXqdSpheZKuALL1ur59P6XgGoK",
    introspection_endpoint = "http://keycloak.myapp.com/realms/mes-application/protocol/openid-connect/token/introspect",
    token_signing_alg_values_supported = {"RS256"},
    introspection_expiry_claim = "exp",
    validate_scope = false,  -- you can adjust this depending on your needs
    proxy_opts = nil  -- No proxy needed
}

local res, err = require("resty.openidc").introspect(opts)

if err then
    ngx.status = 403
    ngx.say("Access denied: " .. err)
    ngx.exit(ngx.HTTP_FORBIDDEN)
end

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

ngx.log(ngx.DEBUG, "Response: ", cjson.encode(filter_serializable(res)))

 -- If introspection is successful, proceed to backend
 ngx.req.set_header("X-User", res.sub)  -- you can pass user info to the upstream service
 ngx.req.set_header("X-Roles", table.concat(res.roles, ","))  -- example passing roles