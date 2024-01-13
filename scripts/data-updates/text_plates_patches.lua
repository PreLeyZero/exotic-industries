--====================================================================================================
--CHECK FOR MOD
--====================================================================================================

if not mods["textplates"] then
    return
end

local ei_lib = require("lib.lib")

--====================================================================================================
--CHANGES
--====================================================================================================

-- tech changes
ei_lib.set_properties({
    type = "technology",
    name = "textplates-gold",
    prerequisites = {"ei_deep-mining"}
})
ei_lib.set_properties({
    type = "technology",
    name = "teleporter",
    age = "electricity-age"
})

-- recipe changes
ei_lib.set_properties({
    type = "recipe",
    name = "textplate-small-gold",
    ingredients = {{type = "item", name = "ei_gold-plate", amount = 1}}
})
ei_lib.set_properties({
    type = "recipe",
    name = "textplate-large-gold",
    ingredients = {{type = "item", name = "ei_gold-plate", amount = 4}}
})
