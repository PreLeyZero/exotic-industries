-- vanilla patches like changed entities/prototypes are made here

local ei_lib = require("lib/lib")

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

--overwrite vanilla recipes
data.raw["recipe"]["iron-plate"].ingredients = {
    {"ei_poor-iron-chunk", 2}
}

data.raw["recipe"]["copper-plate"].ingredients = {
    {"ei_poor-copper-chunk", 2}
}

data.raw["recipe"]["transport-belt"].ingredients = {
    {"iron-plate", 1},
    {"ei_iron-mechanical-parts", 2}
}

data.raw["recipe"]["burner-inserter"].ingredients = {
    {"iron-plate", 1},
    {"ei_iron-mechanical-parts", 2}
}

data.raw["recipe"]["repair-pack"].ingredients = {
    {"ei_copper-mechanical-parts", 3},
    {"ei_iron-mechanical-parts", 3} 
}

data.raw["recipe"]["iron-chest"].ingredients = {
    {"iron-plate", 8},
    {"ei_iron-beam", 2}
}

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

