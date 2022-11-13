-- this file contains the prototype definition for varios stuff from computer age

local ei_data = require("lib/data")

--====================================================================================================
--PROTOTYPE DEFINITIONS
--====================================================================================================

--ITEMS
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_module-part",
        type = "item",
        icon = ei_graphics_item_path.."module-part.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "b7",
        stack_size = 50
    },
    {
        name = "ei_module-base",
        type = "item",
        icon = ei_graphics_item_path.."module-base.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "b8",
        stack_size = 50
    },
    {
        name = "ei_empty-cryo-container",
        type = "item",
        icon = ei_graphics_item_path.."empty-cryo-container.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "d[empty-barrel]-1",
        stack_size = 50
    },
    {
        name = "ei_cryo-container-nitrogen",
        type = "item",
        icon = ei_graphics_item_path.."cryo-container-nitrogen.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "d[empty-barrel]-1",
        stack_size = 50
    },
    --[[
    {
        name = "ei_charged-energy-crystal",
        type = "item",
        icon = ei_graphics_item_path.."charged-energy-crystal.png",
        icon_size = 64,
        subgroup = "raw-material",
        order = "g1",
        stack_size = 100
    },
    ]]
    {
        name = "ei_high-energy-crystal",
        type = "item",
        icon = ei_graphics_item_path.."high-energy-crystal.png",
        icon_size = 64,
        subgroup = "raw-material",
        order = "g1",
        stack_size = 100
    },
})

--RECIPES
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_molten-steel:mix",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_molten-iron", amount = 15},
            {type = "item", name = "ei_crushed-coke", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_molten-steel", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_molten-steel",
    },
    {
        name = "ei_module-part",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {"ei_electronic-parts", 2},
            {"ei_ceramic", 6},
        },
        result = "ei_module-part",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_module-part",
    },
    {
        name = "ei_module-base",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {"ei_module-part", 2},
            {"ei_energy-crystal", 4},
            {"ei_glass", 10},
        },
        result = "ei_module-base",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_module-base",
    },
    {
        name = "ei_emtpy-cryo-container",
        type = "recipe",
        category = "crafting",
        energy_required = 6,
        ingredients =
        {
            {"plastic-bar", 8},
            {"empty-barrel", 1},
            {"ei_ceramic", 10},
            {"ei_glass", 8},
        },
        result = "ei_empty-cryo-container",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_empty-cryo-container",
    },
    {
        name = "ei_fill-cryo-container-nitrogen",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 50},
            {type = "item", name = "ei_empty-cryo-container", amount = 1},
        },
        results = {
            {type = "item", name = "ei_cryo-container-nitrogen", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."fill-cryo-container-nitrogen.png",
        icon_size = 64,
        subgroup = "fill-barrel",
        order = "c-1",
    },
    {
        name = "ei_empty-cryo-container-nitrogen",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_cryo-container-nitrogen", amount = 1},
        },
        results = {
            {type = "item", name = "ei_empty-cryo-container", amount = 1},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 49},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."empty-cryo-container-nitrogen.png",
        icon_size = 64,
        subgroup = "empty-barrel",
        order = "c-1",
    },
    {
        name = "ei_crystal-solution",
        type = "recipe",
        category = "chemistry",
        energy_required = 10,
        ingredients = {
            {type = "fluid", name = "ei_hydrofluoric-acid", amount = 25},
            {type = "item", name = "ei_energy-crystal", amount = 5},
        },
        results = {
            {type = "fluid", name = "ei_crystal-solution", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crystal-solution",
    },
    {
        name = "ei_high-energy-crystal",
        type = "recipe",
        category = "centrifuging",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_crystal-solution", amount = 100},
        },
        results = {
            {type = "item", name = "ei_high-energy-crystal", amount = 1, probability = 0.001},
            {type = "fluid", name = "ei_crystal-solution", amount = 99},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_high-energy-crystal",
    },
    {
        name = "ei_high-energy-crystal:growing",
        type = "recipe",
        category = "ei_growing",
        energy_required = 120,
        ingredients = {
            {type = "fluid", name = "ei_crystal-solution", amount = 100},
            {type = "item", name = "ei_high-energy-crystal", amount = 1},
        },
        results = {
            {type = "item", name = "ei_high-energy-crystal", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_high-energy-crystal",
    },
})

--TECHS
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_advanced-steel",
        type = "technology",
        icon = ei_graphics_tech_path.."steel-processing.png",
        icon_size = 256,
        prerequisites = {"ei_computer-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_molten-steel:mix"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_high-energy-crystal",
        type = "technology",
        icon = ei_graphics_tech_path.."high-energy-crystal.png",
        icon_size = 128,
        prerequisites = {"ei_computer-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_crystal-solution"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_high-energy-crystal"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_high-energy-crystal:growing",
        type = "technology",
        icon = ei_graphics_tech_path.."high-energy-crystal-growing.png",
        icon_size = 256,
        prerequisites = {"ei_high-energy-crystal"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_high-energy-crystal:growing"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_cryo-container",
        type = "technology",
        icon = ei_graphics_tech_path.."cryo-container.png",
        icon_size = 128,
        prerequisites = {"ei_cooler"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_emtpy-cryo-container"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fill-cryo-container-nitrogen"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_empty-cryo-container-nitrogen"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
})

table.insert(data.raw["technology"]["speed-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-base"
})

table.insert(data.raw["technology"]["speed-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-part"
})

table.insert(data.raw["technology"]["productivity-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-base"
})

table.insert(data.raw["technology"]["productivity-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-part"
})

table.insert(data.raw["technology"]["effectivity-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-base"
})

table.insert(data.raw["technology"]["effectivity-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-part"
})