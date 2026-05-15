local repo =
    "https://raw.githubusercontent.com/ExcessiveAmountsOfYam/YamTools/main/"

local files = {
    "yamtools.lua",
}

local function loadLua(url)

    local success, err =
        pcall(function()

            local source =
                game:HttpGet(url)

            local chunk =
                loadstring(source)

            if not chunk then
                error("loadstring failed")
            end

            chunk()

        end)

    if not success then

        client.log(
            "Failed to load " ..
            url ..
            ": " ..
            tostring(err)
        )

    else

        client.log(
            "Loaded: " .. url
        )

    end

end

local function main()

    for _, file in ipairs(files) do
        loadLua(repo .. file)
    end

end

main()