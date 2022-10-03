ei_data = require("lib/data")

--====================================================================================================
--WAVER FACTORY
--====================================================================================================

data:extend({
    {
        name = "ei_waver-factory",
        type = "item",
        icon = ei_graphics_item_path.."waver-factory.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "a",
        place_result = "ei_waver-factory",
        stack_size = 50
    },
    {
        name = "ei_waver-factory",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"electronic-circuit", 2},
            {"electric-engine-unit", 4},
            {"ei_iron-beam", 2},
            {"ei_copper-mechanical-parts", 6}
        },
        result = "ei_waver-factory",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_waver-factory",
    },
    {
        name = "ei_waver-factory",
        type = "technology",
        icon = ei_graphics_tech_path.."waver-factory.png",
        icon_size = 256,
        prerequisites = {"ei_electricity-power"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_waver-factory"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["electricity-age"],
            time = 20
        },
        age = "electricity-age",
    },
    {
        name = "ei_waver-factory",
        type = "assembling-machine",
        icon = ei_graphics_item_path.."waver-factory.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_waver-factory"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"crafting-with-fluid"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "150kW",
        fluid_boxes = {
            {   
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_electricity,
                pipe_connections = {
                    {type = "input", position = {2, 0}},
                },
                production_type = "input",
            },
            off_when_no_fluid_recipe = true
        },
        animation = {
            filename = ei_graphics_entity_path.."waver-factory.png",
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
        working_visualisations = {
            {
              animation = 
              {
                filename = ei_graphics_entity_path.."waver-factory_animation.png",
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
    }
})