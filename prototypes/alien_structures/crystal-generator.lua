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
        order = "b[steam-power]-c[combustion-turbine]",
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
--CRYSTAL GENERATOR
-- sin(x)^{18}*sin(2x-0.5)* 8 + cos(2x)/2
--====================================================================================================

data:extend({
    {
        name = "ei_crystal-generator",
        type = "item",
        icon = ei_graphics_item_path.."combustion-turbine.png",
        icon_size = 64,
        subgroup = "energy",
        order = "b[steam-power]-c[combustion-turbine]",
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

