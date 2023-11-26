ei_data = require("lib/data")

-- ====================================================================================================
-- CASTOR
-- ====================================================================================================

data:extend({{
    name = "ei_castor",
    type = "recipe-category"
}, {
    name = "ei_castor",
    type = "item",
    icon = ei_graphics_item_path .. "castor.png",
    icon_size = 64,
    subgroup = "ei_nuclear-buildings",
    order = "c-a",
    place_result = "ei_castor",
    stack_size = 50
}, {
    name = "ei_castor",
    type = "recipe",
    category = "crafting",
    energy_required = 1,
    ingredients = {{"advanced-circuit", 5}, {"storage-tank", 1}, {"ei_lead-plate", 50}, {"steel-plate", 12}},
    result = "ei_castor",
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
    main_product = "ei_castor"
}, {
    name = "ei_castor",
    type = "technology",
    icon = ei_graphics_tech_path .. "castor.png",
    icon_size = 256,
    prerequisites = {"nuclear-power"},
    effects = {{
        type = "unlock-recipe",
        recipe = "ei_castor"
    }},
    unit = {
        count = 100,
        ingredients = ei_data.science["electricity-age"],
        time = 20
    },
    age = "electricity-age"
}, {
    name = "ei_castor",
    type = "assembling-machine",
    icon = ei_graphics_item_path .. "castor.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {
        mining_time = 1,
        result = "ei_castor"
    },
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    map_color = ei_data.colors.assembler,
    crafting_categories = {"ei_castor"},
    crafting_speed = 1,
    energy_source = {
        type = 'void'
    },
    energy_usage = "1W",
    fixed_recipe = "ei_store-nuclear-waste",
    animation = {
        filename = ei_graphics_entity_path .. "castor.png",
        size = {512, 512},
        width = 512,
        height = 512,
        shift = {0, -0.1},
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
    working_visualisations = {{
        animation = {
            filename = ei_graphics_entity_path .. "castor_animation.png",
            size = {512, 512},
            width = 512,
            height = 512,
            shift = {0, -0.1},
            scale = 0.44 / 2,
            line_length = 1,
            lines_per_file = 1,
            frame_count = 1,
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
    name = "ei_store-nuclear-waste",
    type = "recipe",
    category = "ei_castor",
    energy_required = 60,
    ingredients = {{
        type = "item",
        name = "ei_nuclear-waste",
        amount = 1
    }},
    results = {},
    always_show_made_in = true,
    enabled = true,
    hidden = true,
    icon = ei_graphics_item_path .. "nuclear-waste.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[ei_nuclear-waste]"
}})
