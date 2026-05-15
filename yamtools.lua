local yamtools = {
    version = "beta 0.1",
    author = "yam-ka",
}

local function antiaim_builder()
    local antaim = {
        ui.get("antiaim", "Anti-aimbot angles", "Enabled"),
        ui.get("antiaim", "Anti-aimbot angles", "Pitch"),
        ui.get("antiaim", "Anti-aimbot angles", "Yaw Base"),
        ui.get("antiaim", "Anti-aimbot angles", "Yaw"),
        ui.get ("antiaim", "Anti-aimbot angles", "Yaw jitter"),
        ui.get("antiaim", "Anti-aimbot angles", "Body yaw"),
        ui.get("antiaim", "Anti-aimbot angles", "Freestanding body yaw"),
        ui.get("antiaim", "Anti-aimbot angles", "Edge yaw"),
        ui.get("antiaim", "Anti-aimbot angles", "Freestanding"),
        ui.get("antiaim", "Anti-aimbot angles", "Roll"),
    }
    return antaim
end

local function main()
    client.log("YamTools " .. yamtools.version .. " by " .. yamtools.author)
end

main()