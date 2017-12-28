Spring.Utilities = Spring.Utilities or {}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
-- Utility
--

function Spring.Utilities.Dump(o)
    if type(o) == "table" then
        local s = "{ "
        for k, v in pairs(o) do
            if type(k) ~= "number" then
                k = '"' .. k .. '"'
            end
            s = s .. "[" .. k .. "] = " .. dump(v) .. ",\n"
        end
        return s .. "} "
    else
        return tostring(o)
    end
end

function Spring.Utilities.SetToList(set)
    local list = {}
    for k in pairs(set) do
        table.insert(list, k)
    end
    return list
end

function Spring.Utilities.SetCount(set)
    local count = 0
    for k in pairs(set) do
        count = count + 1
    end
    return count
end

-- function Spring.Utilities.GetSqrDistance(x1, z1, x2, z2)
--    local dx, dz = x1 - x2, z1 - z2
--    return (dx * dx) + (dz * dz)
-- end

function Spring.Utilities.Round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end