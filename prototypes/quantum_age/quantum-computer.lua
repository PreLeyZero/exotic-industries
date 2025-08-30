ei_data = require("lib/data")

--====================================================================================================
--QUANTUM COMPUTER
--====================================================================================================

data:extend({
    {
        name = "ei_quantum-computer",
        type = "recipe-category",
    },
    {
        name = "ei_quantum-computer",
        type = "item",
        icon = ei_graphics_item_path.."quantum-computer.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b3",
        place_result = "ei_quantum-computer",
        stack_size = 20
    },
    {
        name = "ei_quantum-computer",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients =
        {
            {type="item", name="ei_computer-core", amount=4},
            {type="item", name="ei_magnet", amount=40},
            {type="item", name="refined-concrete", amount=200},
            {type="item", name="processing-unit", amount=100}
        },
        results = {{type="item", name="ei_quantum-computer", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_quantum-computer",
    },
    {
        name = "ei_quantum-computer",
        type = "technology",
        icon = ei_graphics_tech_path.."quantum-computer.png",
        icon_size = 256,
        prerequisites = {"ei_neodym-refining"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_quantum-computer"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_superior-data"
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
        name = "ei_quantum-computer",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."quantum-computer.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_quantum-computer"
        },
        max_health = 1000,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-5.4, -5.4}, {5.4, 5.4}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_quantum-computer"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "100MW",
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_slots = 1,
        fluid_boxes = {
            {   
                -- filter = "ei_computing-power",
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_data,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.east, position = {5, 0}},
                },
                production_type = "input",
            },
            {   
                -- filter = "ei_computing-power",
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_data,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.west, position = {-5, 0}},
                },
                production_type = "input",
            },
            {   
                -- filter = "ei_liquid-nitrogen",
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_nitrogen,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.south, position = {0, 5}},
                },
                production_type = "input",
            },
            {   
                -- filter = "ei_liquid-nitrogen",
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_nitrogen,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.north, position = {0, -5}},
                },
                production_type = "input",
            },
        },
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."quantum-computer.png",
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
                    filename = ei_graphics_entity_path.."quantum-computer_animation.png",
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
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/nuclear-reactor-1.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    },
    {
        name = "ei_superior-data",
        type = "recipe",
        category = "ei_quantum-computer",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_computing-power", amount = 100},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 100},
            {type = "item", name = "ei_simulation-data", amount = 6},
            {type = "item", name = "ei_space-data", amount = 2},
            {type = "item", name = "ei_fission-tech", amount = 2}
        },
        results = {
            {type = "item", name = "ei_superior-data", amount = 10}
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_superior-data",
    },
    {
        name = "ei_superior-data",
        type = "item",
        icon = ei_graphics_item_path.."superior-data.png",
        icon_size = 128,
        subgroup = "ei_refining-tech",
        order = "a-a-d",
        stack_size = 200,
        pictures = {
            layers =
            {
              {
                size = 128,
                filename = ei_graphics_item_path.."superior-data.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."superior-data_light.png",
                scale = 0.25
              }
            }
          },
    },
})