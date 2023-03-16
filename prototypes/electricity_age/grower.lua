ei_data = require("lib/data")

--====================================================================================================
--GROWER
--====================================================================================================

data:extend({
    {
        name = "ei_growing",
        type = "recipe-category",
    },
    {
        name = "ei_grower",
        type = "item",
        icon = ei_graphics_item_path.."grower.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d-a-c-1",
        place_result = "ei_grower",
        stack_size = 50
    },
    {
        name = "ei_energy-crystal",
        type = "item",
        icon = ei_graphics_item_path.."energy-crystal.png",
        icon_size = 64,
        subgroup = "raw-material",
        order = "g",
        stack_size = 100
    },
    {
        name = "ei_grower",
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
        result = "ei_grower",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_grower",
    },
    {
        name = "ei_energy-crystal:washing",
        type = "recipe",
        category = "chemistry",
        energy_required = 15,
        ingredients = {
            {type = "fluid", name = "sulfuric-acid", amount = 100},
            {type = "fluid", name = "steam", amount = 50},
            {type = "item", name = "ei_sand", amount = 10},
        },
        results = {
            {type = "item", name = "ei_sand", amount = 9},
            {type = "item", name = "ei_energy-crystal", amount = 1, probability = 0.1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_energy-crystal",
    },
    {
        name = "ei_energy-crystal:growing",
        type = "recipe",
        category = "ei_growing",
        energy_required = 15,
        ingredients = {
            {type = "fluid", name = "ei_acidic-water", amount = 15},
            {type = "item", name = "ei_energy-crystal", amount = 1},
        },
        results = {
            {type = "item", name = "ei_energy-crystal", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_energy-crystal",
    },
    {
        name = "ei_grower",
        type = "technology",
        icon = ei_graphics_tech_path.."grower.png",
        icon_size = 256,
        prerequisites = {"sulfur-processing"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_grower"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_energy-crystal:growing"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_energy-crystal:washing"
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
        name = "ei_grower",
        type = "assembling-machine",
        icon = ei_graphics_item_path.."grower.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_grower"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_growing"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "450kW",
        allowed_effects = {"speed", "consumption", "pollution"},
        module_specification = {
            module_slots = 2
        },
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
            off_when_no_fluid_recipe = true
        },
        animation = {
            filename = ei_graphics_entity_path.."grower.png",
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
                filename = ei_graphics_entity_path.."grower_animation.png",
                size = {512,512},
                shift = {0, 0},
	            scale = 0.35,
                line_length = 6,
                lines_per_file = 6,
                frame_count = 36,
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
            sound = {filename = "__base__/sound/chemical-plant-3.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    }
})