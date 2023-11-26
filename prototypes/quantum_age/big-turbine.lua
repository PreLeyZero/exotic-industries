ei_data = require("lib/data")

-- ====================================================================================================
-- BIG TURBINE
-- ====================================================================================================

data:extend({{
    name = "ei_big-turbine",
    type = "recipe-category"
}, {
    name = "ei_big-turbine",
    type = "item",
    icon = ei_graphics_item_path .. "big-turbine.png",
    icon_size = 64,
    subgroup = "ei_nuclear-buildings",
    order = "c-f",
    place_result = "ei_big-turbine",
    stack_size = 50
}, {
    name = "ei_big-turbine",
    type = "recipe",
    category = "crafting",
    energy_required = 20,
    ingredients = {{"ei_carbon-structure", 20}, {"steam-turbine", 10}, {"ei_steel-mechanical-parts", 25},
                   {"ei_advanced-motor", 20}},
    result = "ei_big-turbine",
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
    main_product = "ei_big-turbine"
}, {
    name = "ei_big-turbine",
    type = "generator",
    icon = ei_graphics_item_path .. "big-turbine.png",
    icon_size = 64,
    flags = {"player-creation", "placeable-neutral"},
    max_health = 300,
    corpse = "big-remnants",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    map_color = ei_data.colors.assembler,
    minable = {
        mining_time = 0.5,
        result = "ei_big-turbine"
    },
    effectivity = 1,
    energy_source = {
        type = "electric",
        usage_priority = "primary-output"
    },
    burns_fluid = true,
    fluid_usage_per_tick = ei_data.fusion.turbine_power / ei_data.fusion.coolant_fuel_value / 60,
    maximum_temperature = 1500,
    max_power_output = tostring(ei_data.fusion.turbine_power) .. "MW",
    fluid_box = {
        filter = "ei_critical-steam",
        base_area = 1,
        height = 2,
        base_level = -1,
        pipe_covers = pipecoverspictures(),
        pipe_connections = {{
            type = "input-output",
            position = {-4, 0}
        }, {
            type = "input-output",
            position = {4, 0}
        }, {
            type = "input-output",
            position = {0, 4}
        }, {
            type = "input-output",
            position = {0, -4}
        }},
        production_type = "input-output"
    },
    -- animation
    horizontal_animation = {
        layers = {{
            filename = ei_graphics_entity_path .. "big-turbine_animation.png",
            size = {512 * 2, 512 * 2},
            scale = 0.77 / 2,
            line_length = 5,
            lines_per_file = 5,
            frame_count = 25,
            animation_speed = 0.5,
            shift = {0, -0.5}
        }, {
            filename = ei_graphics_entity_path .. "big-turbine_pipe.png",
            size = {512 * 2, 512 * 2},
            scale = 0.77 / 2,
            line_length = 1,
            lines_per_file = 1,
            frame_count = 1,
            repeat_count = 25,
            animation_speed = 0.5,
            shift = {0, -0.5}
        }}
    },
    vertical_animation = {
        layers = {{
            filename = ei_graphics_entity_path .. "big-turbine_animation.png",
            size = {512 * 2, 512 * 2},
            scale = 0.77 / 2,
            line_length = 5,
            lines_per_file = 5,
            frame_count = 25,
            animation_speed = 0.5,
            shift = {0, -0.5}
        }, {
            filename = ei_graphics_entity_path .. "big-turbine_pipe.png",
            size = {512 * 2, 512 * 2},
            scale = 0.77 / 2,
            line_length = 1,
            lines_per_file = 1,
            frame_count = 1,
            repeat_count = 25,
            animation_speed = 0.5,
            shift = {0, -0.5}
        }}
    },
    smoke = {{
        name = "smoke",
        tape = "trival-smoke",
        frequency = 1,
        position = {0, -3},
        -- deviation = {x = -2, y = -2},
        duration = 1
    }},
    working_sound = {
        sound = {
            filename = "__base__/sound/chemical-plant-3.ogg"
        },
        apparent_volume = 0.3
    }
}})
