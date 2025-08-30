-- changes to FMF mod

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

--====================================================================================================
--CHECK FOR MOD
--====================================================================================================

if not mods["SpidertronPatrols"] then
    return
end

--====================================================================================================
--CHANGES
--====================================================================================================

-- remove guns from spiderling
data.raw["spider-vehicle"]["sp-spiderling"].guns = {}

-- change spiderling tech
data.raw["technology"]["sp-spiderling"].prerequisites = {"advanced-circuit", "military-3", "ei_grower"}
data.raw["technology"]["sp-spiderling"].age = "electricity-age"

ei_lib.recipe_new("sp-spiderling", {
    {type="item", name="advanced-circuit", amount=10},
    {type="item", name="ei_energy-crystal", amount=20},
    {type="item", name="electric-engine-unit", amount=20},
    {type="item", name="ei_steel-mechanical-parts", amount=45},
    {type="item", name="radar", amount=6},
})

-- adjust spidertron
ei_lib.recipe_swap("spidertron", "tank", "sp-spiderling")

-- adjust spidertron automation tech
data.raw["technology"]["sp-spidertron-automation"].prerequisites = {"sp-spiderling", "logistic-robotics", "construction-robotics", "ei_electronic-parts"}

ei_lib.recipe_new("sp-spidertron-dock", {
    {type="item", name="ei_electronic-parts", amount=10},
    {type="item", name="radar", amount=1},
    {type="item", name="steel-plate", amount=6},
    {type="item", name="ei_copper-mechanical-parts", amount=12},
})

-- adjust trunks of spidertron and spiderling
data.raw["spider-vehicle"]["sp-spiderling"].inventory_size = 20
data.raw["spider-vehicle"]["spidertron"].inventory_size = 60