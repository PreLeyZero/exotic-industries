-- vanilla patches like changed entities/prototypes are made here

local ei_lib = require("lib/lib")

--====================================================================================================
--GENERIC CHANGES
--====================================================================================================

-- since there is no iron gear used in EI use iron-mechanical parts instead
for i,v in pairs(data.raw["recipe"]) do
    ei_lib.recipe_swap(i, "iron-gear-wheel", "ei_iron-mechanical-parts")
    ei_lib.recipe_swap(i, "iron-stick", "ei_iron-mechanical-parts")

    -- if there is a normal/expensive version of the recipe, swap it too
    if v.normal then
        ei_lib.recipe_swap_normal(i, "iron-gear-wheel", "ei_iron-mechanical-parts")
        ei_lib.recipe_swap_normal(i, "iron-stick", "ei_iron-mechanical-parts")
    end

    if v.expensive then
        ei_lib.recipe_swap_expensive(i, "iron-gear-wheel", "ei_iron-mechanical-parts")
        ei_lib.recipe_swap_expensive(i, "iron-stick", "ei_iron-mechanical-parts")
    end
end


--====================================================================================================
--CHANGES
--====================================================================================================

--MINING
------------------------------------------------------------------------------------------------------

-- set output of copper and iron ore to ore chunks
data.raw["resource"]["iron-ore"].minable.result = "ei_poor-iron-chunk"
data.raw["resource"]["copper-ore"].minable.result = "ei_poor-copper-chunk"

-- set stone-furnace result inv to 2
data.raw["furnace"]["stone-furnace"].result_inventory_size = 2

--SUBGROUPS
------------------------------------------------------------------------------------------------------

-- move iron and copper plates to plates subgroup
data.raw["item"]["iron-plate"].subgroup = "ei_refining-plate"
data.raw["item"]["iron-plate"].order = "a1"
data.raw["item"]["copper-plate"].subgroup = "ei_refining-plate"
data.raw["item"]["copper-plate"].order = "a2"

--RECIPES
------------------------------------------------------------------------------------------------------

-- overwrite table for vanilla recipes
-- index is recipe name, value is table with new recipe data
local new_ingredients_table = {
    ["iron-plate"] = {
        {"ei_iron-ingot", 1}
    },
    ["copper-plate"] = {
        {"ei_copper-ingot", 1}
    },
    ["transport-belt"] = {
        {"iron-plate", 1},
        {"ei_iron-mechanical-parts", 2}
    },
    ["burner-inserter"] = {
        {"iron-plate", 1},
        {"ei_iron-mechanical-parts", 2}
    },
    ["repair-pack"] = {
        {"ei_copper-mechanical-parts", 3},
        {"ei_iron-mechanical-parts", 3} 
    },
    ["iron-chest"] = {
        {"iron-plate", 8},
        {"ei_iron-beam", 2} 
    },
    ["gun-turret"] = {
        {"iron-plate", 5},
        {"ei_iron-mechanical-parts", 5},
        {"ei_copper-mechanical-parts", 5}
    },
    ["heavy-armor"] = {
        {"iron-plate", 40},
        {"ei_iron-beam", 10},
        {"ei_copper-beam", 10}
    },
    ["stone-wall"] = {
        {"stone-brick", 3},
        {"ei_iron-beam", 1} 
    }
}

data.raw["recipe"]["iron-plate"].category = "crafting"
data.raw["recipe"]["iron-plate"].energy_required = 1

data.raw["recipe"]["copper-plate"].category = "crafting"
data.raw["recipe"]["copper-plate"].energy_required = 1

data.raw["recipe"]["burner-mining-drill"].normal.ingredients = {
    {"iron-plate", 3},
    {"ei_iron-mechanical-parts", 3},
    {"stone-furnace", 1}
}

data.raw["recipe"]["burner-mining-drill"].expensive.ingredients = {
    {"iron-plate", 3},
    {"ei_iron-mechanical-parts", 3},
    {"stone-furnace", 1}
}

data.raw["recipe"]["pipe"].normal.ingredients = {
    {"iron-plate", 1},
    {"ei_iron-beam", 1}
}

data.raw["recipe"]["pipe"].normal.ingredients = {
    {"iron-plate", 2},
    {"ei_iron-beam", 2}
}

--HIDE FOR LATER USE
------------------------------------------------------------------------------------------------------

-- logistic
data.raw["recipe"]["inserter"].hidden = true
data.raw["recipe"]["small-electric-pole"].hidden = true
data.raw["recipe"]["pipe-to-ground"].hidden = true

-- machines
data.raw["recipe"]["boiler"].hidden = true
data.raw["recipe"]["offshore-pump"].hidden = true
data.raw["recipe"]["lab"].hidden = true

-- intermediates
data.raw["recipe"]["copper-cable"].hidden = true
data.raw["recipe"]["iron-stick"].hidden = true
data.raw["recipe"]["automation-science-pack"].hidden = true

-- military
data.raw["recipe"]["radar"].hidden = true

-- expensive/normal variants
data.raw["recipe"]["pipe"].normal.enabled = false
data.raw["recipe"]["pipe"].expensive.enabled = false
data.raw["recipe"]["steam-engine"].normal.enabled = false
data.raw["recipe"]["steam-engine"].expensive.enabled = false
data.raw["recipe"]["electric-mining-drill"].normal.enabled = false
data.raw["recipe"]["electric-mining-drill"].expensive.enabled = false
data.raw["recipe"]["iron-gear-wheel"].normal.enabled = false
data.raw["recipe"]["iron-gear-wheel"].expensive.enabled = false
data.raw["recipe"]["electronic-circuit"].normal.enabled = false
data.raw["recipe"]["electronic-circuit"].expensive.enabled = false

--====================================================================================================
--FUNCTION STUFF
--====================================================================================================

-- loop over new_ingredients_table and set new ingredients for indexed recipes
for i,v in pairs(new_ingredients_table) do
    ei_lib.recipe_new(i, v)
end