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
    {
        name = "ei_cryo-container-oxygen",
        type = "item",
        icon = ei_graphics_item_path.."cryo-container-oxygen.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "d[empty-barrel]-2",
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
    {
        name = "ei_advanced-motor",
        type = "item",
        icon = ei_graphics_item_path.."advanced-motor.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "i[electric-engine-unit]-1",
        stack_size = 50
    },
    {
        name = "ei_rocket-parts",
        type = "item",
        icon = ei_graphics_item_path.."rocket-parts.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "p[rocket-fuel]-x-1",
        stack_size = 100
    },
    {
        name = "ei_advanced-computer-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."advanced-computer-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a4-1",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."advanced-computer-age-tech.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."computer-age-tech_light.png",
                scale = 0.25
              }
            }
        },
    },
    {
        name = "ei_quantum-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."quantum-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a5",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."quantum-age-tech.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."quantum-age-tech_light.png",
                scale = 0.25
              }
            }
        },
    },
    --[[
    {
        name = "ei_advanced-faulty-semiconductor",
        type = "item",
        icon = ei_graphics_item_path.."advanced-faulty-waver.png",
        icon_size = 128,
        subgroup = "intermediate-product",
        order = "b4",
        stack_size = 50
    },
    ]]
    {
        name = "ei_advanced-semiconductor",
        type = "item",
        icon = ei_graphics_item_path.."advanced-waver.png",
        icon_size = 128,
        subgroup = "intermediate-product",
        order = "b3-1",
        stack_size = 50
    },
})

--RECIPES
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_advanced-semiconductor",
        type = "recipe",
        category = "ei_waver-factory",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_nitric-acid", amount = 10},
            {type = "item", name = "ei_sand", amount = 4},
            {type = "item", name = "ei_semiconductor", amount = 1},
        },
        results = {
            {type = "item", name = "ei_advanced-semiconductor", amount = 1, probability = 0.75},
            {type = "item", name = "ei_faulty-semiconductor", amount = 1, probability = 0.25},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_advanced-semiconductor",
    },
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
        name = "ei_rocket-parts",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {"rocket-control-unit", 2},
            {"low-density-structure", 6},
            {"ei_steel-mechanical-parts", 20},
            {"ei_insulated-wire", 10},
        },
        result = "ei_rocket-parts",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_rocket-parts",
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
        name = "ei_fill-cryo-container-oxygen",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_liquid-oxygen", amount = 50},
            {type = "item", name = "ei_empty-cryo-container", amount = 1},
        },
        results = {
            {type = "item", name = "ei_cryo-container-oxygen", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."fill-cryo-container-oxygen.png",
        icon_size = 64,
        subgroup = "fill-barrel",
        order = "c-2",
    },
    {
        name = "ei_empty-cryo-container-oxygen",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_cryo-container-oxygen", amount = 1},
        },
        results = {
            {type = "item", name = "ei_empty-cryo-container", amount = 1},
            {type = "fluid", name = "ei_liquid-oxygen", amount = 49},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."empty-cryo-container-oxygen.png",
        icon_size = 64,
        subgroup = "empty-barrel",
        order = "c-2",
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
        energy_required = 60,
        ingredients = {
            {type = "fluid", name = "ei_crystal-solution", amount = 5},
            {type = "item", name = "ei_high-energy-crystal", amount = 1},
        },
        results = {
            {type = "item", name = "ei_high-energy-crystal", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_high-energy-crystal",
    },
    {
        name = "ei_quantum-age-tech",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {"ei_simulation-data", 20},
            {"ei_space-data", 2},
            {"ei_high-energy-crystal", 1},
        },
        result = "ei_quantum-age-tech",
        result_count = 4,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_quantum-age-tech",
    },
    {
        name = "ei_hydrogen",
        type = "recipe",
        category = "chemistry",
        energy_required = 10,
        ingredients = {
            {type = "fluid", name = "water", amount = 10},
        },
        results = {
            {type = "fluid", name = "ei_oxygen-gas", amount = 5},
            {type = "fluid", name = "ei_hydrogen-gas", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_hydrogen-gas",
    },
    {
        name = "ei_ammonia",
        type = "recipe",
        category = "chemistry",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_hydrogen-gas", amount = 30},
            {type = "fluid", name = "ei_nitrogen-gas", amount = 20},
        },
        results = {
            {type = "fluid", name = "ei_ammonia-gas", amount = 20},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_ammonia-gas",
    },
    {
        name = "ei_dinitrogen-tetroxide",
        type = "recipe",
        category = "chemistry",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_ammonia-gas", amount = 40},
            {type = "fluid", name = "ei_oxygen-gas", amount = 70},
        },
        results = {
            {type = "fluid", name = "ei_dinitrogen-tetroxide-gas", amount = 20},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_dinitrogen-tetroxide-gas",
    },
    {
        name = "ei_dinitrogen-tetroxide-water-solution",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_dinitrogen-tetroxide-gas", amount = 10},
            {type = "fluid", name = "water", amount = 10},
        },
        results = {
            {type = "fluid", name = "ei_dinitrogen-tetroxide-water-solution", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_dinitrogen-tetroxide-water-solution",
    },
    {
        name = "ei_nitric-acid",
        type = "recipe",
        category = "chemistry",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_dinitrogen-tetroxide-water-solution", amount = 20},
            {type = "fluid", name = "ei_oxygen-gas", amount = 10},
        },
        results = {
            {type = "fluid", name = "ei_nitric-acid", amount = 40},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_nitric-acid",
    },
    {
        name = "ei_advanced-computer-age-tech",
        type = "recipe",
        category = "advanced-crafting",
        energy_required = 5,
        ingredients = {
            {type = "item", name = "ei_simulation-data", amount = 2},
            {type = "item", name = "electric-engine-unit", amount = 3},
            {type = "item", name = "arithmetic-combinator", amount = 2},
            {type = "fluid", name = "ei_ammonia-gas", amount = 50},
        },
        results = {
            {type = "item", name = "ei_advanced-computer-age-tech", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_advanced-computer-age-tech",
    },
    {
        name = "ei_advanced-motor",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "electric-engine-unit", amount = 1},
            {type = "item", name = "advanced-circuit", amount = 2},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 4},
            {type = "fluid", name = "lubricant", amount = 20},
        },
        results = {
            {type = "item", name = "ei_advanced-motor", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_advanced-motor",
    },
    {
        name = "ei_battery:lithium",
        type = "recipe",
        category = "chemistry",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_lithium-crystal", amount = 3},
            {type = "item", name = "ei_ceramic", amount = 2},
            {type = "fluid", name = "sulfuric-acid", amount = 25},
        },
        results = {
            {type = "item", name = "battery", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "battery",
        icon = ei_graphics_other_path.."lithium-battery.png",
        icon_size = 64,
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
        name = "ei_lithium-battery",
        type = "technology",
        icon = ei_graphics_tech_path.."lithium-battery.png",
        icon_size = 256,
        prerequisites = {"advanced-electronics-2"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_battery:lithium"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_lithium-crystal"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["advanced-computer-age"],
            time = 20
        },
        age = "advanced-computer-age",
    },
    {
        name = "ei_oxygen-gas",
        type = "technology",
        icon = ei_graphics_tech_path.."oxygen-lufter.png",
        icon_size = 128,
        prerequisites = {"ei_cooler"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_oxygen-gas"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_liquid-oxygen"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_oxygen-gas:vent"
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
        name = "ei_rocket-parts",
        type = "technology",
        icon = ei_graphics_tech_path.."rocket-parts.png",
        icon_size = 128,
        prerequisites = {"rocket-control-unit", "low-density-structure", "rocketry"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_rocket-parts"
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
    {
        name = "ei_oxygen-cryo-container",
        type = "technology",
        icon = ei_graphics_tech_path.."oxygen-cryo-container.png",
        icon_size = 128,
        prerequisites = {"ei_cryo-container", "ei_oxygen-gas"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_fill-cryo-container-oxygen"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_empty-cryo-container-oxygen"
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
        name = "ei_ammonia",
        type = "technology",
        icon = ei_graphics_tech_path.."ammonia.png",
        icon_size = 128,
        prerequisites = {"ei_cooler"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_ammonia"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_hydrogen"
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
        name = "ei_dinitrogen-tetroxide",
        type = "technology",
        icon = ei_graphics_tech_path.."dinitrogen-tetroxide.png",
        icon_size = 128,
        prerequisites = {"ei_ammonia", "ei_oxygen-gas"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_dinitrogen-tetroxide"
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
        name = "ei_nitric-acid",
        type = "technology",
        icon = ei_graphics_tech_path.."nitric-acid.png",
        icon_size = 128,
        prerequisites = {"ei_dinitrogen-tetroxide"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_dinitrogen-tetroxide-water-solution"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_nitric-acid"
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

table.insert(data.raw["technology"]["advanced-electronics-2"].effects, {
    type = "unlock-recipe",
    recipe = "ei_advanced-semiconductor"
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

table.insert(data.raw["technology"]["ei_quantum-age"].effects, {
    type = "unlock-recipe",
    recipe = "ei_quantum-age-tech"
})

table.insert(data.raw["technology"]["automation-3"].effects, {
    type = "unlock-recipe",
    recipe = "ei_advanced-motor"
})

table.insert(data.raw.technology["ei_quantum-age"].prerequisites, "rocket-silo")
table.insert(data.raw.technology["ei_quantum-age"].prerequisites, "ei_big-lab")