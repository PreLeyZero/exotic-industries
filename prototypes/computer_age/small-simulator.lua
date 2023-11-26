ei_data = require("lib/data")

-- ====================================================================================================
-- SMALL SIMULATOR
-- ====================================================================================================

data:extend({{
    name = "ei_small-simulator",
    type = "recipe-category"
}, {
    name = "ei_small-simulator",
    type = "item",
    icon = ei_graphics_item_path .. "small-simulator.png",
    icon_size = 64,
    subgroup = "ei_labs",
    order = "b2",
    place_result = "ei_small-simulator",
    stack_size = 50
}, {
    name = "ei_simulation-data",
    type = "item",
    icon = ei_graphics_item_path .. "simulation-data.png",
    icon_size = 128,
    subgroup = "ei_refining-tech",
    order = "a-a-b",
    stack_size = 200,
    pictures = {
        layers = {{
            size = 128,
            filename = ei_graphics_item_path .. "simulation-data.png",
            scale = 0.25 / 2
        }, {
            draw_as_light = true,
            flags = {"light"},
            size = 128,
            filename = ei_graphics_item_path .. "simulation-data_light.png",
            scale = 0.25 / 2
        }}
    }
}, {
    name = "ei_space-data",
    type = "item",
    icon = ei_graphics_item_path .. "space-data.png",
    icon_size = 128,
    subgroup = "ei_refining-tech",
    order = "a-a-c",
    stack_size = 200,
    pictures = {
        layers = {{
            size = 128,
            filename = ei_graphics_item_path .. "space-data.png",
            scale = 0.25 / 2
        }, {
            draw_as_light = true,
            flags = {"light"},
            size = 128,
            filename = ei_graphics_item_path .. "space-data_light.png",
            scale = 0.25 / 2
        }}
    }
}, {
    name = "ei_small-simulator",
    type = "recipe",
    category = "crafting",
    energy_required = 1,
    ingredients = {{"ei_electronic-parts", 4}, {"electric-engine-unit", 8}, {"steel-plate", 4},
                   {"ei_steel-mechanical-parts", 12}},
    result = "ei_small-simulator",
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
    main_product = "ei_small-simulator"
}, {
    name = "ei_small-simulator",
    type = "assembling-machine",
    icon = ei_graphics_item_path .. "small-simulator.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {
        mining_time = 1,
        result = "ei_small-simulator"
    },
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    map_color = ei_data.colors.assembler,
    crafting_categories = {"ei_small-simulator"},
    crafting_speed = 1,
    energy_source = {
        type = 'electric',
        usage_priority = 'secondary-input'
    },
    fixed_recipe = "ei_simulation-data",
    energy_usage = "500kW",
    animation = {
        filename = ei_graphics_entity_path .. "small-simulator.png",
        size = {512, 512},
        width = 512,
        height = 512,
        shift = {0, -0.2},
        scale = 0.44 / 2,
        line_length = 1,
        -- lines_per_file = 2,
        frame_count = 1
        -- animation_speed = 0.2,
    },
    allowed_effects = {"speed", "consumption", "pollution"},
    module_specification = {
        module_slots = 1
    },
    fluid_boxes = {{
        base_area = 1,
        base_level = -1,
        height = 2,
        pipe_covers = pipecoverspictures(),
        pipe_picture = ei_pipe_data,
        pipe_connections = {{
            type = "input",
            position = {2, 0}
        }},
        production_type = "input"
    } -- off_when_no_fluid_recipe = true
    },
    working_visualisations = {{
        animation = {
            filename = ei_graphics_entity_path .. "small-simulator_animation.png",
            size = {512, 512},
            width = 512,
            height = 512,
            shift = {0, -0.2},
            scale = 0.44 / 2,
            line_length = 4,
            lines_per_file = 4,
            frame_count = 16,
            animation_speed = 0.6,
            run_mode = "backward"
        }
    }, {
        light = {
            type = "basic",
            intensity = 1,
            size = 15
        }
    }}
}, {
    name = "ei_simulation-data",
    type = "recipe",
    category = "ei_small-simulator",
    energy_required = 5,
    ingredients = {{
        type = "fluid",
        name = "ei_computing-power",
        amount = 2
    }},
    results = {{
        type = "item",
        name = "ei_simulation-data",
        amount = 3
    }},
    always_show_made_in = true,
    enabled = false,
    main_product = "ei_simulation-data"
}})
