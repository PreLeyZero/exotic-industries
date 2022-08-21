-- this file contains the prototype definition for varios stuff from electricity age

local ei_data = require("lib/data")

--====================================================================================================
--PROTOTYPE DEFINITIONS
--====================================================================================================

--ITEMS
------------------------------------------------------------------------------------------------------

--RECIPES
------------------------------------------------------------------------------------------------------

--TECHS
------------------------------------------------------------------------------------------------------

-- insert prereqs for steam age tech
table.insert(data.raw.technology["ei_electricity-age"].prerequisites, "engine")
table.insert(data.raw.technology["ei_electricity-age"].prerequisites, "electronics")
table.insert(data.raw.technology["ei_electricity-age"].prerequisites, "ei_steam-inserter")
table.insert(data.raw.technology["ei_electricity-age"].prerequisites, "logistics")
table.insert(data.raw.technology["ei_electricity-age"].prerequisites, "ei_steam-assembler")

table.insert(data.raw.technology["ei_electricity-age"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_electricity-age-tech"
})