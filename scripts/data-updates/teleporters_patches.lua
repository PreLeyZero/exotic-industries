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
data.raw.technology["teleporter"].prerequisites = {"ei_high-tech-parts"}
data.raw.technology["teleporter"].age = "both-quantum-age"

-- recipe changes
data.raw.recipe["teleporter"].ingredients = {
    {type = "item", name = "ei_odd-plating", amount = 25},
    {type = "item", name = "ei_simulation-data", amount = 20},
    {type = "item", name = "ei_high-tech-parts", amount = 10},
}