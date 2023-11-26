-- changes to exotic-industries-loaders mod
local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

-- ====================================================================================================
-- CHECK FOR MOD
-- ====================================================================================================

if not mods["exotic-industries-loaders"] then
    return
end

-- ====================================================================================================
-- CHANGES
-- ====================================================================================================

-- change where loaders are unlocked
ei_lib.remove_unlock_recipe("logistics", "ei_loader")
table.insert(data.raw.technology["fast-inserter"].effects, {
    type = "unlock-recipe",
    recipe = "ei_loader"
})

ei_lib.remove_unlock_recipe("logistics-2", "ei_fast-loader")
table.insert(data.raw.technology["advanced-electronics"].effects, {
    type = "unlock-recipe",
    recipe = "ei_fast-loader"
})

ei_lib.remove_unlock_recipe("logistics-3", "ei_express-loader")
table.insert(data.raw.technology["stack-inserter"].effects, {
    type = "unlock-recipe",
    recipe = "ei_express-loader"
})

-- make new loader recipes
ei_lib.recipe_new("ei_loader", {{"electric-engine-unit", 4}, {"fast-inserter", 2}, {"ei_iron-mechanical-parts", 6}})

ei_lib.recipe_new("ei_fast-loader", {{"electric-engine-unit", 10}, {"ei_loader", 1}, {"advanced-circuit", 10}})

ei_lib.recipe_new("ei_express-loader", {{"stack-inserter", 2}, {"ei_fast-loader", 1}, {"ei_steel-mechanical-parts", 10}})
