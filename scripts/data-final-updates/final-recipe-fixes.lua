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
    --"ei_lube-destilation",
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
    "ei_plastic:crushed-coke",
    "ei_rocket-parts:odd-plating",
    "ei_insulated-wire",
    "firearm-magazine",
    "piercing-rounds-magazine",
    "uranium-rounds-magazine",
    "ei_compound-ammo",
    "shotgun-shell",
    "piercing-shotgun-shell",
    "cannon-shell",
    "explosive-cannon-shell",
    "uranium-cannon-shell",
    "explosive-uranium-cannon-shell",
    "artillery-shell",
    "rocket",
    "explosive-rocket",
    "ei_molten-steel:oxygen",
    "ei_neodym-plate",
    "ei_ceramic:water",
    "ei_solid-fuel:residual-oil",
    "ei_diesel-fuel-unit",
}

local crafting_categories = {
    "ei_waver-factory",
    "smelting",
    "rocket-building",
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

-- remove productivity

local remove = {
    "lubricant",
}

-- loop over modules and their limitation and remove productivity from them for given recipes

local modules = {
    "productivity-module",
    "productivity-module-2",
    "productivity-module-3",
}

for i,v in pairs(modules) do
    for i2,v2 in ipairs(data.raw["module"][v].limitation) do
        for i3,v3 in ipairs(remove) do
            if v2 == v3 then
                table.remove(data.raw["module"][v].limitation, i2)
            end
        end
    end
end

-- fix recipes that need vanilla iron-ore, copper-ore or iron-gear-wheel/iron-stick
-- loop over all recipes
for name,recipe in pairs(data.raw.recipe) do

    ei_lib.recipe_swap(name, "iron-ore", "ei_poor-iron-chunk")
    ei_lib.recipe_swap(name, "copper-ore", "ei_poor-copper-chunk")
    ei_lib.recipe_swap(name, "iron-gear-wheel", "ei_iron-mechanical-parts")
    ei_lib.recipe_swap(name, "iron-stick", "ei_iron-mechanical-parts")
    ei_lib.recipe_swap(name, "nuclear-fuel", "ei_uranium-235-fuel")

end