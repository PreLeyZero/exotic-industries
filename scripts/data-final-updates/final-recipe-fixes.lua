-- fix recipes that are broken due to patches

local ei_data = require("lib/data")
local ei_lib = require("lib/lib")

--====================================================================================================
--FINAL RECIPE FIXES
--====================================================================================================

-- loop over all recipes and apply fix_recipe
for i,v in pairs(data.raw.recipe) do
    -- get mode of recipe
    if data.raw.recipe[i].normal then
        ei_lib.fix_recipe(i, "normal")
        ei_lib.fix_recipe(i, "expensive")
    else
        ei_lib.fix_recipe(i, nil)
    end

end


-- hide all barrel rcipes that were added by autobarreling from player
-- check if recipe is in fill-barrel or empty-barrel subgroup

for i,v in pairs(data.raw.recipe) do
    if data.raw.recipe[i].subgroup == "fill-barrel" or data.raw.recipe[i].subgroup == "empty-barrel" then
        data.raw.recipe[i].hide_from_player_crafting = true
    end
end

--====================================================================================================
--RECIPES THAT ALLOW PRODUCTIVITY
--====================================================================================================

local recipes = {
    "ei_desulfurize-kerosene",
    "ei_kerosene:heavy-oil",
    "ei_hydrofluoric-acid",
    "ei_kerosene-cracking",
    "ei_nitric-acid",
    "ei_crystal-solution",
    "ei_drill-fluid",
    "ei_ammonia",
    "ei_dinitrogen-tetroxide",
    "ei_dinitrogen-tetroxide-water-solution",
    "ei_oxygen-difluoride",
    "ei_lube-destilation",
    "ei_plastic:benzol",
    "ei_battery:lithium",
    "ei_carbon",
    "ei_lithium-crystal",
    "ei_molten-steel:mix",
    "ei_steam-engine",
    "ei_electron-tube",
    "ei_cpu",
    "ei_electronic-parts",
    "ei_module-part",
    "ei_module-base",
    "ei_magnet",
    "ei_emtpy-cryo-container",
    "ei_green-circuit:waver",
    "ei_red-circuit:waver",
    "ei_electric-engine:lube",
    "ei_advanced-motor",
    "ei_rocket-parts",
    "ei_dark-age-tech",
    "ei_steam-age-tech",
    "ei_electricity-age-tech",
    "ei_computer-age-tech",
    "ei_advanced-computer-age-tech",
    "ei_quantum-age-tech",
    "ei_ceramic",
    "ei_steel-blend",
    "ei_dirty-water:fluorite",
    "ei_neutron-container",
    "ei_odd-plating",
    "ei_advanced-rocket-fuel",
}

local crafting_categories = {
    "ei_waver-factory",
    "smelting",
}

-- add them to limitation of productivity modules

for i,v in pairs(recipes) do
    table.insert(data.raw["module"]["productivity-module"].limitation, v)
    table.insert(data.raw["module"]["productivity-module-2"].limitation, v)
    table.insert(data.raw["module"]["productivity-module-3"].limitation, v)
end

-- get all recipes that have given crafting category and add them to limitation of productivity modules

for i,v in pairs(crafting_categories) do
    for i2,v2 in pairs(data.raw["recipe"]) do
        if v2.category == v then
            table.insert(data.raw["module"]["productivity-module"].limitation, v2.name)
            table.insert(data.raw["module"]["productivity-module-2"].limitation, v2.name)
            table.insert(data.raw["module"]["productivity-module-3"].limitation, v2.name)
        end
    end
end