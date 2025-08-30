-- this file contains the prototype definition for the stone quarry
-- made from kirazy's mining drill

local ei_data = require("lib/data")

--====================================================================================================
--DRY ANIMATION
--====================================================================================================

local drill_animations = {
    north = {
        layers = {
            {
                priority = "high",
                filename = ei_graphics_kirazy_path.."entity/hr-electric-mining-drill-N.png",
                line_length = 8,
                width = 196,
                height = 226,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(0, -8),
                run_mode = "forward-then-backward",
                scale = 0.5
            },
            {
                priority = "high",
                filename = ei_graphics_kirazy_path.."entity/hr-electric-mining-drill-N-drill-shadow.png",
                flags = { "shadow" },
                line_length = 8,
                width = 201,
                height = 223,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(1.25, -7.25),
                draw_as_shadow = true,
                run_mode = "forward-then-backward",
                scale = 0.5
            }
        }
    },
    east = {
        layers = {
            {
                priority = "high",
                filename = ei_graphics_kirazy_path.."entity/hr-electric-mining-drill-E.png",
                line_length = 8,
                width = 211,
                height = 197,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(3.75, -1.25),
                run_mode = "forward-then-backward",
                scale = 0.5
            },
            {
                priority = "high",
                filename = ei_graphics_kirazy_path.."entity/hr-electric-mining-drill-E-drill-shadow.png",
                flags = { "shadow" },
                line_length = 8,
                width = 221,
                height = 195,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(6.25, -0.25),
                draw_as_shadow = true,
                run_mode = "forward-then-backward",
                scale = 0.5
            },
        }
    },
    south = {
        layers = {
            {
                priority = "high",
                filename = ei_graphics_kirazy_path.."entity/hr-electric-mining-drill-S.png",
                line_length = 8,
                width = 196,
                height = 219,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(0, -1.25),
                run_mode = "forward-then-backward",
                scale = 0.5
            },
            {
                priority = "high",
                filename = ei_graphics_kirazy_path.."entity/hr-electric-mining-drill-S-drill-shadow.png",
                flags = { "shadow" },
                line_length = 8,
                width = 200,
                height = 206,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(1, 2.5),
                draw_as_shadow = true,
                run_mode = "forward-then-backward",
                scale = 0.5
            }
        }
    },
    west = {
        layers = {
            {
                priority = "high",
                filename = ei_graphics_kirazy_path.."entity/hr-electric-mining-drill-W.png",
                line_length = 8,
                width = 211,
                height = 197,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(-3.75, -0.75),
                run_mode = "forward-then-backward",
                scale = 0.5
            },
            {
                priority = "high",
                filename = ei_graphics_kirazy_path.."entity/hr-electric-mining-drill-W-drill-shadow.png",
                flags = { "shadow" },
                line_length = 8,
                width = 229,
                height = 195,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(1.25, -0.25),
                draw_as_shadow = true,
                run_mode = "forward-then-backward",
                scale = 0.5
            }
        }
    }
}

--====================================================================================================
--STONE QUARRY
--====================================================================================================

data:extend({
    {
        name = "ei_stone-quarry",
        type = "technology",
        icon = ei_graphics_kirazy_path.."technology/mining-productivity.png",
        icon_size = 128,
        age = "steam-age",
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_stone-quarry"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_stone-quarry__mining"
            }
        },
        prerequisites = {"ei_steam-age"},
        -- done by age tech revamp in data-updates
        -- just placeholders except time
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        

    },
    {
        name = "ei_stone-quarry",
        type = "item",
        icon = ei_graphics_kirazy_path.."icon/electric-mining-drill.png",
        icon_size = 64,
        icon_mipmaps = 4,
        place_result = "ei_stone-quarry",
        stack_size = 20,
        subgroup = "extraction-machine",
        order = "a[items]-a[stone-quarry]",
    },
    {
        name = "ei_stone-quarry",
        type = "recipe",
        enabled = false,
        ingredients = {
            {type="item", name="ei_copper-beam", amount=2},
            {type="item", name="ei_copper-mechanical-parts", amount=2},
            {type="item", name="burner-mining-drill", amount=1}
        },
        results = {{type="item", name="ei_stone-quarry", amount=1}},
        energy_required = 1,
    },
    {
        name = "ei_stone-quarry",
        type = "recipe-category",
    },
    {
        name = "ei_stone-quarry__mining",
        type = "recipe",
        category = "ei_stone-quarry",
        enabled = true,
        hidden = true,
        ingredients = {},
        results = {{type="item", name="stone", amount=1}},
        energy_required = 2,
    },
    {
        name = "ei_stone-quarry",
        type = "assembling-machine",
        icon = ei_graphics_kirazy_path.."icon/electric-mining-drill.png",
        icon_size = 64,
        icon_mipmaps = 4,
        flags = {"placeable-player", "player-creation"},
        max_health = 500,
        corpse = "big-remnants",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        map_color = ei_data.colors.miner,
        minable = {
            mining_time = 1,
            result = "ei_stone-quarry",
        },
        crafting_categories = {"ei_stone-quarry"},
        crafting_speed = 1,
        fixed_recipe = "ei_stone-quarry__mining",
        energy_source = {
            type = "burner",
            emissions_per_minute = {pollution=4},
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            smoke = {
                {
                    name = "smoke",
                    frequency = 5,
                    position = {0,-1.3},
                },
            },
            effectivity = 1,
            fuel_categories = {"chemical"},
        },
        energy_usage = "20kW",
        working_sound = {
            sound = {
                filename = "__base__/sound/electric-mining-drill.ogg",
                volume = 0.75,
            },
            idle_sound = {
                filename = "__base__/sound/idle1.ogg",
                volume = 0.6,
            },
            apparent_volume = 1.5,
        },

        -- since assembling machien has square collision box only north animation will get displayed
        graphics_set = {
            animation = drill_animations.north
        },
    },
})