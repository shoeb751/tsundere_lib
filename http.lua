--[[--
 HTTP helper to be used by other modules
]]

local h = {}

local http = require("socket.http")
local https = require("ssl.https")
--[[--
 A wrapper over the socket get call.
 More features can be added to it in future
 as and when required. Just making sure that there is
 a unified simple API that all libraries use
 @param url URL to be called
 @return Response body as string
]]
local get_url = function(url)
    if string.find(url,'^https') then
        return https.request(url)
    else
        return http.request(url)
    end
end

--- @export
return {
    get_url = get_url
}
