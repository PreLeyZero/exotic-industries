-- this file contains the prototype definition for varios stuff from steam age

local ei_data = require("lib/data")

--====================================================================================================
--PROTOTYPE DEFINITIONS
--====================================================================================================

--ITEMS
------------------------------------------------------------------------------------------------------

data:extend({
    {
        name = "ei_coke",
        type = "item",
        icon = ei_graphics_item_path.."coke.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "ei_refining-secondary",
        order = "a2",
        fuel_category = "chemical",
        fuel_value = "3MJ",
    },
    {
        name = "ei_coke-pellets",
        type = "item",
        icon = ei_graphics_item_path.."coke-pellets.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "ei_refining-secondary",
        order = "a3",
        fuel_category = "chemical",
        fuel_value = "18MJ",
    },
    {
        name = "ei_crushed-coke",
        type = "item",
        icon = ei_graphics_item_path.."crushed-coke.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-crushed",
        order = "c1",
        fuel_category = "chemical",
        fuel_value = "1.5MJ",
    },
    {
        name = "ei_charcoal",
        type = "item",
        icon = ei_graphics_item_path.."charcoal.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "ei_refining-secondary",
        order = "a1",
        fuel_category = "chemical",
        fuel_value = "2MJ",
    },
    {
        name = "ei_crushed-iron",
        type = "item",
        icon = ei_graphics_item_path.."crushed-iron.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-crushed",
        order = "a1",
    },
    {
        name = "ei_steel-blend",
        type = "item",
        icon = ei_graphics_item_path.."steel-blend.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-secondary",
        order = "a5",
    },
    {
        name = "ei_steel-ingot",
        type = "item",
        icon = ei_graphics_item_path.."steel-ingot.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-ingot",
        order = "a3",
    },
    {
        name = "ei_steel-mechanical-parts",
        type = "item",
        icon = ei_graphics_item_path.."steel-mechanical-parts.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-parts",
        order = "a3",
    },
})


--RECIPES
------------------------------------------------------------------------------------------------------

data:extend({
    {
        name = "ei_charcoal",
        type = "recipe",
        category = "smelting",
        energy_required = 3,
        ingredients = {
            {"wood", 2}
        },
        results = {
            {type = "item", name = "ei_charcoal", amount = 3},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_charcoal",
    },
    {
        name = "ei_coke",
        type = "recipe",
        category = "smelting",
        energy_required = 1.5,
        ingredients = {
            {"coal", 1}
        },
        results = {
            {type = "item", name = "ei_coke", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_coke",
    },
    {
        name = "ei_coke-pellets",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients = {
            {"ei_coke", 5}
        },
        results = {
            {type = "item", name = "ei_coke-pellets", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_coke-pellets",
    },
    {
        name = "ei_crushed-coke",
        type = "recipe",
        category = "ei_steam-crusher",
        energy_required = 1,
        ingredients = {
            {"ei_coke", 1}
        },
        results = {
            {type = "item", name = "ei_crushed-coke", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-coke",
    },
    {
        name = "ei_crushed-iron",
        type = "recipe",
        category = "ei_steam-crusher",
        energy_required = 1,
        ingredients = {
            {"ei_iron-ingot", 1}
        },
        results = {
            {type = "item", name = "ei_crushed-iron", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-iron",
    },
    {
        name = "ei_crushed-iron:plate",
        type = "recipe",
        category = "ei_steam-crusher",
        energy_required = 1,
        ingredients = {
            {"iron-plate", 1}
        },
        results = {
            {type = "item", name = "ei_crushed-iron", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-iron",
        hide_from_player_crafting = true,
    },
    {
        name = "ei_crushed-iron:beam",
        type = "recipe",
        category = "ei_steam-crusher",
        energy_required = 1,
        ingredients = {
            {"ei_iron-beam", 1}
        },
        results = {
            {type = "item", name = "ei_crushed-iron", amount = 4},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-iron",
        hide_from_player_crafting = true,
    },
    {
        name = "ei_crushed-iron:mechanical-parts",
        type = "recipe",
        category = "ei_steam-crusher",
        energy_required = 1,
        ingredients = {
            {"ei_iron-mechanical-parts", 1}
        },
        results = {
            {type = "item", name = "ei_crushed-iron", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-iron",
        hide_from_player_crafting = true,
    },
    {
        name = "ei_steel-blend",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients = {
            {"ei_crushed-coke", 2},
            {"ei_crushed-iron", 5}
        },
        results = {
            {type = "item", name = "ei_steel-blend", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_steel-blend",
    },
    {
        name = "ei_steel-ingot",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {"ei_steel-blend", 1}
        },
        results = {
            {type = "item", name = "ei_steel-ingot", amount = 1},
            {type = "item", name = "ei_slag", amount = 1, probability = 0.05}
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_steel-ingot",
    },
    {
        name = "ei_steel-mechanical-parts",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients = {
            {"ei_steel-ingot", 1}
        },
        results = {
            {type = "item", name = "ei_steel-mechanical-parts", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_steel-mechanical-parts",
    },
    {
        name = "ei_steel-beam",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients = {
            {"ei_steel-ingot", 2}
        },
        results = {
            {type = "item", name = "steel-plate", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "steel-plate",
    },
    {
        name = "ei_tank",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients = {
            {"ei_iron-beam", 10},
            {"pipe", 4},
            {"ei_copper-mechanical-parts", 6}
        },
        results = {
            {type = "item", name = "storage-tank", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "storage-tank",
    },
})

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
    },
    {
        name = "ei_coke-processing",
        type = "technology",
        icon = ei_graphics_tech_path.."coke-processing.png",
        icon_size = 128,
        prerequisites = {"ei_stone-quarry"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_charcoal"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_coke"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_coke-pellets"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        age = "steam-age",
    },
    {
        name = "ei_tank",
        type = "technology",
        icon = ei_graphics_tech_path.."fluid-handling.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"steel-processing"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "storage-tank"
            },
            -- TODO heat powered oil facility
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        age = "steam-age",
    },
})

-- add steel recipes to steel-processing

table.insert(data.raw["technology"]["steel-processing"].effects, {
    type = "unlock-recipe",
    recipe = "ei_steel-blend"
})

table.insert(data.raw["technology"]["steel-processing"].effects, {
    type = "unlock-recipe",
    recipe = "ei_steel-ingot"
})

table.insert(data.raw["technology"]["steel-processing"].effects, {
    type = "unlock-recipe",
    recipe = "ei_steel-beam"
})

table.insert(data.raw["technology"]["steel-processing"].effects, {
    type = "unlock-recipe",
    recipe = "ei_steel-mechanical-parts"
})