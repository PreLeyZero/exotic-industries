ei_data = require("lib/data")

--====================================================================================================
--ARC FURNACE
--====================================================================================================

data:extend({
    {
        name = "ei_arc-furnace",
        type = "recipe-category",
    },
    {
        name = "ei_arc-furnace",
        type = "item",
        icon = ei_graphics_item_path.."arc-furnace.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d-a-c-3",
        place_result = "ei_arc-furnace",
        stack_size = 50
    },
    {
        name = "ei_arc-furnace",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"chemical-plant", 1},
            {"electric-engine-unit", 6},
            {"storage-tank", 2},
            {"ei_steel-mechanical-parts", 8}
        },
        result = "ei_arc-furnace",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_arc-furnace",
    },
    {
        name = "ei_arc-furnace",
        type = "technology",
        icon = ei_graphics_tech_path.."arc-furnace.png",
        icon_size = 256,
        prerequisites = {"ei_purifier"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_arc-furnace"
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
        name = "ei_arc-furnace",
        type = "assembling-machine",
        icon = ei_graphics_item_path.."purifier.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_arc-furnace"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_purifier"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "450kW",
        fluid_boxes = {
            {   
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {type = "input", position = {3, 0}},
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
                    {type = "output", position = {-3, 0}},
                },
                production_type = "output",
            },
            off_when_no_fluid_recipe = true
        },
        animation = {
            filename = ei_graphics_entity_path.."arc-furnace.png",
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
                filename = ei_graphics_entity_path.."arc-furnace_animation.png",
                size = {512,512},
                shift = {0, 0},
	            scale = 0.35,
                line_length = 4,
                lines_per_file = 4,
                frame_count = 16,
                animation_speed = 0.4,
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
            sound = {filename = "__base__/sound/electric-furnace.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    },
})