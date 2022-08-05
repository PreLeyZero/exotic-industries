-- this file contains the prototype definition for varios stuff from steam age

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

data:extend({
    {
        name = "ei_steam-power",
        type = "technology",
        icon = ei_graphics_tech_path.."steam-power.png",
        icon_size = 256,
        prerequisites = {"ei_steam-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "pipe-to-ground"
            },
            {
                type = "unlock-recipe",
                recipe = "boiler"
            },
            {
                type = "unlock-recipe",
                recipe = "offshore-pump"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        age = "steam-age",
    }
})