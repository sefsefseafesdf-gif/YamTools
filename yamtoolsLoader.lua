local repo = "https://raw.githubusercontent.com/ExcessiveAmountsOfYam/YamTools/main/"
local files = {
    "yamtools.lua",
}

local function main()
    loadLua(repo .. "loader.lua")
    for _, file in ipairs(files) do
        loadLua(repo .. file)
    end
end

local function loadLua(url)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("Failed to load " .. url .. ": " .. err)
    else
        print("Successfully loaded " .. url)
    end
end

main()