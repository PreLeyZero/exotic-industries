ei_data = require("lib/data")

--====================================================================================================
--NANO FACTORY
--====================================================================================================

data:extend({
    {
        name = "ei_nano-factory",
        type = "recipe-category",
    },
    {
        name = "ei_nano-factory",
        type = "item",
        icon = ei_graphics_item_path.."nano-factory.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d-a-c-6",
        place_result = "ei_nano-factory",
        stack_size = 50
    },
    {
        name = "ei_nano-factory",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {"ei_advanced-motor", 20},
            {"assembling-machine-3", 4},
            {"processing-unit", 20},
            {"ei_steel-mechanical-parts", 40}
        },
        result = "ei_nano-factory",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_nano-factory",
    },
    {
        name = "ei_nano-factory",
        type = "technology",
        icon = ei_graphics_tech_path.."nano-factory.png",
        icon_size = 256,
        prerequisites = {"ei_quantum-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_nano-factory"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_crushed-coal"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_carbon"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_carbon-nanotube"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_carbon-structure"
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
        name = "ei_nano-factory",
        type = "assembling-machine",
        icon = ei_graphics_item_path.."nano-factory.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_nano-factory"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        -- crafting_categories = {"ei_nano-factory", "crafting", "advanced-crafting", "crafting-with-fluid"},
        crafting_categories = {"ei_nano-factory"},
        crafting_speed = 2,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "4MW",
        allowed_effects = {"speed", "consumption", "pollution"},
        module_specification = {
            module_slots = 8
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
            filename = ei_graphics_entity_path.."nano-factory.png",
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
                filename = ei_graphics_entity_path.."nano-factory_animation.png",
                size = {512,512},
                shift = {0, 0},
	            scale = 0.35,
                line_length = 4,
                lines_per_file = 4,
                frame_count = 16,
                animation_speed = 0.1,
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
    {
        name = "ei_crushed-coal",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "coal", amount = 1},
        },
        results = {
            {type = "item", name = "ei_crushed-coal", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-coal",
    },
    {
        name = "ei_carbon",
        type = "recipe",
        category = "chemistry",
        energy_required = 5,
        ingredients = {
            {type = "item", name = "ei_crushed-coal", amount = 1},
            {type = "fluid", name = "sulfuric-acid", amount = 35},
            {type = "fluid", name = "steam", amount = 100},
        },
        results = {
            {type = "item", name = "ei_carbon", amount = 3},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_carbon",
    },
    {
        name = "ei_carbon-nanotube",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 60,
        ingredients = {
            {type = "item", name = "ei_carbon", amount = 5},
            {type = "item", name = "ei_crushed-coke", amount = 2},
            {type = "item", name = "explosives", amount = 1},
            {type = "fluid", name = "ei_nitric-acid", amount = 15},
        },
        results = {
            {type = "item", name = "ei_carbon-nanotube", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_carbon-nanotube",
    },
    {
        name = "ei_carbon-structure",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 120,
        ingredients = {
            {type = "item", name = "ei_carbon-nanotube", amount = 3},
            {type = "item", name = "low-density-structure", amount = 2},
            {type = "fluid", name = "ei_nitrogen-gas", amount = 100},
        },
        results = {
            {type = "item", name = "ei_carbon-structure", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_carbon-structure",
    },
})