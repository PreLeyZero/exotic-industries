-- this file contains the prototype definition for varios stuff from electricity age

local ei_data = require("lib/data")

--====================================================================================================
--PROTOTYPE DEFINITIONS
--====================================================================================================

--ITEMS
------------------------------------------------------------------------------------------------------

data:extend({
    {
        name = "ei_minigun",
        type = "gun",
        icon = ei_graphics_item_path.."minigun.png",
        icon_size = 128,
        stack_size = 1,
        subgroup = "gun",
        order = "a[basic-clips]-c[minigun]",
        attack_parameters = {
            ammo_category = "bullet",
            cooldown = 2,
            movement_slow_down_factor = 0.85,
            projectile_creation_distance = 1.125,
            range = 22,
            shell_particle = {
                center = {
                    0,
                    0.1
                },
                creation_distance = -0.5,
                direction_deviation = 0.1,
                name = "shell-particle",
                speed = 0.1,
                speed_deviation = 0.03,
                starting_frame_speed = 0.4,
                starting_frame_speed_deviation = 0.1
            },
            sound = {
                {
                    filename = "__base__/sound/fight/submachine-gunshot-1.ogg",
                    volume = 0.6
                },
                {
                    filename = "__base__/sound/fight/submachine-gunshot-2.ogg",
                    volume = 0.6
                },
                {
                    filename = "__base__/sound/fight/submachine-gunshot-3.ogg",
                    volume = 0.6
                }
            },
            type = "projectile"
          },
    },
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
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-copper.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-copper-1.png",
                scale = 0.5,
                size = 64
            },
        },
    },
    --[[
    {
        name = "ei_lithium",
        type = "item",
        icon = ei_graphics_item_path.."lithium-crystal.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-purified",
        order = "b-b",
    },
    ]]
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
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-gold.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-gold-1.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-gold-2.png",
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_crushed-sulfur",
        type = "item",
        icon = ei_graphics_item_path.."crushed-sulfur.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-crushed",
        order = "a5",
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-sulfur.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-sulfur-1.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-sulfur-2.png",
                scale = 0.5,
                size = 64
            },
        },
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
        order = "a6",
    },
    {
        name = "ei_neodym-plate",
        type = "item",
        icon = ei_graphics_item_path.."neodym-plate.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-plate",
        order = "a6",
    },
    {
        name = "ei_lead-ingot",
        type = "item",
        icon = ei_graphics_item_path.."lead-ingot.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-ingot",
        order = "a5",
    },
    {
        name = "ei_lead-plate",
        type = "item",
        icon = ei_graphics_item_path.."lead-plate.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-plate",
        order = "a5",
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
        name = "ei_sulfur-chunk",
        type = "item",
        icon = ei_graphics_item_path.."sulfur-chunk.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-raw",
        order = "a-f",
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
        name = "ei_diesel-fuel-unit",
        type = "item",
        icon = ei_graphics_item_path.."diesel-fuel-unit.png",
        icon_size = 80,
        stack_size = 10,
        subgroup = "raw-material",
        order = "c[solid-fuel]-a[diesel-fuel-unit]",
        fuel_category = "ei_diesel-fuel",
        fuel_value = "20MJ",
        fuel_acceleration_multiplier = 1.0,
        fuel_top_speed_multiplier = 1.0,
    },
    {
        name = "ei_electric-stone-quarry",
        type = "recipe",
        enabled = false,
        ingredients = {
            {type="item", name="ei_iron-beam", amount=2},
            {type="item", name="ei_iron-mechanical-parts", amount=4},
            {type="item", name="electric-engine-unit", amount=2},
            {type="item", name="ei_stone-quarry", amount=1}
        },
        results = {{type="item", name="ei_electric-stone-quarry", amount=1}},
        energy_required = 1,
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
                scale = 0.5
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."computer-age-tech_light.png",
                scale = 0.5
              }
            }
        },
    },
    {
        name = "ei_personal-solar-2",
        type = "item",
        icon = ei_graphics_item_path.."personal-solar-2.png",
        icon_size = 64,
        subgroup = "equipment",
        order = "a[energy-source]-b[personal-solar-panel]",
        stack_size = 20,
        place_as_equipment_result = "ei_personal-solar-2",
    },
    {
        name = "ei_personal-solar-2",
        type = "solar-panel-equipment",
        power = "70kW",
        categories = {"armor"},
        sprite = {
            filename = ei_graphics_other_path.."personal-solar-2.png",
            width = 64,
            height = 64,
            priority = "medium"
        },
        shape = {
            width = 1,
            height = 1,
            type = "full"
        },
        energy_source = {
            type = "electric",
            usage_priority = "primary-output"
        },
        take_result = "ei_personal-solar-2",
    }
})

--RECIPES
------------------------------------------------------------------------------------------------------

data:extend({
    {
        name = "ei_concrete__slag",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "stone-brick", amount = 10},
            {type = "item", name = "ei_sand", amount = 6},
            {type = "item", name = "ei_slag", amount = 20},
        },
        results = {
            {type = "item", name = "concrete", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "concrete",
    },
    {
        name = "ei_minigun",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "submachine-gun", amount = 4},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 20},
            {type = "item", name = "electric-engine-unit", amount = 12},
        },
        results = {
            {type = "item", name = "ei_minigun", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_minigun",
    },
    {
        name = "ei_personal-solar-2",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_solar-panel-2", amount = 4},
            {type = "item", name = "steel-plate", amount = 6},
            {type = "item", name = "solar-panel-equipment", amount = 2},
        },
        results = {
            {type = "item", name = "ei_personal-solar-2", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_personal-solar-2",
    },
    {
        name = "ei_diesel-fuel-unit",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_diesel", amount = 100},
            {type = "item", name = "barrel", amount = 1},
        },
        results = {
            {type = "item", name = "ei_diesel-fuel-unit", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_diesel-fuel-unit",
    },
    {
        name = "ei_benzol__coal-gas",
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
        name = "ei_plastic__benzol",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_benzol", amount = 10},
            {type = "fluid", name = "petroleum-gas", amount = 15},
        },
        results = {
            {type = "item", name = "plastic-bar", amount = 3},
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
            {type = "fluid", name = "ei_acidic-water", amount = 5},
            {type = "fluid", name = "ei_diesel", amount = 15},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_diesel",
        subgroup = "fluid-recipes",
        order = "a[fluid-chemistry]-a[ei_desulfurize-kerosene]",
    },
    {
        name = "ei_acidic-water__sulfur",
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
        name = "ei_sulfur__acidic-water",
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
        order = "a[fluid-chemistry]-a[ei_sulfur__acidic-water]",
    },
    {
        name = "ei_kerosene__heavy-oil",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "heavy-oil", amount = 25},
            {type = "fluid", name = "steam", amount = 15},
            {type = "item", name = "ei_coke", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_kerosene", amount = 20},
            {type = "fluid", name = "ei_coal-gas", amount = 35},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_kerosene",
        subgroup = "fluid-recipes",
        order = "a[fluid-chemistry]-c[kerosene]",
    },
    {
        name = "ei_coal-gas__reforming",
        type = "recipe",
        category = "oil-processing",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_coal-gas", amount = 45},
            {type = "fluid", name = "steam", amount = 10},
        },
        results = {
            {type = "fluid", name = "ei_benzol", amount = 30},
            {type = "fluid", name = "petroleum-gas", amount = 15},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_benzol",
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-c[benzol]",
    },
    {
        name = "ei_benzol__petroleum",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_benzol", amount = 30},
        },
        results = {
            {type = "fluid", name = "petroleum-gas", amount = 15},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "petroleum-gas",
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-b[petroleum]",
    },
    {
        name = "ei_electric-engine__lube",
        type = "recipe",
        category = "advanced-crafting",
        energy_required = 6,
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
            {type="item", name="ei_copper-ingot", amount=1},
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
        energy_required = 8,
        ingredients = {
            {type = "item", name = "ei_semiconductor", amount = 1},
            {type = "item", name = "advanced-circuit", amount = 2},
            {type = "item", name = "ei_crushed-gold", amount = 3},
        },
        results = {
            {type = "item", name = "ei_cpu", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_cpu",
    },
    {
        name = "ei_electronic-parts",
        type = "recipe",
        category = "crafting",
        energy_required = 6,
        ingredients = {
            {type = "item", name = "ei_cpu", amount = 1},
            {type = "item", name = "advanced-circuit", amount = 4},
            {type = "item", name = "battery", amount = 3},
            {type = "item", name = "ei_insulated-wire", amount = 2},
        },
        results = {
            {type = "item", name = "ei_electronic-parts", amount = 3},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_electronic-parts",
    },
    {
        name = "ei_computer-age-tech",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 18,
        ingredients = {
            {type = "item", name = "ei_electronic-parts", amount = 2},
            {type = "item", name = "ei_energy-crystal", amount = 3},
            {type = "item", name = "decider-combinator", amount = 2},
            {type = "fluid", name = "lubricant", amount = 25},
        },
        results = {
            {type = "item", name = "ei_computer-age-tech", amount = 8},
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
        name = "ei_crushed-gold__plate",
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
        name = "ei_iron-ingot__chunk-smelting",
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
        name = "ei_copper-ingot__chunk-smelting",
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
        name = "ei_coal-chunk__crushing",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_coal-chunk", amount = 1},
        },
        results = {
            {type = "item", name = "coal", amount = 4},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "coal",
    },
    {
        name = "ei_sulfur-chunk__crushing",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_sulfur-chunk", amount = 1},
        },
        results = {
            {type = "item", name = "ei_crushed-sulfur", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-sulfur",
    },
    {
        name = "ei_acidic-water__crushed-sulfur",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_crushed-sulfur", amount = 4},
            {type = "fluid", name = "water", amount = 40},
        },
        results = {
            {type = "fluid", name = "ei_acidic-water", amount = 20},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_acidic-water",
        subgroup = "fluid-recipes",
        order = "a[fluid-chemistry]-a[ei_crushed-sulfur__acidic-water]",
    },
    {
        name = "ei_drill-fluid",
        type = "recipe",
        category = "chemistry",
        energy_required = 8,
        ingredients = {
            {type = "item", name = "solid-fuel", amount = 4},
            {type = "item", name = "ei_iron-mechanical-parts", amount = 1},
            {type = "fluid", name = "sulfuric-acid", amount = 10},
            {type = "fluid", name = "lubricant", amount = 20},
        },
        results = {
            {type = "fluid", name = "ei_drill-fluid", amount = 30},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_drill-fluid",
    },
    {
        name = "ei_lube-destilation",
        type = "recipe",
        category = "chemistry",
        energy_required = 4,
        ingredients = {
            {type = "fluid", name = "steam", amount = 5},
            {type = "fluid", name = "lubricant", amount = 20},
        },
        results = {
            {type = "fluid", name = "heavy-oil", amount = 15},
            {type = "item", name = "coal", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "heavy-oil",
        icon = ei_graphics_tech_path.."lube-extraction.png",
        icon_size = 64,
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-g[lube-extraction]",
    },
    {
        name = "ei_green-circuit__waver",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 10,
        ingredients = {
            {type = "fluid", name = "sulfuric-acid", amount = 10},
            {type = "item", name = "copper-cable", amount = 20},
            {type = "item", name = "iron-plate", amount = 10},
            {type = "item", name = "ei_semiconductor", amount = 1},
        },
        results = {
            {type = "item", name = "electronic-circuit", amount = 20},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "electronic-circuit",
        icon = ei_graphics_other_path.."green-circuit.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "e[electronic-circuit]-1",
    },
    {
        name = "ei_red-circuit__waver",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 18,
        ingredients = {
            {type = "fluid", name = "sulfuric-acid", amount = 10},
            {type = "item", name = "ei_insulated-wire", amount = 8},
            {type = "item", name = "electronic-circuit", amount = 6},
            {type = "item", name = "ei_semiconductor", amount = 1},
        },
        results = {
            {type = "item", name = "advanced-circuit", amount = 4},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "advanced-circuit",
        icon = ei_graphics_other_path.."red-circuit.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "f[advanced-circuit]-1",
    },
    {
        name = "ei_molten-glass",
        type = "recipe",
        category = "ei_arc-furnace",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_sand", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_molten-glass", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_molten-glass",
    },
    {
        name = "ei_cast-glass",
        type = "recipe",
        category = "ei_casting",
        energy_required = 0.5,
        ingredients = {
            {type = "fluid", name = "ei_molten-glass", amount = 5},
        },
        results = {
            {type = "item", name = "ei_glass", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_glass",
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
                recipe = "ei_benzol__coal-gas"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_plastic__benzol"
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
        name = "ei_lube-destilation",
        type = "technology",
        icon = ei_graphics_tech_path.."lube-extraction.png",
        icon_size = 64,
        prerequisites = {"lubricant"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_lube-destilation"
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
        name = "ei_circuit-waver",
        type = "technology",
        icon = ei_graphics_tech_path.."circuit-waver.png",
        icon_size = 128,
        prerequisites = {"ei_waver-factory"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_green-circuit__waver"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_red-circuit__waver"
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
        name = "ei_molten-glass",
        type = "technology",
        icon = ei_graphics_tech_path.."molten-glass.png",
        icon_size = 128,
        prerequisites = {"ei_arc-furnace"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_molten-glass"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_cast-glass"
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
                recipe = "ei_crushed-gold__plate"
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
                recipe = "ei_iron-ingot__chunk-smelting"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_copper-ingot__chunk-smelting"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_coal-chunk__crushing"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_sulfur-chunk__crushing"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_acidic-water__crushed-sulfur"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_deep-drill"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_drill-fluid"
            },
            {
                type="mining-with-fluid", 
                modifier=true
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
        name = "ei_personal-solar-2",
        type = "technology",
        icon = ei_graphics_tech_path.."personal-solar-2.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_solar-panel-2", "solar-panel-equipment"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_personal-solar-2"
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
        name = "ei_minigun",
        type = "technology",
        icon = ei_graphics_tech_path.."minigun.png",
        icon_size = 256,
        prerequisites = {"military-3"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_minigun"
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
-- table.insert(data.raw.technology["ei_electricity-age"].prerequisites, "logistics")
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
    recipe = "ei_sulfur__acidic-water"
})

table.insert(data.raw.technology["sulfur-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_acidic-water__sulfur"
})

table.insert(data.raw.technology["coal-liquefaction"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_kerosene__heavy-oil"
})

table.insert(data.raw.technology["lubricant"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_electric-engine__lube"
})

table.insert(data.raw["technology"]["battery"].effects, {
    type = "unlock-recipe",
    recipe = "ei_crushed-copper"
})

table.insert(data.raw["technology"]["advanced-oil-processing"].effects, {
    type = "unlock-recipe",
    recipe = "ei_kerosene-cracking"
})

table.insert(data.raw["technology"]["coal-liquefaction"].effects, {
    type = "unlock-recipe",
    recipe = "ei_coal-gas__reforming"
})

table.insert(data.raw["technology"]["coal-liquefaction"].effects, {
    type = "unlock-recipe",
    recipe = "ei_benzol__petroleum"
})

table.insert(data.raw["technology"]["ei_computer-age"].effects, {
    type = "unlock-recipe",
    recipe = "ei_computer-age-tech"
})

table.insert(data.raw["technology"]["ei_electricity-power"].effects, {
    type = "unlock-recipe",
    recipe = "electric-mining-drill"
})

table.insert(data.raw["technology"]["ei_electricity-power"].effects, {
    type = "unlock-recipe",
    recipe = "ei_electric-stone-quarry"
})

table.insert(data.raw["technology"]["railway"].effects, {
    type = "unlock-recipe",
    recipe = "ei_diesel-fuel-unit"
})

table.insert(data.raw["technology"]["concrete"].effects, {
    type = "unlock-recipe",
    recipe = "ei_concrete__slag"
})

--OTHER
------------------------------------------------------------------------------------------------------

-- make electric powered surface miner using steam age ei_stone-quarry

quarry = table.deepcopy(data.raw["assembling-machine"]["ei_stone-quarry"])
quarry.name = "ei_electric-stone-quarry"
quarry.minable.result = "ei_electric-stone-quarry"
quarry.energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
}
quarry.allowed_effects = {"speed", "productivity", "consumption", "pollution"}
quarry.module_slots = 2
quarry.circircuit_wire_max_distance = 9

data:extend({
    {
        name = "ei_electric-stone-quarry",
        type = "item",
        icons = {
            {
                icon = ei_graphics_kirazy_path.."icon/electric-mining-drill.png",
                icon_size = 64,
                icon_mipmaps = 4,
            },
            {
                icon = ei_graphics_other_path.."power_overlay.png",
                icon_size = 64,
            }
        },
        place_result = "ei_electric-stone-quarry",
        stack_size = 20,
        subgroup = "extraction-machine",
        order = "a[items]-a[stone-quarry]-a",
    },
    quarry,
})