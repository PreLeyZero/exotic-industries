ei_data = require("lib/data")

--====================================================================================================
--ADVANCED CHEM PLANT
--====================================================================================================

data:extend({
    {
        name = "ei_advanced-chem-plant",
        type = "recipe-category",
    },
    {
        name = "ei_advanced-chem-plant",
        type = "item",
        icon = ei_graphics_item_path.."advanced-chem-plant.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "e[chemical-plant]-a",
        place_result = "ei_advanced-chem-plant",
        stack_size = 50
    },
    {
        name = "ei_advanced-chem-plant",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {type="item", name="chemical-plant", amount=2},
            {type="item", name="ei_advanced-motor", amount=10},
            {type="item", name="storage-tank", amount=2},
            {type="item", name="ei_steel-mechanical-parts", amount=8}
        },
        results = {{type="item", name="ei_advanced-chem-plant", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_advanced-chem-plant",
    },
    {
        name = "ei_advanced-chem-plant",
        type = "technology",
        icon = ei_graphics_tech_path.."advanced-chem-plant.png",
        icon_size = 256,
        prerequisites = {"automation-3"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_advanced-chem-plant"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_ceramic__water"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_plastic__crushed-coke"
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
        name = "ei_ceramic__water",
        type = "recipe",
        category = "ei_advanced-chem-plant",
        energy_required = 3,
        ingredients = {
            {type = "item", name = "ei_sand", amount = 6},
            {type = "fluid", name = "water", amount = 60}
        },
        results = {
            {type = "item", name = "ei_ceramic", amount = 4},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_ceramic",
    },
    {
        name = "ei_plastic__crushed-coke",
        type = "recipe",
        category = "ei_advanced-chem-plant",
        energy_required = 24,
        ingredients = {
            {type = "item", name = "ei_crushed-coke", amount = 8},
            {type = "fluid", name = "petroleum-gas", amount = 60},
            {type = "fluid", name = "light-oil", amount = 40}
        },
        results = {
            {type = "item", name = "plastic-bar", amount = 28},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "plastic-bar",
    },
    {
        name = "ei_advanced-chem-plant",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        crafting_categories = {"chemistry", "ei_advanced-chem-plant"},
        icon = ei_graphics_item_path.."advanced-chem-plant.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_advanced-chem-plant"
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
        energy_usage = "500kW",
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
                filename = ei_graphics_entity_path.."advanced-chem-plant.png",
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
                    filename = ei_graphics_entity_path.."advanced-chem-plant_animation.png",
                    size = {512,512},
                    shift = {0, 0},
    	            scale = 0.35,
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
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/chemical-plant-3.ogg", volume = 0.2},
            apparent_volume = 0.1,
        },
    }
})