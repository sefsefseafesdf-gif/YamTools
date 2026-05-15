local yamtools = {
    version = "beta 0.1",
    author = "yam-ka",
}

client.exec("clear")

local menu_toggle = {
    load = ui.new_checkbox("LUA", "A", "YamTools"),
}

local refs = {
    aa = {
        enabled = ui.reference("AA", "Anti-aimbot angles", "Enabled"),
        pitch = ui.reference("AA", "Anti-aimbot angles", "Pitch"),
        yaw_base = ui.reference("AA", "Anti-aimbot angles", "Yaw base"),
        yaw = ui.reference("AA", "Anti-aimbot angles", "Yaw"),
        yaw_jitter = ui.reference("AA", "Anti-aimbot angles", "Yaw jitter"),
        body_yaw = ui.reference("AA", "Anti-aimbot angles", "Body yaw"),
        freestanding_body_yaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw"),
        edge_yaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw"),
        freestanding = ui.reference("AA", "Anti-aimbot angles", "Freestanding"),
        roll = ui.reference("AA", "Anti-aimbot angles", "Roll"),
    },

    fakelag = {
        enabled = ui.reference("AA", "Fake lag", "Enabled"),
        amount = ui.reference("AA", "Fake lag", "Amount"),
        variance = ui.reference("AA", "Fake lag", "Variance"),
        limit = ui.reference("AA", "Fake lag", "Limit"),
    },

    other = {
        slow_motion = ui.reference("AA", "Other", "Slow motion"),
        leg_movement = ui.reference("AA", "Other", "Leg movement"),
        on_shot_anti_aim = ui.reference("AA", "Other", "On shot anti-aim"),
        fake_peek = ui.reference("AA", "Other", "Fake peek"),
    },
}

local function value_to_string(v)
    if type(v) == "table" then
        local out = {}

        for i = 1, #v do
            out[#out + 1] = tostring(v[i])
        end

        return table.concat(out, ", ")
    end

    return tostring(v)
end

local function read_group(group)
    local values = {}

    for key, ref in pairs(group) do
        values[key] = ui.get(ref)
    end

    return values
end

local function AA_builder()
    return {
        aa = read_group(refs.aa),
        fakelag = read_group(refs.fakelag),
        other = read_group(refs.other),
    }
end

local function YamTools_builder()
    return {
        enabled = ui.get(menu_toggle.load),
        AA = AA_builder(),
    }
end

local function log_table(prefix, tbl)
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            log_table(prefix .. key .. ".", value)
        else
            client.log(prefix .. key .. " = " .. value_to_string(value))
        end
    end
end

local function main()
    client.log("YamTools " .. yamtools.version .. " by " .. yamtools.author)

    local builder = YamTools_builder()

    log_table("", builder)
end

main()