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
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-coke.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-coke-1.png",
                scale = 0.5,
                size = 64
            },
        },
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
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-iron.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-iron-1.png",
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_steel-blend",
        type = "item",
        icon = ei_graphics_item_path.."steel-blend.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-crushed",
        order = "a3",
        pictures = {
            {
                filename = ei_graphics_item_path.."steel-blend.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."steel-blend-1.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."steel-blend-2.png",
                scale = 0.5,
                size = 64
            },
        },
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
    {
        name = "ei_sand",
        type = "item",
        icon = ei_graphics_item_path.."sand.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-crushed",
        order = "c1",
        pictures = {
            {
                filename = ei_graphics_item_path.."sand.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."sand-1.png",
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_ceramic",
        type = "item",
        icon = ei_graphics_item_path.."ceramic.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-secondary",
        order = "a8",
    },
    {
        name = "ei_electron-tube",
        type = "item",
        icon = ei_graphics_item_path.."electron-tube.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "intermediate-product",
        order = "b2",
    },
    {
        name = "ei_glass",
        type = "item",
        icon = ei_graphics_item_path.."glass.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-ingot",
        order = "c1",
    },
    {
        name = "ei_electricity-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."electric-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a3",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."electric-age-tech.png",
                scale = 0.5
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."electric-age-tech_light.png",
                scale = 0.5
              }
            }
        },
    }
})


--RECIPES
------------------------------------------------------------------------------------------------------

data:extend({
    {
        name = "ei_charcoal",
        type = "recipe",
        category = "ei_coke-furnace",
        energy_required = 3,
        ingredients = {
            {type="item", name="wood", amount=2}
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
        category = "ei_coke-furnace",
        energy_required = 1.5,
        ingredients = {
            {type="item", name="coal", amount=1}
        },
        results = {
            {type = "item", name = "ei_coke", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_coke",
    },
    {
        name = "ei_coke__charcoal",
        type = "recipe",
        category = "ei_coke-furnace",
        energy_required = 1.5,
        ingredients = {
            {type="item", name="ei_charcoal", amount=1}
        },
        results = {
            {type = "item", name = "ei_coke", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_coke",
    },
    {
        name = "ei_coke__advanced_coal",
        type = "recipe",
        category = "oil-processing",
        energy_required = 3.5,
        ingredients = {
            {type="item", name="coal", amount=4}
        },
        results = {
            {type = "item", name = "ei_coke", amount = 6},
            {type = "fluid", name = "ei_coal-gas", amount = 25},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_coke",
    },
    {
        name = "ei_coke__advanced_charcoal",
        type = "recipe",
        category = "oil-processing",
        energy_required = 3.5,
        ingredients = {
            {type="item", name="ei_charcoal", amount=4}
        },
        results = {
            {type = "item", name = "ei_coke", amount = 6},
            {type = "fluid", name = "ei_coal-gas", amount = 25},
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
            {type="item", name="ei_coke", amount=5}
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
        category = "ei_crushing",
        energy_required = 1,
        ingredients = {
            {type="item", name="ei_coke", amount=1}
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
        category = "ei_crushing",
        energy_required = 1,
        ingredients = {
            {type="item", name="ei_iron-ingot", amount=1}
        },
        results = {
            {type = "item", name = "ei_crushed-iron", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-iron",
    },
    {
        name = "ei_crushed-iron__plate",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 1,
        ingredients = {
            {type="item", name="iron-plate", amount=1}
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
        name = "ei_crushed-iron__beam",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 1,
        ingredients = {
            {type="item", name="ei_iron-beam", amount=1}
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
        name = "ei_crushed-iron__mechanical-parts",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 1,
        ingredients = {
            {type="item", name="ei_iron-mechanical-parts", amount=1}
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
            {type="item", name="ei_crushed-coke", amount=2},
            {type="item", name="ei_crushed-iron", amount=5}
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
            {type="item", name="ei_steel-blend", amount=1}
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
            {type="item", name="ei_steel-ingot", amount=1}
        },
        results = {
            {type = "item", name = "ei_steel-mechanical-parts", amount = 2},
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
            {type="item", name="ei_steel-ingot", amount=2}
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
            {type="item", name="ei_iron-beam", amount=10},
            {type="item", name="pipe", amount=4},
            {type="item", name="ei_copper-mechanical-parts", amount=6}
        },
        results = {
            {type = "item", name = "storage-tank", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "storage-tank",
    },
    {
        name = "ei_solid-fuel__residual-oil",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type="fluid", name="ei_residual-oil", amount=30}
        },
        results = {
            {type = "item", name = "solid-fuel", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."residual-oil_solid-fuel.png",
        icon_size = 64,
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-c[solid-fuel__residual-oil]",
    },
    {
        name = "ei_sand",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 1,
        ingredients = {
            {type="item", name="stone", amount=1},
        },
        results = {
            {type = "item", name = "ei_sand", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_sand",
    },
    {
        name = "ei_glass",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {type="item", name="ei_sand", amount=1},
        },
        results = {
            {type = "item", name = "ei_glass", amount = 1},
            {type = "item", name = "ei_slag", amount = 1, probability = 0.1}
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_glass",
    },
    {
        name = "ei_ceramic__steam-assembler",
        type = "recipe",
        category = "ei_steam-assembler",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_sand", amount = 2},
            {type = "fluid", name = "steam", amount = 15}
        },
        results = {
            {type = "item", name = "ei_ceramic", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_ceramic",
    },
    {
        name = "ei_ceramic",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_sand", amount = 2},
            {type = "fluid", name = "steam", amount = 15}
        },
        results = {
            {type = "item", name = "ei_ceramic", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_ceramic",
    },
    {
        name = "ei_electron-tube",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "copper-cable", amount = 1},
            {type = "item", name = "ei_glass", amount = 1},
            {type = "item", name = "ei_ceramic", amount = 1}
        },
        results = {
            {type = "item", name = "ei_electron-tube", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_electron-tube",
    },
    {
        name = "ei_electricity-age-tech",
        type = "recipe",
        category = "crafting",
        energy_required = 18,
        ingredients = {
            {type = "item", name = "electronic-circuit", amount = 3},
            {type = "item", name = "engine-unit", amount = 2},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 3}
        },
        results = {
            {type = "item", name = "ei_electricity-age-tech", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_electricity-age-tech",
    },
    {
        name = "ei_landfill__sand",
        type = "recipe",
        category = "crafting",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_sand", amount = 50},
        },
        results = {
            {type = "item", name = "landfill", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "landfill",
    },
})

--TECHS
------------------------------------------------------------------------------------------------------

data:extend({
    {
        name = "ei_steam-power",
        type = "technology",
        icon = ei_graphics_tech_path.."steam-power.png",
        icon_size = 128,
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
                recipe = "ei_coke__charcoal"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_coke-pellets"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_coke-furnace"
            },
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
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        age = "steam-age",
    },
    {
        name = "ei_advanced-coke-processing",
        type = "technology",
        icon = ei_graphics_tech_path.."advanced-coke-processing.png",
        icon_size = 128,
        prerequisites = {"ei_steam-oil-processing"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_coke__advanced_coal"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_coke__advanced_charcoal"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        age = "steam-age",
    },
    {
        name = "ei_glass",
        type = "technology",
        icon = ei_graphics_tech_path.."glass.png",
        icon_size = 128,
        prerequisites = {"ei_steam-crusher"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_sand"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_glass"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_landfill__sand"
            },
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