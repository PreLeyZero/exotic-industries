local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

-- ====================================================================================================
-- CHECK FOR MOD
-- ====================================================================================================

if not mods["ch-concentrated-solar"] then
    return
end

-- ====================================================================================================
-- CHANGES
-- ====================================================================================================

data.raw.technology["chcs-concentrated-solar-energy"].age = "steam-age"
data.raw.technology["chcs-concentrated-solar-energy"].prerequisites = {"ei_burner-heater", "electronics"}

data.raw.technology["chcs-weaponized-solar-energy"].age = "steam-age"
data.raw.technology["chcs-weaponized-solar-energy"].prerequisites = {"chcs-concentrated-solar-energy", "flammables"}

ei_lib.recipe_new("chcs-heliostat-mirror", {{"electronic-circuit", 2}, {"ei_glass", 10}, {"ei_iron-beam", 4}})

ei_lib.recipe_new("chcs-solar-power-tower", {{"electronic-circuit", 5}, {"ei_burner-heater", 2},
                                             {"ei_basic-heat-pipe", 10}, {"ei_iron-beam", 24}})

ei_lib.recipe_new("chcs-solar-laser-tower", {{"chcs-solar-power-tower", 1}, {"steel-plate", 24}, {"gun-turret", 2},
                                             {"ei_steel-mechanical-parts", 12}})

