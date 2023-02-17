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
data.raw["technology"]["sp-spiderling"].prerequisites = {"advanced-electronics", "military-3", "ei_grower"}
data.raw["technology"]["sp-spiderling"].age = "electricity-age"

ei_lib.recipe_new("sp-spiderling", {
    {"advanced-circuit", 10},
    {"ei_energy-crystal", 20},
    {"electric-engine-unit", 20},
    {"ei_steel-mechanical-parts", 45},
    {"radar", 6},
})

-- adjust spidertron
ei_lib.recipe_swap("spidertron", "tank", "sp-spiderling")

-- adjust spidertron automation tech
data.raw["technology"]["sp-spidertron-automation"].prerequisites = {"sp-spiderling", "logistic-robotics", "construction-robotics", "ei_electronic-parts"}

ei_lib.recipe_new("sp-spidertron-dock", {
    {"ei_electronic-parts", 10},
    {"radar", 1},
    {"steel-plate", 6},
    {"ei_copper-mechanical-parts", 12},
})

-- adjust trunks of spidertron and spiderling
data.raw["spider-vehicle"]["sp-spiderling"].inventory_size = 20
data.raw["spider-vehicle"]["spidertron"].inventory_size = 60