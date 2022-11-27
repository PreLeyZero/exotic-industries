ei_data = require("lib/data")

--====================================================================================================
--CONTAINER
--====================================================================================================

data:extend({
    {
        name = "ei_2x2-container",
        type = "item",
        icon = ei_graphics_item_path.."basic-heat-pipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "energy",
        order = "f[nuclear-energy]-b[basic-heat-pipe]",
        place_result = "ei_2x2-container",
        stack_size = 50
    },
    {
        name = "ei_2x2-container",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"steel-plate", 1},
            {"ei_iron-ingot", 2},
            {"ei_copper-ingot", 2},
        },
        result = "ei_2x2-container",
        result_count = 1,
        enabled = true,
        always_show_made_in = true,
        main_product = "ei_2x2-container",
    },
    {
        name = "ei_2x2-container",
        type = "container",
        icon = ei_graphics_item_path.."basic-heat-pipe.png",
        icon_size = 64,
        selection_box = {{-1, -1}, {1, 1}},
        collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
        inventory_size = 200,
        picture = {
            filename = ei_graphics_entity_path.."2x2-container.png",
            priority = "extra-high",
            width = 256*2,
            height = 256*2,
            scale = 0.25,
        },
        minable = {
            mining_time = 1,
            result = "ei_2x2-container"
        },
    }
})
