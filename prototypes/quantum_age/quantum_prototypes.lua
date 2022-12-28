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
    {
        name = "ei_magnet-data",
        type = "item",
        icon = ei_graphics_item_path.."magnet-data.png",
        icon_size = 128,
        subgroup = "ei_refining-tech",
        order = "a-a-f",
        stack_size = 200,
        pictures = {
            layers =
            {
              {
                size = 128,
                filename = ei_graphics_item_path.."magnet-data.png",
                scale = 0.25/2
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."magnet-data_light.png",
                scale = 0.25/2
              }
            }
          },
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
    {
        name = "ei_fission-tech:u235",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "uranium-235", amount = 1},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
    {
        name = "ei_fission-tech:u233",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "ei_uranium-233", amount = 1},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
    {
        name = "ei_fission-tech:pt239",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "ei_plutonium-239", amount = 1},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
    {
        name = "ei_fission-tech:th232",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "ei_thorium-232", amount = 1},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
    {
        name = "ei_magnet-data",
        type = "recipe",
        category = "ei_quantum-computer",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 200},
            {type = "fluid", name = "ei_computing-power", amount = 200},
            {type = "item", name = "ei_magnet", amount = 2},
        },
        results = {
            {type = "item", name = "ei_magnet-data", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_magnet-data",
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
    {
        name = "ei_magnet-data",
        type = "technology",
        icon = ei_graphics_tech_path.."magnet-data.png",
        icon_size = 128,
        prerequisites = {"ei_quantum-computer"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_magnet-data"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_advanced-fission-tech",
        type = "technology",
        icon = ei_graphics_tech_path.."advanced-fission-tech.png",
        icon_size = 256,
        prerequisites = {"ei_neodym-refining"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_fission-tech:u235"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fission-tech:u233"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fission-tech:pt239"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fission-tech:th232"
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

--OTHER
------------------------------------------------------------------------------------------------------
data:extend({
    {
        type = "sprite",
        name = "ei_overload-icon",
        filename = ei_graphics_other_path.."overload-icon.png",
        size = 64,
        scale = 1
    },
    {
        type = "animation",
        name = "ei_overload-animation",
        filename = ei_graphics_other_path.."overload-animation.png",
        draw_as_glow = true,
        line_length = 16,
        width = 592/16,
        height = 35,
        frame_count = 16,
        animation_speed = 1,
        scale = 1,
    }
})