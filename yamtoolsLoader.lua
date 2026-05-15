local http = require("gamesense/http")

local BASE_URL =
    "https://raw.githubusercontent.com/sefsefseafesdf-gif/YamTools/main/yamtools.lua"

local function log(msg)
    client.log("[YamTools] " .. tostring(msg))
end

local function cache_bust(url)
    local sep = string.find(url, "?", 1, true) and "&" or "?"

    return url ..
        sep ..
        "nocache=" ..
        tostring(globals.realtime()) ..
        "_" ..
        tostring(client.random_int(100000, 999999))
end

local function run_lua(source)
    if not source or source == "" then
        log("Empty response")
        return
    end

    if source:find("404: Not Found", 1, true) then
        log("GitHub returned 404. Check file path/branch.")
        return
    end

    if source:sub(1, 1) == "{" then
        log("GitHub returned JSON/API error, not Lua.")
        log(source:sub(1, 160))
        return
    end

    local chunk, compile_err = loadstring(source)

    if not chunk then
        log("Compile error: " .. tostring(compile_err))
        log("Preview: " .. source:sub(1, 160))
        return
    end

    local ok, runtime_err = pcall(chunk)

    if not ok then
        log("Runtime error: " .. tostring(runtime_err))
        return
    end

    log("Loaded successfully")
end

local function load_remote()
    local url = cache_bust(BASE_URL)

    log("Fetching latest...")

    http.get(url, function(success, response)
        if not success then
            log("HTTP request failed")
            return
        end

        local body = nil

        if type(response) == "table" then
            body = response.body or response.response or response.data
        else
            body = response
        end

        run_lua(body)
    end)
end

load_remote()