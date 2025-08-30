ei_lib = require("lib/lib")

--====================================================================================================
--COKE FURNACE
--====================================================================================================

data:extend({
    {
        name = "ei_coke-furnace",
        type = "recipe-category",
    },
    {
        name = "ei_coke-furnace",
        type = "item",
        icon = ei_graphics_item_path.."coke-furnace.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "smelting-machine",
        order = "a",
        place_result = "ei_coke-furnace",
        stack_size = 50
    },
    {
        name = "ei_coke-furnace",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {type="item", name="stone-furnace", amount=1},
            {type="item", name="stone-brick", amount=6},
        },
        results = {{type="item", name="ei_coke-furnace", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_coke-furnace",
    }
})

local furnace = table.deepcopy(data.raw["furnace"]["stone-furnace"])
furnace.name = "ei_coke-furnace"
furnace.icon = ei_graphics_item_path.."coke-furnace.png"
furnace.icon_size = 64
furnace.minable.result = "ei_coke-furnace"
furnace.crafting_categories = {"ei_coke-furnace"}

furnace.graphics_set = {
    animation = {
        layers = {
            {
                filename = ei_graphics_entity_path.."hr-coke-furnace.png",
                frame_count = 1,
                height = 146,
                priority = "extra-high",
                scale = 0.5,
                shift = {
                -0.0078125,
                0.1875
                },
                width = 151
            },
            {
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/stone-furnace/stone-furnace-shadow.png",
                frame_count = 1,
                height = 74,
                priority = "extra-high",
                scale = 0.5,
                shift = {
                0.453125,
                0.40625
                },
                width = 164
            }
        }
    }
}



data:extend({furnace})