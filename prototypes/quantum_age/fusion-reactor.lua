ei_data = require("lib/data")

--====================================================================================================
--QUANTUM COMPUTER
--====================================================================================================

data:extend({
    {
        name = "ei_fusion-reactor",
        type = "recipe-category",
    },
    {
        name = "ei_fusion-reactor",
        type = "item",
        icon = ei_graphics_item_path.."fusion-reactor.png",
        icon_size = 64,
        subgroup = "ei_nuclear-buildings",
        order = "c-d",
        place_result = "ei_fusion-reactor",
        stack_size = 1,
    },
    {
        name = "ei_fusion-reactor",
        type = "recipe",
        category = "crafting",
        energy_required = 40,
        ingredients =
        {
            {"ei_plasma-heater", 4},
            {"ei_magnet", 100},
            {"refined-concrete", 200},
            {"processing-unit", 300},
            {"ei_fusion-data", 200},
            {"ei_lead-plate", 100},
        },
        result = "ei_fusion-reactor",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_fusion-reactor",
    },
    {
        name = "ei_fusion-reactor",
        type = "technology",
        icon = ei_graphics_tech_path.."fusion-reactor.png",
        icon_size = 256,
        prerequisites = {"ei_fusion-data"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_fusion-reactor"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_dt-fusion"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_cold-coolant"
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
        name = "ei_fusion-reactor",
        type = "assembling-machine",
        icon = ei_graphics_item_path.."fusion-reactor.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_fusion-reactor"
        },
        max_health = 1000,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-5.4, -5.4}, {5.4, 5.4}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_fusion-reactor"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "500MW",
        fluid_boxes = {
            {   
                -- fusion inputs
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_nitrogen,
                pipe_connections = {
                    {type = "input", position = {6, 0}},
                },
                production_type = "input",
            },
            {   
                -- fusion inputs
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_nitrogen,
                pipe_connections = {
                    {type = "input", position = {-6, 0}},
                },
                production_type = "input",
            },
            {   
                -- coolant
                filter = "ei_cold-coolant",
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {type = "input", position = {0, 6}},
                },
                production_type = "input",
            },
            {   
                -- coolant
                filter = "ei_hot-coolant",
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {type = "output", position = {0, -6}},
                },
                production_type = "output",
            },
        },
        animation = {
            filename = ei_graphics_entity_path.."fusion-reactor.png",
            size = {512*2,512*2},
            shift = {0, 0},
	        scale = 0.35,
            line_length = 1,
            --lines_per_file = 2,
            frame_count = 1,
            -- animation_speed = 0.2,
        },
        working_visualisations = {
            {
              animation = 
              {
                filename = ei_graphics_entity_path.."fusion-reactor_animation-basic.png",
                size = {512*2,512*2},
                shift = {0, 0},
	            scale = 0.35,
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
        working_sound =
        {
            sound = {filename = "__base__/sound/nuclear-reactor-1.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    },
    {
        name = "ei_dt-fusion",
        type = "recipe",
        category = "ei_fusion-reactor",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_heated-deuterium", amount = 15},
            {type = "fluid", name = "ei_heated-tritium", amount = 15},
            {type = "fluid", name = "ei_cold-coolant", amount = 100},
        },
        results = {
            {type = "fluid", name = "ei_hot-coolant", amount = 100},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_hot-coolant",
    },
    {
        name = "ei_cold-coolant",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_nitric-acid", amount = 5},
            {type = "fluid", name = "ei_molten-lead", amount = 30},
        },
        results = {
            {type = "fluid", name = "ei_cold-coolant", amount = 25},
            {type = "fluid", name = "ei_dirty-water", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_cold-coolant",
    },
})