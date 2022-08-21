-- this file contains the prototype definition for varios stuff from electricity age

local ei_data = require("lib/data")

--====================================================================================================
--PROTOTYPE DEFINITIONS
--====================================================================================================

--ITEMS
------------------------------------------------------------------------------------------------------

data:extend({
    {
        name = "ei_insulated-wire",
        type = "item",
        icon = ei_graphics_item_path.."insulated-wire.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "intermediate-product",
        order = "a[copper-wire]-a[insulated-wire]",
    },
})

--RECIPES
------------------------------------------------------------------------------------------------------

data:extend({
    {
        name = "ei_benzol:coal-gas",
        type = "recipe",
        category = "oil-processing",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_coal-gas", amount = 25},
        },
        results = {
            {type = "fluid", name = "ei_benzol", amount = 10},
            {type = "fluid", name = "petroleum-gas", amount = 10},
            {type = "fluid", name = "ei_residual-oil", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_benzol",
    },
    {
        name = "ei_plastic:benzol",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_benzol", amount = 10},
            {type = "fluid", name = "petroleum-gas", amount = 20},
        },
        results = {
            {type = "item", name = "plastic-bar", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "plastic-bar",
    },
    {
        name = "ei_insulated-wire",
        type = "recipe",
        category = "crafting",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "copper-cable", amount = 2},
            {type = "item", name = "plastic-bar", amount = 1},
        },
        results = {
            {type = "item", name = "ei_insulated-wire", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_insulated-wire",
    },
})

--TECHS
------------------------------------------------------------------------------------------------------

data:extend({
    {
        name = "ei_electricity-power",
        type = "technology",
        icon = ei_graphics_tech_path.."electricity-power.png",
        icon_size = 350,
        prerequisites = {"electric-engine"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "steam-engine"
            },
            {
                type = "unlock-recipe",
                recipe = "inserter"
            },
            {
                type = "unlock-recipe",
                recipe = "long-handed-inserter"
            },
            {
                type = "unlock-recipe",
                recipe = "small-electric-pole"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        age = "electricity-age",
    },
    {
        name = "ei_benzol",
        type = "technology",
        icon = ei_graphics_tech_path.."benzol.png",
        icon_size = 256,
        prerequisites = {"plastics"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_benzol:coal-gas"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_plastic:benzol"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        age = "electricity-age",
    },
})

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

table.insert(data.raw.technology["ei_electricity-age"].effects,  {
    type = "unlock-recipe",
    recipe = "lab"
})

table.insert(data.raw.technology["plastics"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_insulated-wire"
})