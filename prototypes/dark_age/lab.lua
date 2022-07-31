-- add lab for dark age here
-- is available from game start

ei_data = require("lib/data")

--====================================================================================================
--DARK AGE LAB
--====================================================================================================
data:extend({
    {
        name = "ei_dark-age-lab",
        type = "item",
        icon = ei_graphics_item_path.."dark-age-lab.png",
        icon_size = 64,
        stack_size = 10,
        place_result = "ei_dark-age-lab",
        subgroup = "ei_labs",
        order = "a1",
    },
    {
        name = "ei_dark-age-lab",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"iron-plate", 6},
            {"ei_copper-mechanical-parts", 4},
            {"stone-brick", 4},
        },
        result = "ei_dark-age-lab",
        resutl_count = 1,
        enabled = true,
        always_show_made_in = true,
        main_product = "ei_dark-age-lab",
    },
    {
        name = "ei_dark-age-lab",
        type = "lab",
        icon = ei_graphics_item_path.."dark-age-lab.png",
        icon_size = 64,
        flags = {"placeable-player", "player-creation"},
        minable = {
            mining_time = 1, 
            result = "ei_dark-age-lab"
        },
        max_health = 250,
        corpse = "big-remnants",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        energy_source = {
            type = "burner",
            effectivity = 1,
            fuel_inventory_size = 1,
            emissions_per_minute = 6,
            burnt_inventory_size = 1,
            fuel_category = "chemical",
        },
        energy_usage = "200KW",
        researching_speed = 0.5,
        on_animation = {
            filename = ei_graphics_path.."graphics/256_empty.png",
            width = 256,
            height = 256,
            frame_count = 1,
            line_length = 1,
            shift = {0, 0},
            animation_speed = 1,    
        },
        off_animation = {
            filename = ei_graphics_path.."graphics/256_empty.png",
            width = 256,
            height = 256,
            frame_count = 1,
            line_length = 1,
            shift = {0, 0},
            animation_speed = 1,    
        },
        inputs = ei_data.lab_inputs["dark-age"]
    }
})