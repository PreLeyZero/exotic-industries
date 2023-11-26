-- changes to FMF mod

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

--====================================================================================================
--CHECK FOR MOD
--====================================================================================================

if not mods["Teleporters"] then
    return
end

--====================================================================================================
--CHANGES
--====================================================================================================

-- tech changes
data.raw.technology["teleporter"].prerequisites = {"ei_high-energy-crystal", "ei_computer-core"}
data.raw.technology["teleporter"].age = "computer-age"

-- recipe changes
data.raw.recipe["teleporter"].ingredients = {
    {type = "item", name = "ei_alien-resin", amount = 25},
    {type = "item", name = "ei_simulation-data", amount = 20},
    {type = "item", name = "ei_high-energy-crystal", amount = 10},
}