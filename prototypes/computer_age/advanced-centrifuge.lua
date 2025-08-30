ei_data = require("lib/data")

--====================================================================================================
--ADVANCED CENTRIFUGE
--====================================================================================================

data:extend({
    {
        name = "ei_advanced-centrifuge",
        type = "recipe-category",
    },
    {
        name = "ei_advanced-centrifuge",
        type = "item",
        icon = ei_graphics_item_path.."advanced-centrifuge.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "g[centrifuge]-a",
        place_result = "ei_advanced-centrifuge",
        stack_size = 50
    },
    {
        name = "ei_advanced-centrifuge",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {type="item", name="centrifuge", amount=2},
            {type="item", name="ei_advanced-motor", amount=10},
            {type="item", name="ei_energy-crystal", amount=20},
            {type="item", name="ei_steel-mechanical-parts", amount=8}
        },
        results = {{type="item", name="ei_advanced-centrifuge", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_advanced-centrifuge",
    },
    {
        name = "ei_advanced-centrifuge",
        type = "technology",
        icon = ei_graphics_tech_path.."advanced-centrifuge.png",
        icon_size = 256,
        prerequisites = {"automation-3"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_advanced-centrifuge"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "knowledge-computer-age",
    },
    {
        name = "ei_advanced-centrifuge",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        crafting_categories = {"centrifuging"},
        icon = ei_graphics_item_path.."advanced-centrifuge.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_advanced-centrifuge"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        crafting_speed = 3,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        allowed_effects = {"speed", "consumption", "pollution", "productivity"},
        module_slots = 4,
        energy_usage = "750kW",
        fluid_boxes = {
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.east, position = {2, 1}},
                },
                production_type = "input",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.east, position = {2, -1}},
                },
                production_type = "input",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.west, position = {-2, 1}},
                },
                production_type = "output",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.west, position = {-2, -1}},
                },
                production_type = "output",
            },
        },
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."advanced-centrifuge.png",
                size = {512,512},
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
                    filename = ei_graphics_entity_path.."advanced-centrifuge_animation.png",
                    size = {512,512},
                    shift = {0, 0},
    	            scale = 0.35,
                    line_length = 4,
                    lines_per_file = 4,
                    frame_count = 16,
                    animation_speed = 0.2,
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
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/centrifuge-1.ogg", volume = 0.2},
            apparent_volume = 0.1,
        },
    }
})