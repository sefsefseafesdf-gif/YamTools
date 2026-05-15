local yamtools = {
    version = "beta 0.1",
    author = "yam-ka",
}

client.exec("clear")

local function value_to_string(v)
    local t = type(v)

    if t == "table" then
        local out = {}

        for i = 1, #v do
            out[#out + 1] = tostring(v[i])
        end

        return table.concat(out, ", ")
    end

    return tostring(v)
end

local function AA_builder()

    local AA = {
        enabled =
            ui.get(ui.reference("AA", "Anti-aimbot angles", "Enabled")),

        pitch =
            ui.get(ui.reference("AA", "Anti-aimbot angles", "Pitch")),

        yaw_base =
            ui.get(ui.reference("AA", "Anti-aimbot angles", "Yaw base")),

        yaw =
            ui.get(ui.reference("AA", "Anti-aimbot angles", "Yaw")),

        yaw_jitter =
            ui.get(ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")),

        body_yaw =
            ui.get(ui.reference("AA", "Anti-aimbot angles", "Body yaw")),

        freestanding_body_yaw =
            ui.get(ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw")),

        edge_yaw =
            ui.get(ui.reference("AA", "Anti-aimbot angles", "Edge yaw")),

        freestanding =
            ui.get(ui.reference("AA", "Anti-aimbot angles", "Freestanding")),

        roll =
            ui.get(ui.reference("AA", "Anti-aimbot angles", "Roll")),
    }

    return AA
end

local function main()

    client.log(
        "YamTools " ..
        yamtools.version ..
        " by " ..
        yamtools.author
    )

    local aa = AA_builder()

    for key, value in pairs(aa) do
        client.log(
            key ..
            " = " ..
            value_to_string(value)
        )
    end

end

main()