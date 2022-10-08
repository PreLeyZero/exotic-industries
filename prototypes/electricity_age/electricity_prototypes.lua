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
    {
        name = "ei_crushed-copper",
        type = "item",
        icon = ei_graphics_item_path.."crushed-copper.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-crushed",
        order = "a2",
    },
    {
        name = "ei_lithium",
        type = "item",
        icon = ei_graphics_item_path.."lithium.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-purified",
        order = "b-b",
    },
    {
        name = "ei_fluorite",
        type = "item",
        icon = ei_graphics_item_path.."fluorite.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-purified",
        order = "b-a",
    },
    {
        name = "ei_cpu",
        type = "item",
        icon = ei_graphics_item_path.."cpu.png",
        icon_size = 128,
        subgroup = "intermediate-product",
        order = "b5",
        stack_size = 50
    },
    {
        name = "ei_electronic-parts",
        type = "item",
        icon = ei_graphics_item_path.."electronic-parts.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "b6",
        stack_size = 100
    },
    -- new materials
    {
        name = "ei_crushed-gold",
        type = "item",
        icon = ei_graphics_item_path.."crushed-gold.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-crushed",
        order = "a4",
    },
    {
        name = "ei_gold-ingot",
        type = "item",
        icon = ei_graphics_item_path.."gold-ingot.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-ingot",
        order = "a4",
    },
    {
        name = "ei_gold-plate",
        type = "item",
        icon = ei_graphics_item_path.."gold-plate.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-plate",
        order = "a4",
    },
    {
        name = "ei_neodym-ingot",
        type = "item",
        icon = ei_graphics_item_path.."neodym-ingot.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-ingot",
        order = "a5",
    },
    {
        name = "ei_neodym-plate",
        type = "item",
        icon = ei_graphics_item_path.."neodym-plate.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-plate",
        order = "a5",
    },
    {
        name = "ei_lead-ingot",
        type = "item",
        icon = ei_graphics_item_path.."lead-ingot.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-ingot",
        order = "a6",
    },
    {
        name = "ei_lead-plate",
        type = "item",
        icon = ei_graphics_item_path.."lead-plate.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-plate",
        order = "a6",
    },
    {
        name = "ei_gold-chunk",
        type = "item",
        icon = ei_graphics_item_path.."gold-chunk.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-raw",
        order = "a-d",
    },
    {
        name = "ei_lead-chunk",
        type = "item",
        icon = ei_graphics_item_path.."lead-chunk.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-raw",
        order = "a-e",
    },
    {
        name = "ei_neodym-chunk",
        type = "item",
        icon = ei_graphics_item_path.."neodym-chunk.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-raw",
        order = "a-e",
    },
    {
        name = "ei_coal-chunk",
        type = "item",
        icon = ei_graphics_item_path.."coal-chunk.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-raw",
        order = "a-c",
    },
    {
        name = "ei_iron-chunk",
        type = "item",
        icon = ei_graphics_item_path.."iron-chunk.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-raw",
        order = "a-a",
    },
    {
        name = "ei_copper-chunk",
        type = "item",
        icon = ei_graphics_item_path.."copper-chunk.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-raw",
        order = "a-b",
    },
    {
        name = "ei_uranium-chunk",
        type = "item",
        icon = ei_graphics_item_path.."uranium-chunk.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-raw",
        order = "a-f",
    },
    {
        name = "ei_computer-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."computer-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a4",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."computer-age-tech.png",
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
    }
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
    {
        name = "ei_desulfurize-kerosene",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_kerosene", amount = 20},
        },
        results = {
            {type = "fluid", name = "ei_acidic-water", amount = 15},
            {type = "fluid", name = "ei_diesel", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_diesel",
        subgroup = "fluid-recipes",
        order = "a[fluid-chemistry]-a[ei_desulfurize-kerosene]",
    },
    {
        name = "ei_acidic-water:sulfur",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_acidic-water", amount = 10},
        },
        results = {
            {type = "item", name = "sulfur", amount = 1},
            {type = "fluid", name = "water", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "sulfur",
    },
    {
        name = "ei_sulfur:acidic-water",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "sulfur", amount = 1},
            {type = "fluid", name = "water", amount = 10},
        },
        results = {
            {type = "fluid", name = "ei_acidic-water", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_acidic-water",
        subgroup = "fluid-recipes",
        order = "a[fluid-chemistry]-a[ei_sulfur:acidic-water]",
    },
    {
        name = "ei_kerosene:heavy-oil",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "heavy-oil", amount = 30},
            {type = "fluid", name = "steam", amount = 15},
            {type = "item", name = "ei_coke", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_kerosene", amount = 20},
            {type = "fluid", name = "ei_coal-gas", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_kerosene",
        subgroup = "fluid-recipes",
        order = "a[fluid-chemistry]-c[kerosene]",
    },
    {
        name = "ei_electric-engine:lube",
        type = "recipe",
        category = "advanced-crafting",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 10},
            {type = "item", name = "engine-unit", amount = 1},
            {type = "item", name = "copper-cable", amount = 4},
            {type = "item", name = "ei_iron-mechanical-parts", amount = 2},
        },
        results = {
            {type = "item", name = "electric-engine-unit", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        icon_size = 64,
        icons = {
            {
                icon = ei_graphics_base_path.."electric-engine-unit.png",
            },
            {
                icon = ei_graphics_other_path.."lube_overlay.png",
            }
        },
    },
    {
        name = "ei_crushed-copper",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 1,
        ingredients = {
            {"ei_copper-ingot", 1},
        },
        results = {
            {type = "item", name = "ei_crushed-copper", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-copper",
    },
    {
        name = "ei_kerosene-cracking",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_kerosene", amount = 40},
            {type = "fluid", name = "water", amount = 30},
        },
        results = {
            {type = "fluid", name = "light-oil", amount = 30},
        },
        always_show_made_in = true,
        enabled = false,
        icon_size = 64,
        icon = ei_graphics_other_path.."kerosene-cracking.png",
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-a[kerosene-cracking]",
    },
    {
        name = "ei_cpu",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_semiconductor", amount = 1},
            {type = "item", name = "advanced-circuit", amount = 5},
        },
        results = {
            {type = "item", name = "ei_cpu", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_cpu",
    },
    {
        name = "ei_electronic-parts",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_cpu", amount = 2},
            {type = "item", name = "advanced-circuit", amount = 5},
            {type = "item", name = "battery", amount = 3},
            {type = "item", name = "ei_insulated-wire", amount = 2},
        },
        results = {
            {type = "item", name = "ei_electronic-parts", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_electronic-parts",
    },
    {
        name = "ei_computer-age-tech",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_electronic-parts", amount = 1},
            {type = "item", name = "ei_energy-crystal", amount = 5},
            {type = "item", name = "arithmetic-combinator", amount = 2},
            {type = "item", name = "decider-combinator", amount = 2},
            {type = "fluid", name = "lubricant", amount = 80},
        },
        results = {
            {type = "item", name = "ei_computer-age-tech", amount = 3},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_computer-age-tech",
    },
    {
        name = "ei_gold-ingot",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {type = "item", name = "ei_gold-chunk", amount = 3},
        },
        results = {
            {type = "item", name = "ei_gold-ingot", amount = 1},
            {type = "item", name = "ei_slag", amount = 1, probability = 0.05},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_gold-ingot",
    },
    {
        name = "ei_gold-plate",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_gold-ingot", amount = 1},
        },
        results = {
            {type = "item", name = "ei_gold-plate", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_gold-plate",
    },
    {
        name = "ei_crushed-gold",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_gold-ingot", amount = 1},
        },
        results = {
            {type = "item", name = "ei_crushed-gold", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-gold",
    },
    {
        name = "ei_crushed-gold:plate",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_gold-plate", amount = 1},
        },
        results = {
            {type = "item", name = "ei_crushed-gold", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-gold",
        hide_from_player_crafting = true,
    },
    {
        name = "ei_lead-ingot",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {type = "item", name = "ei_lead-chunk", amount = 3},
        },
        results = {
            {type = "item", name = "ei_lead-ingot", amount = 1},
            {type = "item", name = "ei_slag", amount = 1, probability = 0.05},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_lead-ingot",
    },
    {
        name = "ei_lead-plate",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_lead-ingot", amount = 1},
        },
        results = {
            {type = "item", name = "ei_lead-plate", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_lead-plate",
    },
    {
        name = "ei_neodym-ingot",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {type = "item", name = "ei_neodym-chunk", amount = 3},
        },
        results = {
            {type = "item", name = "ei_neodym-ingot", amount = 1},
            {type = "item", name = "ei_slag", amount = 1, probability = 0.05},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_neodym-ingot",
    },
    {
        name = "ei_neodym-plate",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_neodym-ingot", amount = 1},
        },
        results = {
            {type = "item", name = "ei_neodym-plate", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_neodym-plate",
    },
    {
        name = "ei_iron-ingot:chunk-smelting",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {type = "item", name = "ei_iron-chunk", amount = 3},
        },
        results = {
            {type = "item", name = "ei_iron-ingot", amount = 2},
            {type = "item", name = "ei_slag", amount = 1, probability = 0.05},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_iron-ingot",
    },
    {
        name = "ei_copper-ingot:chunk-smelting",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {type = "item", name = "ei_copper-chunk", amount = 3},
        },
        results = {
            {type = "item", name = "ei_copper-ingot", amount = 2},
            {type = "item", name = "ei_slag", amount = 1, probability = 0.05},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_copper-ingot",
    },
    {
        name = "ei_coal-chunk:crushing",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_coal-chunk", amount = 1},
        },
        results = {
            {type = "item", name = "coal", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "coal",
    },
    {
        name = "ei_drill-fluid",
        type = "recipe",
        category = "chemistry",
        energy_required = 16,
        ingredients = {
            {type = "item", name = "solid-fuel", amount = 4},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 1},
            {type = "fluid", name = "sulfuric-acid", amount = 10},
            {type = "fluid", name = "lubricant", amount = 20},
        },
        results = {
            {type = "fluid", name = "ei_drill-fluid", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_drill-fluid",
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
            ingredients = ei_data.science["electricity-age"],
            time = 20
        },
        age = "electricity-age",
    },
    {
        name = "ei_electronic-parts",
        type = "technology",
        icon = ei_graphics_tech_path.."electronic-parts.png",
        icon_size = 128,
        prerequisites = {"ei_waver-factory", "battery"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_cpu"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_electronic-parts"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["electricity-age"],
            time = 20
        },
        age = "electricity-age",
    },
    {
        name = "ei_deep-mining",
        type = "technology",
        icon = ei_graphics_tech_path.."deep-mining.png",
        icon_size = 128,
        prerequisites = {"automation-2", "sulfur-processing"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_gold-ingot"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_gold-plate"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_crushed-gold"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_crushed-gold:plate"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_lead-ingot"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_lead-plate"
            },
            --[[
            {
                type = "unlock-recipe",
                recipe = "ei_neodym-ingot"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_neodym-plate"
            },
            ]]
            {
                type = "unlock-recipe",
                recipe = "ei_iron-ingot:chunk-smelting"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_copper-ingot:chunk-smelting"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_coal-chunk:crushing"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_deep-drill"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_drill-fluid"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["electricity-age"],
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
table.insert(data.raw.technology["ei_electricity-age"].prerequisites, "ei_tank")
table.insert(data.raw.technology["lubricant"].prerequisites, "automation-2")
table.insert(data.raw.technology["power-armor"].prerequisites, "ei_grower")
table.insert(data.raw.technology["solar-energy"].prerequisites, "ei_waver-factory")
table.insert(data.raw.technology["ei_computer-age"].prerequisites, "ei_electronic-parts")

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

table.insert(data.raw.technology["sulfur-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_desulfurize-kerosene"
})

table.insert(data.raw.technology["sulfur-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_sulfur:acidic-water"
})

table.insert(data.raw.technology["sulfur-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_acidic-water:sulfur"
})

table.insert(data.raw.technology["coal-liquefaction"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_kerosene:heavy-oil"
})

table.insert(data.raw.technology["lubricant"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_electric-engine:lube"
})

table.insert(data.raw["technology"]["battery"].effects, {
    type = "unlock-recipe",
    recipe = "ei_crushed-copper"
})

table.insert(data.raw["technology"]["advanced-oil-processing"].effects, {
    type = "unlock-recipe",
    recipe = "ei_kerosene-cracking"
})

table.insert(data.raw["technology"]["ei_computer-age"].effects, {
    type = "unlock-recipe",
    recipe = "ei_computer-age-tech"
})

table.insert(data.raw["technology"]["ei_electricity-power"].effects, {
    type = "unlock-recipe",
    recipe = "electric-mining-drill"
})