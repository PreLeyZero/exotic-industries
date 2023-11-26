--====================================================================================================
--CHECK FOR MOD
--====================================================================================================

if not mods["textplates"] then
    return
end

--====================================================================================================
--CHANGES
--====================================================================================================

-- tech changes
data.raw.technology["textplates-gold"].prerequisites = {"ei_deep-mining"}
data.raw.technology["teleporter"].age = "electricity-age"

-- recipe changes
data.raw.recipe["textplate-small-gold"].ingredients = {{type = "item", name = "ei_gold-plate", amount = 1}}
data.raw.recipe["textplate-large-gold"].ingredients = {{type = "item", name = "ei_gold-plate", amount = 4}}