-- this file contains the prototype definition for varios stuff from quantum age

local ei_data = require("lib/data")

--====================================================================================================
--PROTOTYPE DEFINITIONS
--====================================================================================================

--ITEMS
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_crushed-neodym",
        type = "item",
        icon = ei_graphics_item_path.."crushed-neodym.png",
        icon_mipmaps = 4,
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-crushed",
        order = "d2",
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-neodym.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-neodym-1.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-neodym-2.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-neodym-3.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
        },
    },
    {
        name = "ei_pure-crushed-neodym",
        type = "item",
        icon = ei_graphics_item_path.."crushed-pure-neodym-3.png",
        icon_mipmaps = 4,
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-purified",
        order = "c-b",
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-pure-neodym.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-neodym-1.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-neodym-2.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-neodym-3.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
        },
    },
    {
        name = "ei_magnet",
        type = "item",
        icon = ei_graphics_item_path.."magnet.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "intermediate-product",
        order = "b9",
    },
})

--RECIPES
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_crushed-neodym",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_neodym-chunk", amount = 6},
        },
        results = {
            {type = "item", name = "ei_crushed-neodym", amount = 3},
            {type = "item", name = "stone", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-neodym",
    },
    {
        name = "ei_pure-crushed-neodym",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_crushed-neodym", amount = 25},
            {type = "fluid", name = "ei_hydrofluoric-acid", amount = 50},
        },
        results = {
            {type = "item", name = "ei_pure-crushed-neodym", amount = 5},
            {type = "item", name = "stone", amount = 20},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_pure-crushed-neodym",
    },
    {
        name = "ei_molten-neodym",
        type = "recipe",
        category = "ei_arc-furnace",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_pure-crushed-neodym", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_molten-neodym", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_molten-neodym",
    },
    {
        name = "ei_cast-neodym:ingot",
        type = "recipe",
        category = "ei_casting",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_molten-neodym", amount = 10},
        },
        results = {
            {type = "item", name = "ei_neodym-ingot", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_neodym-ingot",
    },
    {
        name = "ei_neodym-plate",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_neodym-ingot", amount = 1},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 5},
        },
        results = {
            {type = "item", name = "ei_neodym-plate", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_neodym-plate",
    },
    {
        name = "ei_magnet",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_neodym-plate", amount = 2},
            {type = "item", name = "ei_insulated-wire", amount = 25},
            {type = "item", name = "ei_high-energy-crystal", amount = 1},
        },
        results = {
            {type = "item", name = "ei_magnet", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_magnet",
    },
})

--TECHS
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_neodym-refining",
        type = "technology",
        icon = ei_graphics_tech_path.."neodym-refining.png",
        icon_size = 128,
        prerequisites = {"ei_quantum-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_crushed-neodym"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_pure-crushed-neodym"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_molten-neodym"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_cast-neodym:ingot"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_neodym-plate"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_magnet"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
})