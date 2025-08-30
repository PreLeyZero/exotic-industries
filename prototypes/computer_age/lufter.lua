ei_data = require("lib/data")

--====================================================================================================
--LUFTER
--====================================================================================================

data:extend({
    {
        name = "ei_lufter",
        type = "recipe-category",
    },
    {
        name = "ei_lufter",
        type = "item",
        icon = ei_graphics_item_path.."lufter.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d-a-c",
        place_result = "ei_lufter",
        stack_size = 50
    },
    {
        name = "ei_lufter",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="electronic-circuit", amount=2},
            {type="item", name="electric-engine-unit", amount=4},
            {type="item", name="steel-plate", amount=4},
            {type="item", name="ei_steel-mechanical-parts", amount=12}
        },
        results = {{type="item", name="ei_lufter", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_lufter",
    },
    {
        name = "ei_lufter",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."lufter.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_lufter"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_lufter"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "300kW",
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."lufter.png",
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
                    filename = ei_graphics_entity_path.."lufter_animation.png",
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
        allowed_effects = {"speed", "consumption", "pollution"},
        module_slots = 3,
        fluid_boxes = {
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_electricity,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.east, position = {1, 0}},
                },
                production_type = "output",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_electricity,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.west, position = {-1, 0}},
                },
                production_type = "input",
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        working_sound =
        {
            sound = {filename = "__base__/sound/electric-mining-drill.ogg", volume = 0.8},
            apparent_volume = 0.3,
        },
    },
    {
        name = "ei_nitrogen-gas",
        type = "recipe",
        category = "ei_lufter",
        energy_required = 1,
        ingredients = {},
        results = {
            {type = "fluid", name = "ei_nitrogen-gas", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_nitrogen-gas",
    },
    {
        name = "ei_nitrogen-gas__vent",
        type = "recipe",
        category = "ei_lufter",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_nitrogen-gas", amount = 20},
        },
        results = {},
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."vent_nitrogen.png",
        icon_size = 64,
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-h[ei_nitrogen-gas__vent]"
    },
    {
        name = "ei_oxygen-gas",
        type = "recipe",
        category = "ei_lufter",
        energy_required = 1,
        ingredients = {},
        results = {
            {type = "fluid", name = "ei_oxygen-gas", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_oxygen-gas",
    },
    {
        name = "ei_oxygen-gas__vent",
        type = "recipe",
        category = "ei_lufter",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_oxygen-gas", amount = 20},
        },
        results = {},
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."vent_oxygen.png",
        icon_size = 64,
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-h[ei_oxygen-gas__vent]"
    },
    {
        name = "ei_extract-water",
        type = "recipe",
        category = "ei_lufter",
        energy_required = 1,
        ingredients = {},
        results = {
            {type = "fluid", name = "water", amount = 50},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "water",
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-j[water]"
    },
    {
        name = "ei_steam__vent",
        type = "recipe",
        category = "ei_lufter",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "steam", amount = 50},
        },
        results = {},
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."vent_steam.png",
        icon_size = 64,
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-i[ei_steam__vent]"
    },
})