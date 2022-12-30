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
            {"processing-unit", 12},
            {"ei_cooler", 1},
            {"ei_lead-plate", 25},
            {"ei_magnet", 20}
        },
        result = "ei_neutron-activator",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_neutron-activator",
    },
    {
        name = "ei_neutron-activator",
        type = "assembling-machine",
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
                pipe_picture = ei_pipe_electricity,
                pipe_connections = {
                    {type = "input", position = {2, 0}},
                },
                production_type = "input",
            },
            {   
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_electricity,
                pipe_connections = {
                    {type = "output", position = {-2, 0}},
                },
                production_type = "output",
            },
            {   
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_electricity,
                pipe_connections = {
                    {type = "output", position = {0, 2}},
                },
                production_type = "output",
            },
            -- off_when_no_fluid_recipe = true
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
    {
        name = "ei_deuterium:activator",
        type = "recipe",
        category = "ei_neutron-activator",
        energy_required = 4,
        ingredients = {
            {type = "fluid", name = "ei_protium", amount = 10},
            {type = "item", name = "ei_charged-neutron-container", amount = 1},
        },
        results = {
            {type = "item", name = "ei_neutron-container", amount = 1, probability = 0.95},
            {type = "fluid", name = "ei_protium", amount = 9},
            {type = "fluid", name = "ei_deuterium", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_deuterium",
    },
    {
        name = "ei_tritium:activator",
        type = "recipe",
        category = "ei_neutron-activator",
        energy_required = 4,
        ingredients = {
            {type = "fluid", name = "ei_deuterium", amount = 10},
            {type = "item", name = "ei_charged-neutron-container", amount = 1},
        },
        results = {
            {type = "item", name = "ei_neutron-container", amount = 1, probability = 0.95},
            {type = "fluid", name = "ei_deuterium", amount = 9},
            {type = "fluid", name = "ei_tritium", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_tritium",
    },
})