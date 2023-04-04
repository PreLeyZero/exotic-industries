ei_data = require("lib/data")

--====================================================================================================
--BIO CHAMBER
--====================================================================================================

data:extend({
    {
        name = "ei_bio-chamber",
        type = "recipe-category",
    },
    {
        name = "ei_bio-chamber",
        type = "item",
        icon = ei_graphics_item_path.."bio-chamber.png",
        icon_size = 64,
        subgroup = "ei_alien-structures",
        order = "a-a",
        place_result = "ei_bio-chamber",
        stack_size = 50
    },
    {
        name = "ei_bio-chamber",
        type = "technology",
        icon = ei_graphics_tech_path.."bio-chamber.png",
        icon_size = 256,
        prerequisites = {"ei_quantum-computer", "ei_nano-factory"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bio-chamber"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_alien-seed:growing"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_alien-seed:harvesting"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_alien-resin:growing"
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
        name = "ei_bio-chamber",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {"ei_carbon-structure", 2},
            {"chemical-plant", 1},
            {"ei_glass", 30},
            {"ei_advanced-motor", 10}
        },
        result = "ei_bio-chamber",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_bio-chamber",
    },
    {
        name = "ei_bio-chamber",
        type = "assembling-machine",
        icon = ei_graphics_item_path.."bio-chamber.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_bio-chamber"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_bio-chamber"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "500kW",
        animation = {
            filename = ei_graphics_entity_path.."bio-chamber.png",
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
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_bio_chamber,
                pipe_connections = {
                    {type = "input", position = {2, 0}},
                },
                production_type = "input",
            },
            --[[
            {   
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_bio_chamber,
                pipe_connections = {
                    {type = "input", position = {0, -2}},
                },
                production_type = "input",
            },
            ]]
            {   
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_bio_chamber,
                pipe_connections = {
                    {type = "input", position = {-2, 0}},
                },
                production_type = "input",
            },
            --[[
            {   
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_bio_chamber,
                pipe_connections = {
                    {type = "input", position = {0, 2}},
                },
                production_type = "input",
            },
            ]]
            -- off_when_no_fluid_recipe = true
        },
        working_visualisations = {
            {
              animation = 
              {
                filename = ei_graphics_entity_path.."bio-chamber_animation.png",
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
    },
    {
        name = "ei_alien-seed:growing",
        type = "recipe",
        category = "ei_bio-chamber",
        energy_required = 20,
        ingredients = {
            {type = "fluid", name = "ei_oxygen-gas", amount = 200},
            {type = "fluid", name = "ei_crystal-solution", amount = 5},
            {type = "item", name = "ei_alien-seed", amount = 1},
            {type = "item", name = "ei_alien-resin", amount = 10},
        },
        results = {
            {type = "item", name = "ei_blooming-alien-seed", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_blooming-alien-seed",
    },
    {
        name = "ei_alien-seed:harvesting",
        type = "recipe",
        category = "chemistry",
        energy_required = 16,
        ingredients = {
            {type = "fluid", name = "ei_nitrogen-gas", amount = 100},
            {type = "item", name = "ei_blooming-alien-seed", amount = 4},
            {type = "item", name = "explosives", amount = 1},
        },
        results = {
            {type = "item", name = "ei_alien-seed", amount = 8},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_alien-seed",
    },
    {
        name = "ei_alien-resin:growing",
        type = "recipe",
        category = "ei_bio-chamber",
        energy_required = 30,
        ingredients = {
            {type = "fluid", name = "ei_oxygen-gas", amount = 10},
            {type = "fluid", name = "water", amount = 10},
            {type = "item", name = "ei_alien-seed", amount = 1},
        },
        results = {
            {type = "item", name = "ei_alien-resin", amount = 4},
            {type = "item", name = "ei_alien-seed", amount = 1, probability = 0.9},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_alien-resin",
    },
})