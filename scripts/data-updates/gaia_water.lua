local ei_lib = require("lib/lib")

for _, tile in pairs(data.raw.tile) do
    for _, transition in pairs(tile.transitions or {}) do
        if ei_lib.table_contains_value(transition.to_tiles, "water") then
            table.insert(transition.to_tiles, "ei_gaia-water")
        end
    end
end