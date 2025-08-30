ei_data = require("lib/data")

--====================================================================================================
--COOLER
--====================================================================================================

data:extend({
    {
        name = "ei_cooler",
        type = "recipe-category",
    },
    {
        name = "ei_cooler",
        type = "item",
        icon = ei_graphics_item_path.."cooler.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d-a-c-4",
        place_result = "ei_cooler",
        stack_size = 50
    },
    {
        name = "ei_cooler",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="chemical-plant", amount=1},
            {type="item", name="electric-engine-unit", amount=6},
            {type="item", name="storage-tank", amount=2},
            {type="item", name="ei_steel-mechanical-parts", amount=8}
        },
        results = {{type="item", name="ei_cooler", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_cooler",
    },
    {
        name = "ei_liquid-nitrogen",
        type = "recipe",
        category = "ei_cooler",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_nitrogen-gas", amount = 50},
        },
        results = {
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 20},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_liquid-nitrogen",
    },
    {
        name = "ei_liquid-oxygen",
        type = "recipe",
        category = "ei_cooler",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_oxygen-gas", amount = 50},
        },
        results = {
            {type = "fluid", name = "ei_liquid-oxygen", amount = 20},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_liquid-oxygen",
    },
    {
        name = "ei_cooler",
        type = "technology",
        icon = ei_graphics_tech_path.."cooler.png",
        icon_size = 256,
        prerequisites = {"ei_computer-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_cooler"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_liquid-nitrogen"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_nitrogen-gas"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_nitrogen-gas__vent"
            },
            --[[
            {
                type = "unlock-recipe",
                recipe = "ei_extract-water"
            },
            ]]
            {
                type = "unlock-recipe",
                recipe = "ei_steam__vent"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_lufter"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_insulated-pipe"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_insulated-underground-pipe"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_insulated-tank"
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
        name = "ei_cooler",
        type = "furnace",
        result_inventory_size = 1,
        source_inventory_size = 0,
        crafting_categories = {"ei_cooler"},
        icon = ei_graphics_item_path.."cooler.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_cooler"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        allowed_effects = {"speed", "consumption", "pollution"},
        module_slots = 3,
        energy_usage = "5000kW",
        fluid_boxes = {
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.east, position = {2, 0}},
                },
                production_type = "input",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_insulated,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.west, position = {-2, 0}},
                },
                production_type = "output",
            },
        },
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."cooler.png",
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
                    filename = ei_graphics_entity_path.."cooler_animation.png",
                    size = {512,512},
                    shift = {0, 0},
    	            scale = 0.35,
                    line_length = 1,
                    lines_per_file = 1,
                    frame_count = 1,
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
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/chemical-plant-3.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    }
})