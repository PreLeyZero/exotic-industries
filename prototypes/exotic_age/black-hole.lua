ei_data = require("lib/data")

--====================================================================================================
--BLACK HOLE
--====================================================================================================

data:extend({
    {
        name = "ei_black-hole",
        type = "item",
        icon = ei_graphics_item_path.."black-hole.png",
        icon_size = 64,
        subgroup = "ei_black-hole",
        order = "a-a",
        place_result = "ei_black-hole",
        stack_size = 1
    },
    {
        name = "ei_black-hole",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {"ei_crusher", 1},
            {"ei_advanced-motor", 4},
            {"ei_steel-mechanical-parts", 6}
        },
        result = "ei_black-hole",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_black-hole",
    },
    {
        name = "ei_black-hole",
        type = "technology",
        icon = ei_graphics_tech_path.."black-hole.png",
        icon_size = 256,
        prerequisites = {"ei_black-hole-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_black-hole"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["black-hole-exotic-age"],
            time = 20
        },
        age = "black-hole-exotic-age",
    },
    {
        name = "ei_black-hole",
        type = "container",
        icon = ei_graphics_item_path.."black-hole.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 4, result = "ei_black-hole"},
        max_health = 10000,
        corpse = "big-remnants",
        inventory_size = 100,
        collision_box = {{-5.4, -5.4}, {5.4, 5.4}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        picture =
        {
            filename = ei_graphics_entity_path.."black-hole.png",
            priority = "extra-high",
            width = 512,
            height = 512,
            scale = 0.68,
        },
        radius_visualisation_specification = {
            sprite = {
                filename = ei_graphics_other_path.."radius.png",
                width = 256,
                height = 256
            },
            distance = 20
        },
    }
})