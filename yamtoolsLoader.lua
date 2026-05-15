local http = require("gamesense/http")

http.get(
    "https://raw.githubusercontent.com/sefsefseafesdf-gif/YamTools/refs/heads/main/yamtools.lua",

    function(success, response)

        if not success or not response then
            client.log("Failed to fetch lua")
            return
        end

        local body =
            response.body or response

        local chunk, err =
            loadstring(body)

        if not chunk then
            client.log("Compile error: " .. tostring(err))
            client.log(body:sub(1, 120))
            return
        end

        local ok, runtime_err =
            pcall(chunk)

        if not ok then
            client.log("Runtime error: " .. tostring(runtime_err))
            return
        end

        client.log("YamTools loaded")

    end
)