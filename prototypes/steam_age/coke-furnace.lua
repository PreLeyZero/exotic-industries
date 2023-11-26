ei_lib = require("lib/lib")

-- ====================================================================================================
-- COKE FURNACE
-- ====================================================================================================

data:extend({{
    name = "ei_coke-furnace",
    type = "recipe-category"
}, {
    name = "ei_coke-furnace",
    type = "item",
    icon = ei_graphics_item_path .. "coke-furnace.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "smelting-machine",
    order = "a",
    place_result = "ei_coke-furnace",
    stack_size = 50
}, {
    name = "ei_coke-furnace",
    type = "recipe",
    category = "crafting",
    energy_required = 2,
    ingredients = {{"stone-furnace", 1}, {"stone-brick", 6}},
    result = "ei_coke-furnace",
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
    main_product = "ei_coke-furnace"
}})

local furnace = table.deepcopy(data.raw["furnace"]["stone-furnace"])
furnace.name = "ei_coke-furnace"
furnace.icon = ei_graphics_item_path .. "coke-furnace.png"
furnace.icon_size = 64
furnace.minable.result = "ei_coke-furnace"
furnace.crafting_categories = {"ei_coke-furnace"}

furnace.animation = {
    layers = {{
        filename = ei_graphics_entity_path .. "coke-furnace.png",
        frame_count = 1,
        height = 64,
        hr_version = {
            filename = ei_graphics_entity_path .. "hr-coke-furnace.png",
            frame_count = 1,
            height = 146,
            priority = "extra-high",
            scale = 0.5,
            shift = {-0.0078125, 0.1875},
            width = 151
        },
        priority = "extra-high",
        shift = {0.453125, 0.0625},
        width = 81
    }, {
        draw_as_shadow = true,
        filename = "__base__/graphics/entity/stone-furnace/stone-furnace-shadow.png",
        frame_count = 1,
        height = 64,
        hr_version = {
            draw_as_shadow = true,
            filename = "__base__/graphics/entity/stone-furnace/hr-stone-furnace-shadow.png",
            frame_count = 1,
            height = 74,
            priority = "extra-high",
            scale = 0.5,
            shift = {0.453125, 0.40625},
            width = 164
        },
        priority = "extra-high",
        shift = {0.453125, 0.0625},
        width = 81
    }}
}

data:extend({furnace})
