ei_data = require("lib/data")

--====================================================================================================
--ADVANCED REFINERY
--====================================================================================================

data:extend({
    {
        name = "ei_advanced-refinery",
        type = "recipe-category",
    },
    {
        name = "ei_advanced-refinery",
        type = "item",
        icon = ei_graphics_item_path.."advanced-refinery.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d[refinery]-a",
        place_result = "ei_advanced-refinery",
        stack_size = 50
    },
    {
        name = "ei_advanced-refinery",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {"oil-refinery", 2},
            {"ei_advanced-motor", 10},
            {"storage-tank", 2},
            {"ei_steel-mechanical-parts", 8}
        },
        result = "ei_advanced-refinery",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_advanced-refinery",
    },
    {
        name = "ei_advanced-refinery",
        type = "technology",
        icon = ei_graphics_tech_path.."advanced-refinery.png",
        icon_size = 1024,
        prerequisites = {"ei_advanced-chem-plant", "ei_cooler"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_advanced-refinery"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_advanced-destill-tower"
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
        name = "ei_advanced-refinery",
        type = "assembling-machine",
        crafting_categories = {"oil-processing", "ei_advanced-refinery"},
        icon = ei_graphics_item_path.."advanced-refinery.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_advanced-refinery"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        map_color = ei_data.colors.assembler,
        crafting_speed = 3,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = 10,
        },
        allowed_effects = {"speed", "consumption", "pollution", "productivity"},
        module_specification = {
            module_slots = 4
        },
        energy_usage = "500kW",
        fluid_boxes = {
            {   
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {type = "input", position = {4, 1}},
                },
                production_type = "input",
            },
            {   
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {type = "input", position = {4, -1}},
                },
                production_type = "input",
            },
            {   
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {type = "output", position = {-4, 1}},
                },
                production_type = "output",
            },
            {   
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {type = "output", position = {-4, -1}},
                },
                production_type = "output",
            },
            {   
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {type = "output", position = {1, 4}},
                },
                production_type = "output",
            },
            {   
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {type = "output", position = {-1, 4}},
                },
                production_type = "output",
            },
            {   
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {type = "output", position = {1, -4}},
                },
                production_type = "output",
            },
            {   
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {type = "output", position = {-1, -4}},
                },
                production_type = "output",
            },
        },
        animation = {
            filename = ei_graphics_entity_path.."advanced-refinery.png",
            size = {512*2, 512*2},
            shift = {0, -0.35},
	        scale = 0.51,
            line_length = 1,
            --lines_per_file = 2,
            frame_count = 1,
            -- animation_speed = 0.2,
        },
        working_visualisations = {
            {
              animation = 
              {
                filename = ei_graphics_entity_path.."advanced-refinery_animation.png",
                size = {512*2, 512*2},
                shift = {0, -0.35},
	            scale = 0.51,
                line_length = 4,
                lines_per_file = 4,
                frame_count = 16,
                animation_speed = 0.5,
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
            sound = {filename = "__base__/sound/oil-refinery.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    }
})