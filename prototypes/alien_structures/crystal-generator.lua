ei_data = require("lib/data")


--====================================================================================================
--CRYSTAL GENERATOR

--====================================================================================================

data:extend({
    {
        name = "ei_crystal-generator",
        type = "item",
        icon = ei_graphics_item_path.."combustion-turbine.png",
        icon_size = 64,
        subgroup = "energy",
        order = "b[steam-power]-c[crystal-generator]",
        place_result = "ei_crystal-generator",
        stack_size = 10
    },
    {
        name = "ei_crystal-generator",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {"advanced-circuit", 20},
            {"electric-engine-unit", 18},
            {"steel-plate", 16},
            {"ei_copper-mechanical-parts", 12},
            {"steam-engine", 4},
            {"concrete", 40}
        },
        result = "ei_crystal-generator",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_crystal-generator",
    },
    {
        name = "ei_crystal-generator",
        type = "electric-energy-interface",
        icon = ei_graphics_item_path.."combustion-turbine.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_crystal-generator"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-4.2, -4.3}, {4.2, 4.3}},
        selection_box = {{-4.3, -4.5}, {4.3, 4.5}},
        map_color = ei_data.colors.assembler,
        energy_source = {
            type = "electric",
            usage_priority = "primary-output",
            input_flow_limit = "2YW",
            output_flow_limit =  "20YW",
            buffer_capacity = "100MJ",
            render_no_power_icon = false
          },
        gui_mode = "none",
        max_power_output = "100TW",
        energy_production = '10kW',
        radius_visualisation_specification = {
            sprite = {
                filename = ei_graphics_other_path.."radius.png",
                width = 256,
                height = 256
            },
            distance = 20
        },
        animation = {
            filename = ei_graphics_entity_path.."combustion-turbine_animation.png",
            size = {512,512},
            width = 512,
            height = 512,
            shift = {0,-0.2},
	        scale = 0.65,
            line_length = 4,
            lines_per_file = 4,
            frame_count = 16,
            animation_speed = 0.2,
        },
        idle_animation = {
            filename = ei_graphics_entity_path.."combustion-turbine.png",
            size = {512,512},
            width = 512,
            height = 512,
            shift = {0,-0.2},
	        scale = 0.65,
            line_length = 1,
            -- lines_per_file = 2,
            frame_count = 1,
            animation_speed = 0.2,
            repeat_count = 16,
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/steam-turbine.ogg", volume = 0.2},
            apparent_volume = 0.3,
        },
    },
})



ei_data = require("lib/data")


--====================================================================================================
--CRYSTAL RESONATOR
--====================================================================================================

data:extend({
    {
        name = "ei_crystal-resonator",
        type = "item",
        icon = ei_graphics_item_path.."alien-beacon.png",
        icon_size = 64,
        subgroup = "energy",
        order = "b[steam-power]-c[crystal-resonator]",
        place_result = "ei_crystal-resonator",
        stack_size = 10
    },
    {
        name = "ei_crystal-resonator",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {"advanced-circuit", 20},
            {"electric-engine-unit", 18},
            {"steel-plate", 16},
            {"ei_copper-mechanical-parts", 12},
            {"steam-engine", 4},
            {"concrete", 40}
        },
        result = "ei_crystal-resonator",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_crystal-resonator",
    },
    {
        name = "ei_crystal-resonator",
        type = "recipe-category",
    },
    {
        name = "ei_crystal-resonator",
        type = "assembling-machine",
        result_inventory_size = 0,
        source_inventory_size = 1,
        crafting_categories = {"ei_crystal-resonator"},
        icon = ei_graphics_item_path.."alien-beacon.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_crystal-resonator"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        crafting_speed =1,
        energy_source = {
            type = 'electric',
            usage_priority = 'primary-input',
        },
        energy_usage = '10MW',
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
        },
        
        animation = {
            filename = ei_graphics_entity_path.."alien-beacon_animation.png",
            size = {512,512},
            shift = {0, 0.5},
	        scale = 0.35,
            line_length = 4,
            lines_per_file = 4,
            frame_count = 16,
            animation_speed = 0.4,
            run_mode = "backward",
        },
        radius_visualisation_specification = {
            sprite = {
                filename = ei_graphics_other_path.."radius.png",
                width = 256,
                height = 256
            },
            distance = 20
        },
    },
    -- Crystal resonator recipes
    {
        name = "ei_crystal_resonator:basic",
        type = "recipe",
        category = "ei_crystal-resonator",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_energy-crystal", amount = 1},
        },
        results = {},
        result_count = 1,
        enabled = false,
        hidden = true,
        icon = ei_graphics_other_path.."energy-injector-pylon.png",
        icon_size = 64,
        subgroup = "ei_black-hole",
        order = "b-a",
    },
    {
        name = "ei_crystal_resonator:overclocked",
        type = "recipe",
        category = "ei_crystal-resonator",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_energy-crystal", amount = 10},
        },
        results = {},
        result_count = 1,
        enabled = false,
        hidden = true,
        icon = ei_graphics_other_path.."energy-injector-pylon.png",
        icon_size = 64,
        subgroup = "ei_black-hole",
        order = "b-a",
    },
})

