ei_data = require("lib/data")

--====================================================================================================
--NEUTRON ACTIVATOR
--====================================================================================================

data:extend({
    {
        name = "ei_neutron-activator",
        type = "recipe-category",
    },
    {
        name = "ei_neutron-activator",
        type = "item",
        icon = ei_graphics_item_path.."neutron-activator.png",
        icon_size = 64,
        subgroup = "ei_nuclear-buildings",
        order = "c-c",
        place_result = "ei_neutron-activator",
        stack_size = 50
    },
    {
        name = "ei_neutron-activator",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="processing-unit", amount=6},
            {type="item", name="ei_cooler", amount=1},
            {type="item", name="ei_lead-plate", amount=25},
            {type="item", name="ei_magnet", amount=10}
        },
        results = {{type="item", name="ei_neutron-activator", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_neutron-activator",
    },
    {
        name = "ei_neutron-activator",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."neutron-activator.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_neutron-activator"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_neutron-activator"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "500kW",
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."neutron-activator.png",
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
                    filename = ei_graphics_entity_path.."neutron-activator_animation.png",
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
        module_slots = 1,
        fluid_boxes = {
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_electricity,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.east, position = {1, 0}},
                },
                production_type = "input",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_electricity,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.west, position = {-1, 0}},
                },
                production_type = "output",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_electricity,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.south, position = {0, 1}},
                },
                production_type = "output",
            },
            -- off_when_no_fluid_recipe = true
        },
    },
    {
        name = "ei_deuterium__activator",
        type = "recipe",
        category = "ei_neutron-activator",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_protium", amount = 10},
            {type = "item", name = "ei_charged-neutron-container", amount = 1},
        },
        results = {
            {type = "item", name = "ei_neutron-container", amount = 1, probability = 0.97},
            {type = "fluid", name = "ei_protium", amount = 8},
            {type = "fluid", name = "ei_deuterium", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_deuterium",
    },
    {
        name = "ei_tritium__activator",
        type = "recipe",
        category = "ei_neutron-activator",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_deuterium", amount = 10},
            {type = "item", name = "ei_charged-neutron-container", amount = 1},
        },
        results = {
            {type = "item", name = "ei_neutron-container", amount = 1, probability = 0.97},
            {type = "fluid", name = "ei_deuterium", amount = 8},
            {type = "fluid", name = "ei_tritium", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_tritium",
    },
    {
        name = "ei_lithium-6__activator",
        type = "recipe",
        category = "ei_neutron-activator",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_lithium-7", amount = 10},
            {type = "item", name = "ei_charged-neutron-container", amount = 1},
        },
        results = {
            {type = "item", name = "ei_neutron-container", amount = 1, probability = 0.97},
            {type = "fluid", name = "ei_lithium-7", amount = 8},
            {type = "fluid", name = "ei_lithium-6", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_lithium-6",
    },
})