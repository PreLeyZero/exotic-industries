ei_data = require("lib/data")

--====================================================================================================
--EXCHANGER
--====================================================================================================

data:extend({
    {
        name = "ei_exchanger",
        type = "recipe-category",
    },
    {
        name = "ei_exchanger",
        type = "item",
        icon = ei_graphics_item_path.."exchanger.png",
        icon_size = 64,
        subgroup = "ei_nuclear-buildings",
        order = "c-e",
        place_result = "ei_exchanger",
        stack_size = 50
    },
    {
        name = "ei_exchanger",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="heat-exchanger", amount=2},
            {type="item", name="ei_lead-plate", amount=20},
            {type="item", name="pipe", amount=10},
            {type="item", name="ei_advanced-motor", amount=5}
        },
        results = {{type="item", name="ei_exchanger", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_exchanger",
    },
    {
        name = "ei_exchanger",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."exchanger.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_exchanger"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_exchanger"},
        fixed_recipe = "ei_coolant-exchange",
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "500kW",
        graphics_set = {
            animation = {
                west = {
                    filename = ei_graphics_entity_path.."exchanger_vertical.png",
                    width = 192*2,
                    height = 256*2,
                    shift = {0, 0},
                    scale = 0.5/2,
                    line_length = 1,
                    --lines_per_file = 2,
                    frame_count = 1,
                    -- animation_speed = 0.2,
                },
                east = {
                    filename = ei_graphics_entity_path.."exchanger_vertical.png",
                    width = 192*2,
                    height = 256*2,
                    shift = {0, 0},
                    scale = 0.5/2,
                    line_length = 1,
                    --lines_per_file = 2,
                    frame_count = 1,
                    -- animation_speed = 0.2,
                },
                south = {
                    filename = ei_graphics_entity_path.."exchanger_horizontal.png",
                    width = 192*2,
                    height = 256*2,
                    shift = {0, 0},
                    scale = 0.5/2,
                    line_length = 1,
                    --lines_per_file = 2,
                    frame_count = 1,
                    -- animation_speed = 0.2,
                },
                north = {
                    filename = ei_graphics_entity_path.."exchanger_horizontal.png",
                    width = 192*2,
                    height = 256*2,
                    shift = {0, 0},
                    scale = 0.5/2,
                    line_length = 1,
                    --lines_per_file = 2,
                    frame_count = 1,
                    -- animation_speed = 0.2,
                },
            },
            --[[
            working_visualisations = {
                {
                animation = 
                {
                    filename = ei_graphics_entity_path.."exchanger_animation.png",
                    width = 192,
                    height = 256,
                    shift = {0,-0.2},
                    scale = 0.44/2,
                    line_length = 1,
                    lines_per_file = 1,
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
        allowed_effects = {"speed", "consumption", "pollution"},
        module_slots = 1,
        fluid_boxes = {
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_exchanger,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.east, position = {1, 1}},
                },
                production_type = "input",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_exchanger,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.east, position = {1, -1}},
                },
                production_type = "output",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_exchanger,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.west, position = {-1, 1}},
                },
                production_type = "input",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_exchanger,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.west, position = {-1, -1}},
                },
                production_type = "output",
            },
        },
    },
    {
        name = "ei_coolant-exchange",
        type = "recipe",
        category = "ei_exchanger",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_hot-coolant", amount = 25},
            {type = "fluid", name = "water", amount = 100},
        },
        results = {
            {type = "fluid", name = "ei_cold-coolant", amount = 25},
            {type = "fluid", name = "ei_critical-steam", amount = 25},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_critical-steam",
    },
})