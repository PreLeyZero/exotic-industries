-- changes to exotic-industries-loaders mod

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

--====================================================================================================
--CHECK FOR MOD
--====================================================================================================

if not mods["exotic-industries-loaders"] then
    return
end

--====================================================================================================
--CHANGES
--====================================================================================================

-- change where loaders are unlocked
ei_lib.remove_unlock_recipe("logistics", "ei_loader")
table.insert(data.raw.technology["fast-inserter"].effects, {
    type = "unlock-recipe",
    recipe = "ei_loader"
})

ei_lib.remove_unlock_recipe("logistics-2", "ei_fast-loader")
table.insert(data.raw.technology["advanced-circuit"].effects, {
    type = "unlock-recipe",
    recipe = "ei_fast-loader"
})

ei_lib.remove_unlock_recipe("logistics-3", "ei_express-loader")
table.insert(data.raw.technology["bulk-inserter"].effects, {
    type = "unlock-recipe",
    recipe = "ei_express-loader"
})

-- make new loader recipes
ei_lib.recipe_new("ei_loader", {
    {type="item", name="electric-engine-unit", amount=4},
    {type="item", name="fast-inserter", amount=2},
    {type="item", name="ei_iron-mechanical-parts", amount=6},
})

ei_lib.recipe_new("ei_fast-loader", {
    {type="item", name="electric-engine-unit", amount=10},
    {type="item", name="ei_loader", amount=1},
    {type="item", name="advanced-circuit", amount=10},
})

ei_lib.recipe_new("ei_express-loader", {
    {type="item", name="bulk-inserter", amount=2},
    {type="item", name="ei_fast-loader", amount=1},
    {type="item", name="ei_steel-mechanical-parts", amount=10},
})