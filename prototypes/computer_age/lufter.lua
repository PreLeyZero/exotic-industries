ei_data = require("lib/data")

--====================================================================================================
--LUFTER
--====================================================================================================

data:extend({
    {
        name = "ei_lufter",
        type = "recipe-category",
    },
    {
        name = "ei_lufter",
        type = "item",
        icon = ei_graphics_item_path.."lufter.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d-a-c",
        place_result = "ei_lufter",
        stack_size = 50
    },
    {
        name = "ei_lufter",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"electronic-circuit", 2},
            {"electric-engine-unit", 8},
            {"steel-plate", 4},
            {"ei_steel-mechanical-parts", 12}
        },
        result = "ei_lufter",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_lufter",
    },
    {
        name = "ei_lufter",
        type = "assembling-machine",
        icon = ei_graphics_item_path.."lufter.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_lufter"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_lufter"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "300kW",
        animation = {
            filename = ei_graphics_entity_path.."lufter.png",
            size = {512,512},
            width = 512,
            height = 512,
            shift = {0,-0.2},
	        scale = 0.44/2,
            line_length = 1,
            --lines_per_file = 2,
            frame_count = 1,
            -- animation_speed = 0.2,
        },
        allowed_effects = {"speed", "consumption", "pollution"},
        module_specification = {
            module_slots = 1
        },
        fluid_boxes = {
            {   
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_electricity,
                pipe_connections = {
                    {type = "output", position = {2, 0}},
                },
                production_type = "output",
            },
            {   
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_electricity,
                pipe_connections = {
                    {type = "input", position = {-2, 0}},
                },
                production_type = "input",
            },
            off_when_no_fluid_recipe = true
        },
        working_visualisations = {
            {
              animation = 
              {
                filename = ei_graphics_entity_path.."lufter_animation.png",
                size = {512,512},
                width = 512,
                height = 512,
                shift = {0,-0.2},
	            scale = 0.44/2,
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
            sound = {filename = "__base__/sound/electric-mining-drill.ogg", volume = 0.8},
            apparent_volume = 0.3,
        },
    },
    {
        name = "ei_nitrogen-gas",
        type = "recipe",
        category = "ei_lufter",
        energy_required = 1,
        ingredients = {},
        results = {
            {type = "fluid", name = "ei_nitrogen-gas", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_nitrogen-gas",
    },
    {
        name = "ei_nitrogen-gas:vent",
        type = "recipe",
        category = "ei_lufter",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_nitrogen-gas", amount = 20},
        },
        results = {},
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."vent_nitrogen.png",
        icon_size = 64,
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-h[ei_nitrogen-gas:vent]"
    },
    {
        name = "ei_oxygen-gas",
        type = "recipe",
        category = "ei_lufter",
        energy_required = 1,
        ingredients = {},
        results = {
            {type = "fluid", name = "ei_oxygen-gas", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_oxygen-gas",
    },
    {
        name = "ei_oxygen-gas:vent",
        type = "recipe",
        category = "ei_lufter",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_oxygen-gas", amount = 20},
        },
        results = {},
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."vent_oxygen.png",
        icon_size = 64,
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-h[ei_oxygen-gas:vent]"
    },
})