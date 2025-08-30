ei_data = require("lib/data")

--====================================================================================================
--QUANTUM COMPUTER
--====================================================================================================

data:extend({
    {
        name = "ei_accelerator",
        type = "recipe-category",
    },
    {
        name = "ei_accelerator",
        type = "item",
        icon = ei_graphics_item_2_path.."accelerator.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b5",
        place_result = "ei_accelerator",
        stack_size = 20
    },
    {
        name = "ei_accelerator",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients =
        {
            {type="item", name="ei_high-tech-parts", amount=20},
            {type="item", name="ei_plasma-heater", amount=2},
            {type="item", name="refined-concrete", amount=200},
            {type="item", name="ei_carbon-structure", amount=40},
            {type="item", name="ei_advanced-motor", amount=25}
        },
        results = {{type="item", name="ei_accelerator", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_accelerator",
    },
    {
        name = "ei_accelerator",
        type = "technology",
        icon = ei_graphics_tech_2_path.."accelerator.png",
        icon_size = 256,
        prerequisites = {"ei_high-tech-parts"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_accelerator"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_exotic-matter-up__conversion"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_exotic-matter-down__conversion"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["both-quantum-age"],
            time = 20
        },
        age = "both-quantum-age",
    },
    {
        name = "ei_accelerator",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_2_path.."accelerator.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_accelerator"
        },
        max_health = 1000,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-5.4, -5.4}, {5.4, 5.4}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_accelerator"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "100MW",
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_2_path.."accelerator_animation.png",
                size = {1024, 1014},
                shift = {0.75, -0.55},
                scale = 0.42,
                line_length = 4,
                lines_per_file = 4,
                frame_count = 16,
                animation_speed = 0.6,
                run_mode = "backward",
            },
            --[[
            working_visualisations = {
                {
                  animation = 
                  {
                    filename = ei_graphics_entity_2_path.."accelerator_animation.png",
                    size = {1024, 1014},
                    shift = {0.75, -0.55},
                    scale = 0.42,
                    line_length = 4,
                    lines_per_file = 4,
                    frame_count = 16,
                    animation_speed = 0.6,
                    run_mode = "backward",
                  }
                },
                {
                    light = {
                    type = "basic",
                    intensity = 1,
                    size = 15
                    }
                }
            },
            ]]
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/nuclear-reactor-1.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    },
    {
        name = "ei_exotic-matter-up__conversion",
        type = "recipe",
        category = "ei_accelerator",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_exotic-matter-down", amount = 1},
            {type = "item", name = "ei_charged-neutron-container", amount = 1},
            {type = "item", name = "ei_enriched-cryodust", amount = 1},
        },
        results = {
            {type = "item", name = "ei_exotic-matter-up", amount = 1, probability = 0.5},
            {type = "item", name = "ei_exotic-matter-down", amount = 1, probability = 0.5},
            {type = "item", name = "ei_charged-neutron-container", amount = 1, probability = 0.5},
            {type = "item", name = "ei_neutron-container", amount = 1, probability = 0.5},
            {type = "item", name = "ei_enriched-cryodust", amount = 1, probability = 0.75},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_exotic-matter-up",
        icon = ei_graphics_other_path.."up-conversion.png",
        icon_size = 128,
    },
    {
        name = "ei_exotic-matter-down__conversion",
        type = "recipe",
        category = "ei_accelerator",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_exotic-matter-up", amount = 1},
            {type = "item", name = "ei_charged-neutron-container", amount = 1},
            {type = "item", name = "ei_bio-matter", amount = 1},
        },
        results = {
            {type = "item", name = "ei_exotic-matter-down", amount = 1, probability = 0.5},
            {type = "item", name = "ei_exotic-matter-up", amount = 1, probability = 0.5},
            {type = "item", name = "ei_charged-neutron-container", amount = 1, probability = 0.5},
            {type = "item", name = "ei_neutron-container", amount = 1, probability = 0.5},
            {type = "item", name = "ei_bio-matter", amount = 1, probability = 0.75},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_exotic-matter-up",
        icon = ei_graphics_other_path.."down-conversion.png",
        icon_size = 128,
    },
})